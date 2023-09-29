import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:astrology_app/constants/app_constants.dart';

class Services {
  static Future<dynamic> matchKundli(
      String boyName,
      String boyId,
      String boyDob,
      String boyTob,
      String boyLong,
      String boyLati,
      String girlName,
      String girlId,
      String girlDob,
      String girlTob,
      String girlLong,
      String girlLati) async {
    try {
      const apiUrl = "/kundlis_create";

      final Map<String, String> headers = {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InJhbWVzMzI0QGdtYWlsLmNvbSIsImlkIjoxMDUsImlhdCI6MTY4OTQwMzI2NywiZXhwIjoxNjkxMTMxMjY3fQ.ofyxdoM6UAQFZaTMuth4Nn-WO63pRwND3VZPkBAS4dI',
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Connection': 'keep-alive',
      };

      var body = json.encode({
        "boy_name": boyName,
        "boys_id": boyId = "177",
        "boy_gender": "male",
        "boy_date_of_birth": boyDob,
        "boy_time_of_birth": boyTob,
        "boy_place": "$boyLati,$boyLong",
        "girl_name": girlName,
        "girls_id": girlId = "177",
        "girl_gender": "female",
        "girl_date_of_birth": girlDob,
        "girl_time_of_birth": girlTob,
        "girl_place": "$girlLati,$girlLong"
      });

      final uri = Uri.https(AppConstants.baseUrl, apiUrl);
      final response = await http.post(uri, headers: headers, body: body);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return jsonResponse;
      } else {
        debugPrint('No Data Found Try Again !!');
        //return dynamic;
      }
    } on SocketException {
      debugPrint('No Internet Connection !!');
    } on http.ClientException {
      debugPrint('Connection Problem with Server !!');
    } catch (e) {
      debugPrint('Something Happended Please Try Again !!');
    }
  }

  static Future<List<dynamic>> getAstrologerFollowingList() async {
    try {
      const apiUrl = '/followings/34';

      final Map<String, String> headers = {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZV9udW1iZXIiOiI3MDE4MTgwOTM3Iiwib3RwIjoiMzM3NyIsImlhdCI6MTY4NzM0MDY0MX0.xPO_5JbwBcCkW8CdKcdOaUTwb9RolzkI2QbZipakSC4',
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Connection': 'keep-alive',
      };

      final uri = Uri.https(AppConstants.baseUrl, apiUrl);
      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        //print(jsonResponse);
        return jsonResponse;
      } else {
        debugPrint('No Data Found Try Again !!');
        return List<dynamic>.empty();
      }
    } on SocketException {
      debugPrint('No Internet Connection !!');
      return List<dynamic>.empty();
    } on http.ClientException {
      debugPrint('Connection Problem with Server !!');
      return List<dynamic>.empty();
    } catch (e) {
      debugPrint('Something Happended Please Try Again !!');
      return List<dynamic>.empty();
    }
  }

  static Future<dynamic> userLogin(String phoneNumber) async {
    try {
      const apiUrl = "/user/login-user";

      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Connection': 'keep-alive',
      };

      var body = json.encode({"phone_number": phoneNumber});

      final uri = Uri.https(AppConstants.baseUrl, apiUrl);
      final response = await http.post(uri, headers: headers, body: body);
      //print(response.body);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return jsonResponse;
      } else {
        debugPrint('No Data Found Try Again !!');
        //return dynamic;
      }
    } on SocketException {
      debugPrint('No Internet Connection !!');
    } on http.ClientException {
      debugPrint('Connection Problem with Server !!');
    } catch (e) {
      debugPrint('Something Happended Please Try Again !!');
    }
  }

  static Future<dynamic> verifyUser(String phoneNumber,String otp) async {
    try {
      const apiUrl = "user/login-user/verify";

      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Connection': 'keep-alive',
      };

      var body = json.encode({
        "phone_number": phoneNumber,
        "otp": otp,
      });

      final uri = Uri.https(AppConstants.baseUrl, apiUrl);
      final response = await http.post(uri, headers: headers, body: body);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return jsonResponse;
      } else {
        debugPrint('No Data Found Try Again !!');

        //return dynamic;
      }
    } on SocketException {
      debugPrint('No Internet Connection !!');
    } on http.ClientException {
      debugPrint('Connection Problem with Server !!');
    } catch (e) {
      debugPrint('Something Went Wrong Please Try Again !!');
    }
  }

  static Future<dynamic> readPalm(File imageFile) async {
    try {
      const apiUrl = "/read-palm";

      // open a bytestream
      var stream = http.ByteStream(imageFile.openRead());
      stream.cast();
      // get file length
      var length = await imageFile.length();

      final Map<String, String> headers = {
        'Content-Type': "multipart/form-data",
        'Accept': '*/*',
        'Connection': 'keep-alive',
      };

      final uri = Uri.https(AppConstants.baseUrl, apiUrl);
      final request = http.MultipartRequest("POST", uri);

      request.fields["user_id"] = "3";
      var multiport = http.MultipartFile("image", stream, length,
          filename: imageFile.path.split('/').last);

      request.files.add(multiport);

      request.headers.addAll(headers);
      var res = await request.send();
      //print("My res $res");
      http.Response response = await http.Response.fromStream(res);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        //print(response.body);
        return jsonResponse;
      } else {
        debugPrint('No Data Found Try Again !!');
        //return dynamic;
      }
    } on SocketException {
      debugPrint('No Internet Connection !!');
    } on http.ClientException {
      debugPrint('Connection Problem with Server !!');
    } catch (e) {
      debugPrint('Something Happended Please Try Again !!');
    }
  }

  static Future<dynamic> userRaiseTicket(
      String subject, String description) async {
    try {
      const apiUrl = '/tickets1';

      final Map<String, String> headers = {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZV9udW1iZXIiOiI3MDE4MTgwOTM3Iiwib3RwIjoiMzM3NyIsImlhdCI6MTY4NzM0MDY0MX0.xPO_5JbwBcCkW8CdKcdOaUTwb9RolzkI2QbZipakSC4',
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Connection': 'keep-alive',
      };

      var body = json.encode({
        "subject": subject,
        "description": description,
      });

      final uri = Uri.https(AppConstants.baseUrl, apiUrl);
      final response = await http.post(uri, headers: headers, body: body);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return jsonResponse;
      } else {
        debugPrint('No Data Found Try Again !!');
        //return dynamic;
      }
    } on SocketException {
      debugPrint('No Internet Connection !!');
    } on http.ClientException {
      debugPrint('Connection Problem with Server !!');
    } catch (e) {
      debugPrint('Something Happended Please Try Again !!');
    }
  }

  static Future<dynamic> getSupport() async {
    try {
      const apiUrl = '/tickets1/1';

      final Map<String, String> headers = {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZV9udW1iZXIiOiI3MDE4MTgwOTM3Iiwib3RwIjoiMzM3NyIsImlhdCI6MTY4NzM0MDY0MX0.xPO_5JbwBcCkW8CdKcdOaUTwb9RolzkI2QbZipakSC4',
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Connection': 'keep-alive',
      };

      final uri = Uri.https(
        AppConstants.baseUrl,
        apiUrl,
      );
      final response = await http.get(
        uri,
        headers: headers,
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return jsonResponse;
      } else {
        debugPrint('No Data Found Try Again !!');
        //return dynamic;
      }
    } on SocketException {
      debugPrint('No Internet Connection !!');
    } on http.ClientException {
      debugPrint('Connection Problem with Server !!');
    } catch (e) {
      debugPrint('Something Happended Please Try Again !!');
    }
  }

  static Future<List<dynamic>> getBlogData() async {
    try {
      const apiUrl = "/blogs";

      final Map<String, String> headers = {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZV9udW1iZXIiOiI3MDE4MTgwOTM3Iiwib3RwIjoiMzM3NyIsImlhdCI6MTY4NzM0MDY0MX0.xPO_5JbwBcCkW8CdKcdOaUTwb9RolzkI2QbZipakSC4',
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Connection': 'keep-alive',
      };

      final uri = Uri.https(
        AppConstants.baseUrl,
        apiUrl,
      );
      final response = await http.get(
        uri,
        headers: headers,
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        // print(jsonResponse);
        return jsonResponse;
      } else {
        debugPrint('No Data Found Try Again !!');
        return List<dynamic>.empty();
      }
    } on SocketException {
      debugPrint('No Internet Connection !!');
      return List<dynamic>.empty();
    } on http.ClientException {
      debugPrint('Connection Problem with Server !!');
      return List<dynamic>.empty();
    } catch (e) {
      debugPrint('Something Happended Please Try Again !!');
      return List<dynamic>.empty();
    }
  }

  static Future<dynamic> getPanchagData() async {
    try {
      const apiUrl = "/daily-panchang";

      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Connection': 'keep-alive',
      };

      final uri = Uri.https(AppConstants.baseUrl, apiUrl);
      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        //print(jsonResponse);
        return jsonResponse;
      } else {
        debugPrint('No Data Found Try Again !!');
        //return dynamic;
      }
    } on SocketException {
      debugPrint('No Internet Connection !!');
    } on http.ClientException {
      debugPrint('Connection Problem with Server !!');
    } catch (e) {
      debugPrint('Something Happended Please Try Again !!');
    }
  }

  static Future<dynamic> sendConsultaionRequest(String name, String birthDate,
      String birthTime, String birthPlace, String reason) async {
    try {
      const apiUrl = "/user-consultation";

      final Map<String, String> headers = {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZV9udW1iZXIiOiI5ODYxNTIxOTQzIiwib3RwIjoiMzk2MCIsImlhdCI6MTY5MTEzNTA1OX0.f8GlaiuLEyIYy0TTEO_9wwscJqaSfuwxKZb6WuRxGH4',
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Connection': 'keep-alive',
      };

      var body = json.encode({
        "name": name,
        "birth_place": birthPlace,
        "birth_date": birthDate,
        "birth_time": birthTime,
        "consultation_reason": reason
      });

      final uri = Uri.https(AppConstants.baseUrl, apiUrl);
      final response = await http.post(uri, headers: headers, body: body);
      //print(response.body);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return jsonResponse;
      } else {
        debugPrint('No Data Found Try Again !!');
        //return dynamic;
      }
    } on SocketException {
      debugPrint('No Internet Connection !!');
    } on http.ClientException {
      debugPrint('Connection Problem with Server !!');
    } catch (e) {
      debugPrint('Something Happended Please Try Again !!');
    }
  }
}
