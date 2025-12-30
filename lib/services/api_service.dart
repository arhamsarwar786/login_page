import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:login_page/model/login_request_model.dart';
import 'package:login_page/utils/app_images.dart';

class ApiService {
  Future<http.Response> login(LoginRequestModel loginRequest) async {
    try {
      final response = await http.post(
        Uri.parse("${AppImages.baseUrl}/users/login"),
        headers: {
          "Content-Type": 'application/json',
        },
        body: jsonEncode(loginRequest.toJson()),
      );

      return response;
      
    } catch (e) {
      throw Exception('Network error: ${e.toString()}');
    }
  }
}