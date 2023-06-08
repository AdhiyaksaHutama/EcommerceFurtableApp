import 'package:dio/dio.dart';
import 'package:furniture_e_commerce/utils/constant/constant.dart';
import 'package:furniture_e_commerce/utils/constant/dio_helper.dart';

class AuthService {
  static Future<dynamic> register(
    String imageLink,
    String name,
    String email,
    String password,
    String passwordConfirmation,
  ) async {
    final response = Dio().post(
      '$BASE_URL_API/auth/register',
      data: {
        'image': imageLink,
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmation,
      },
    );
    return response
        .then((value) => value.data)
        .catchError((e) => handleErrorApi(e));
  }

  static Future<dynamic> login(String email, String password) async {
    final response = Dio().post(
      '$BASE_URL_API/auth/login',
      data: {
        'email': email,
        'password': password,
      },
    );
    return response
        .then((value) => value.data)
        .catchError((e) => handleErrorApi(e));
  }

  static Future<dynamic> getUserData(String token) async {
    final Dio dio = Dio();

    dio.options.headers['Authorization'] = token;

    final response = dio.get(
      '$BASE_URL_API/auth/user-profile',
    );
    return response
        .then((value) => value.data)
        .catchError((e) => handleErrorApi(e));
  }
}
