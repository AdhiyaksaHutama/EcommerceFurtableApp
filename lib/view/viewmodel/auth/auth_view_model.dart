import 'package:flutter/material.dart';
import 'package:furniture_e_commerce/model/service/auth_service.dart';
import 'package:furniture_e_commerce/model/user_model.dart';
import 'package:furniture_e_commerce/utils/constant/state.dart';
import 'package:furniture_e_commerce/utils/preferences/preferences.dart';

class AuthViewModel extends ChangeNotifier {
  dynamic response;
  MyState _state = MyState.initial;
  PreferencesUtils preferencesUtils = PreferencesUtils();
  UserModel userModel = UserModel();

  MyState get state => _state;

  void setState(MyState state) {
    _state = state;
    notifyListeners();
  }

  Future<String> register(
    String imageLink,
    String name,
    String email,
    String password,
    String passwordConfirmation,
  ) async {
    setState(MyState.loading);
    response = await AuthService.register(
      imageLink,
      name,
      email,
      password,
      passwordConfirmation,
    );

    if (response == null) {
      setState(MyState.failed);
      return 'Register Failed';
    }

    if (response['status_code'] == 201) {
      setState(MyState.success);
      return 'success';
    } else {
      setState(MyState.failed);
      return response['error'];
    }
  }

  Future<String> login(String email, String password) async {
    try {
      response = await AuthService.login(email, password);

      if (response == null) {
        setState(MyState.failed);
        return 'Login Failed';
      }

      if (response["access_token"] != null) {
        setState(MyState.success);
        return '${response["access_token"]}';
      } else {
        setState(MyState.failed);
        return response['error'] ?? 'Login Failed';
      }
    } catch (e) {
      setState(MyState.failed);
      return 'Catch Block Error';
    }
  }

  Future<UserModel> getUser() async {
    try {
      preferencesUtils.init();
      String token = preferencesUtils.getPreferencesString('token') ?? "";
      response = await AuthService.getUserData(token);

      if (response["id"] != null) {
        setState(MyState.success);
        userModel = UserModel.fromJson(response);
        return userModel;
      } else {
        setState(MyState.failed);
        return response['error'] ?? 'Failed';
      }
    } catch (e) {
      setState(MyState.failed);
      return response['error'] ?? 'Failed';
    }
  }
}
