import 'dart:io';
import 'package:astrology_app/constants/keys.dart';
import 'package:astrology_app/screens/user_blog/blog_page.dart';
import 'package:astrology_app/services/services.dart';

class Controller {
  List<Blog> blogs = [];

  static Future<Map<String, dynamic>> matchKundli(
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
    
      final data = await Services.matchKundli(
          boyName,
          boyId,
          boyDob,
          boyTob,
          boyLong,
          boyLati,
          girlName,
          girlId,
          girlDob,
          girlTob,
          girlLong,
          girlLati);
          if(data != null){
      return data;
          }
          else{
            return {};
          }
    
  }

  static Future<dynamic> fetchFollowingList() async {
    
      final list = await Services.getAstrologerFollowingList();
      if(list.isNotEmpty){
        return list;
      }
      else{
        return List<dynamic>.empty();
      }
  }

  static Future<Map<String, dynamic>> userLogin(String phonenNumber) async { 
      final data = await Services.userLogin(phonenNumber);
      if(data != null){
      return data;
      }
      else{
        return {};
      }
  }

  static Future<Map<String, dynamic>> userVerifyOtp(String phonenNumber,String otp) async { 
      final data = await Services.verifyUser(phonenNumber,otp);
      if(data != null){
      return data;
      }
      else{
        return {};
      }
  }

  static Future<Map<String, dynamic>> readPalm(File imageFile) async {
    
      final data = await Services.readPalm(imageFile);
      if(data != null){
      return data;
      }
      else{
        return {};
      }
  }

  static Future<Map<String, dynamic>> userRaiseTicket(
      String subject, String description) async {
      final data = await Services.userRaiseTicket(subject, description);
      if(data != null){
      return data;
      }
      else{
        return {};
      }
  }

  static Future<Map<String, dynamic>> getTickets() async {
      final data = await Services.getSupport();
      if(data != null){
      return data;
      }
      else{
        return {};
      }
  
  }

  Future<List<Blog>> getBlog() async {
    
      final blogData = await Services.getBlogData();
      if(blogData.isNotEmpty){
      blogs = blogData.map((data) {
        return Blog(
          image: Constants.placeholderImage,
          title: data['title'] ?? '',
          author: data['author'] ?? '',
          dateTime: data['date_posted'] ?? '',
          description: data['content'] ?? '',
          id: data['id'].toString() ,
          totalViews: data['views'].toString() ,
        );
      }).toList();

      //print(blogs);
      return blogs;
      }else{
        return List<Blog>.empty();
      }
  }

  static Future<Map<String, dynamic>> getPanchagData() async {
    
      final panchagData = await Services.getPanchagData();
      if(panchagData != null){
      return panchagData;
      }
      else{
        return {};
      }
  }

  static Future<String> sendConsultation(String name, String birthDate,
      String birthTime, String birthPlace, String reason) async {
    
      final data = await Services.sendConsultaionRequest(
          name, birthDate, birthTime, birthPlace, reason);
          if(data != null){
      return data['message'];
          }
          else{
            return '';
          }
  }
}
