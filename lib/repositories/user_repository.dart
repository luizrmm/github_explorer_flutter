import 'package:dio/dio.dart';
import 'package:github_app/models/user_model.dart';
import 'package:github_app/repositories/baseDio.dart';

class UserRepository {
  Dio dio = CustomDio().instance;
  Future<UserModel> getUser(String username) async {
    try {
      Response response = await dio.get('users/$username');
      return UserModel.fromJson(response.data);
    } on DioError catch (error) {
      throw error;
    }
  }
}
