import 'dart:convert';
import 'package:astrology_app/constants/app_constants.dart';
import 'package:astrology_app/controllers/snackbar_controller.dart';
import 'package:astrology_app/data/models/error_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' hide Response;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient extends GetxService {
  final String? appBaseUrl;
  final SharedPreferences sharedPreferences;
  static final String noInternetMessage = 'connection_to_api_server_failed'.tr;
  final int timeoutInSeconds = 30;
  final snackbarController = Get.find<CustomSnackBarController>();
  final dio = Dio(
    BaseOptions(baseUrl: AppConstants.baseUrl),
  );
  bool isRefreshingToken = false;
  ApiClient({
    required this.appBaseUrl,
    required this.sharedPreferences,
  })
  {
    dio.interceptors.clear();
    // Add the interceptor during initialization
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Modify the request as needed
        options.headers = updateHeader(options.headers);
        return handler.next(options);
      },
      onError: (e, handler) async {
        if (e.response?.statusCode == 401) {
          // Handle token refreshing here
          if (!isRefreshingToken) {
            // Add a flag to prevent recursion
            isRefreshingToken = true;
            clearAccessToken();
            final refreshResponse = await refreshToken();
            isRefreshingToken = false;
            if (refreshResponse != null && refreshResponse.statusCode == 200) {
              setAccessToken(refreshResponse.data["accessToken"]);
              setRefreshToken(refreshResponse.data["refreshToken"]);
              // Retry the original request
              dio.request(e.requestOptions.path,
                  options: Options(method: e.requestOptions.method));
            }
          }
        } else {
          // Show a progress bar for other errors
          
              snackbarController.showSnackbar(title: "Fetching Details...",message: '',isShowProgressbar: true,);
        }
      },
    ));
  }

  Map<String, dynamic> updateHeader(Map<String, dynamic> header) {
    if (getAccessToken() != '') {
      header["Athorization"] = getAccessToken();
      return header;
    } else {
      if (getRefreshToken() != '') {
        header["Athorization"] = getRefreshToken();
        return header;
      } else {
        return header;
      }
    }
  }

  String getAccessToken() {
    return sharedPreferences.getString(AppConstants.accessToken) ?? "";
  }

  String getRefreshToken() {
    return sharedPreferences.getString(AppConstants.refreshToken) ?? "";
  }

  void setAccessToken(String token) async {
    sharedPreferences.setString(AppConstants.accessToken, token);
  }

  void setRefreshToken(String token) async {
    sharedPreferences.setString(AppConstants.refreshToken, token);
  }

  void clearAccessToken() {
    sharedPreferences.remove(AppConstants.accessToken);
  }

  Future<Response> refreshToken() async {
    return await getData(AppConstants.refreshUri);
  }

  Future<Response> getData(String uri, {Map<String, dynamic>? query}) async {
    Map<String, dynamic>? headers = updateHeader(AppConstants.configheader);
    // print('====> API Call: $uri\nHeader: $headers');
    try {
      print('====> API Call: $uri\nHeader: $headers');
      Response response = await dio
          .get(uri, options: Options(headers: headers), queryParameters: query)
          .timeout(
            Duration(seconds: timeoutInSeconds),
          );

      print("response => ${response.data.toString()}");

      return handleResponse(response, uri);
    } catch (e) {
      return Response(
          requestOptions: RequestOptions(),
          statusCode: 1,
          statusMessage: noInternetMessage);
    }
  }

  Future<Response> postData(
    String? uri,
    dynamic body,
  ) async {
    Map<String, dynamic>? headers = updateHeader(AppConstants.configheader);
    print('====> API Call: $uri\nHeader: $headers');
    print('====> body : ${body.toString()}');
    try {
      Response response = await dio
          .post(
            uri!,
            options: Options(
              headers: headers,
            ),
            data: body,
          )
          .timeout(Duration(seconds: timeoutInSeconds));

      return handleResponse(response, uri);
    } catch (e) {
      return Response(
          requestOptions: RequestOptions(),
          statusCode: 1,
          statusMessage: noInternetMessage);
    }
  }

  // Future<Response> postMultipartDataConversation(
  //   String? uri,
  //   Map<String, String> body,
  //   List<MultipartBody>? multipartBody, {
  //   Map<String, String>? headers,
  //   File? otherFile,
  // }) async {
  //   Map<String, String>? headers = updateHeader(AppConstants.configheader);
  //   headers.remove("Content-Type");
  //   dio.MultipartRequest request =
  //       dio.MultipartRequest('POST', Uri.parse(appBaseUrl! + uri!));
  //   request.headers.addAll(headers!);

  //   var stream = dio.ByteStream(otherFile!.openRead());
  //   stream.cast();
  //   var length = await otherFile.length();

  //   if (otherFile != null) {
  //     request.files.add(dio.MultipartFile(
  //         'files[${multipartBody!.length}]', stream, length,
  //         filename: basename(otherFile.path.split('/').last)));
  //   }
  //   if (multipartBody != null) {
  //     for (MultipartBody multipart in multipartBody) {
  //       Uint8List list = await multipart.file.readAsBytes();
  //       request.files.add(dio.MultipartFile(
  //         multipart.key!,
  //         multipart.file.readAsBytes().asStream(),
  //         list.length,
  //         filename: '${DateTime.now().toString()}.png',
  //       ));
  //     }
  //   }
  //   request.fields.addAll(body);
  //   dio.Response response = await dio.Response.fromStream(await request.send());
  //   return handleResponse(response, uri);
  // }

  // Future<Response> postMultipartData(
  //   String? uri,
  //   Map<String, String> body,
  //   List<MultipartBody>? multipartBody,
  // ) async {
  //   Map<String, String>? headers = updateHeader(AppConstants.configheader);
  //   headers.remove("Content-Type");
  //   try {
  //     dio.MultipartRequest request =
  //         dio.MultipartRequest('POST', Uri.parse(appBaseUrl! + uri!));
  //     request.headers.addAll(headers!);
  //     for (MultipartBody multipart in multipartBody!) {
  //       if (kIsWeb) {
  //         Uint8List list = await multipart.file.readAsBytes();
  //         dio.MultipartFile part = dio.MultipartFile(
  //           multipart.key!,
  //           multipart.file.readAsBytes().asStream(),
  //           list.length,
  //           filename: basename(multipart.file.path),
  //           contentType: MediaType('image', 'jpg'),
  //         );
  //         request.files.add(part);
  //       } else {
  //         File file = File(multipart.file.path);
  //         request.files.add(dio.MultipartFile(
  //           multipart.key!,
  //           file.readAsBytes().asStream(),
  //           file.lengthSync(),
  //           filename: file.path.split('/').last,
  //         ));
  //       }
  //     }
  //     request.fields.addAll(body);
  //     dio.Response response =
  //         await dio.Response.fromStream(await request.send());
  //     return handleResponse(response, uri);
  //   } catch (e) {
  //     return Response(statusCode: 1, statusText: noInternetMessage);
  //   }
  // }

  Future<Response> putData(
    String? uri,
    dynamic body,
  ) async {
    Map<String, dynamic>? headers = updateHeader(AppConstants.configheader);
    headers.remove("Content-Type");
    print('====> body : ${body.toString()}');
    try {
      Response response = await dio
          .put(
            uri!,
            data: body,
            options: Options(
              headers: headers,
            ),
          )
          .timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(response, uri);
    } catch (e) {
      return Response(
          requestOptions: RequestOptions(),
          statusCode: 1,
          statusMessage: noInternetMessage);
    }
  }

  Future<Response> deleteData(String? uri) async {
    Map<String, dynamic>? headers = updateHeader(AppConstants.configheader);
    headers.remove("Content-Type");
    try {
      Response response = await dio
          .delete(
            uri!,
            options: Options(
              headers: headers,
            ),
          )
          .timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(response, uri);
    } catch (e) {
      return Response(
          requestOptions: RequestOptions(),
          statusCode: 1,
          statusMessage: noInternetMessage);
    }
  }

  Response handleResponse(Response response, String? uri) {
    dynamic body;
    try {
      body = jsonDecode(response.data);
    } catch (e) {
      if (kDebugMode) {
        print("");
      }
    }
    Response response0 = Response(
      requestOptions: RequestOptions(path: uri!),
      data: body ?? response.data,
      headers: response.headers,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
    if (response0.statusCode != 200 &&
        response0.data != null &&
        response0.data is! String) {
      if (response0.data.toString().startsWith('{status:')) {
        ErrorsModel errorResponse = ErrorsModel.fromJson(response0.data);
        response0 = Response(
            requestOptions: RequestOptions(),
            statusCode: response0.statusCode,
            data: response0.data,
            statusMessage: errorResponse.responseCode);
      } else if (response0.data.toString().startsWith('{message')) {
        response0 = Response(
            requestOptions: RequestOptions(),
            statusCode: response0.statusCode,
            data: response0.data,
            statusMessage: response0.data['message']);
      } else if (response0.data.toString().startsWith('{accesstoken')) {
        response0 = Response(
            requestOptions: RequestOptions(),
            statusCode: response0.statusCode,
            data: response0.data,
            statusMessage: response0.data['accesstoken']);
      }
    } else if (response0.statusCode != 200 && response0.data == null) {
      response0 = Response(
          requestOptions: RequestOptions(),
          statusCode: 1,
          statusMessage: noInternetMessage);
    }
    if (foundation.kDebugMode) {
      debugPrint(
          '====> API Response: [${response0.statusCode}] $uri\n${response0.data}');
    }
    return response0;
  }
}

class MultipartBody {
  String? key;
  XFile file;

  MultipartBody(this.key, this.file);
}
