import 'dart:io';

import '../enums/network_enums.dart';
import '../models/auth_model.dart';
import '../models/login_model.dart';
import 'interface_auth_service.dart';

class AuthService extends IAuthService {
  AuthService(super.dioManager);

  @override
  Future<String?> login({
    required String email,
    required String password,
  }) async {
    var response = await dioManager.dio.post(
      NetworkEnums.login.path,
      data: LoginModel(
        email: email,
        password: password,
      ).toJson(),
    );

    if (response.statusCode == HttpStatus.ok) {
      return AuthModel.fromJson(response.data).token;
    } else {
      return throw Exception();
    }
  }
}
