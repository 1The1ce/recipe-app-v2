import 'dart:core';
import 'package:dio/dio.dart';

class ApiClient {
  Dio dio = Dio(BaseOptions(baseUrl: "http://192.168.1.12:8888/api/v1"));

  Future<String> login(String login,String password) async {
    var response= await dio.post(
      "/auth/login",
    data:   {"login":login,"password":password},
    );
    if(response.statusCode==200){
      Map<String,String> data=Map<String,String>.from(response.data);
      return data["accessToken"]!;
    }else {
      throw Exception("Sizga kirish ruxsat etilmagan!");
    }
  }

  Future<List<dynamic>> fetchOnboardingPages() async {
    var response = await dio.get('/onboarding/list');
    return response.data as List<dynamic>;
  }

  Future<Map<String, dynamic>> fetchUser(int userId) async {
    var response = await dio.get("/auth/details/$userId");
    Map<String, dynamic> data = response.data;
    return data;
  }

  Future<List<dynamic>> fetchRecipes(int categoryId) async {
    var response = await dio.get("/recipes/list?Category=$categoryId");
    final List<dynamic> data = response.data;
    return data;
  }
  
 Future<List<dynamic>> fetchCategories() async {
    var response=await dio.get("/categories/list");
    List<dynamic> data=response.data;
    return data;
  }

}

