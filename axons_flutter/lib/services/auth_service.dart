import 'dart:convert';
import 'dart:io';
import '../enums/service_enums.dart';
import '../models/auth_model.dart';
import 'interface_auth_service.dart';

class AuthService extends IAuthService {
  AuthService(super.dioManager);

  @override
  Future<String?> login({required String email, required String password}) async {
    var response = await dioManager.dio.post(
      ServiceEnums.login.path,
      data: jsonEncode(<String, dynamic>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == HttpStatus.ok) {
      return AuthModel.fromJson(response.data).token;
    } else {
      return throw Exception();
    }
  }
}
