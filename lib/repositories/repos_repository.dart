import 'package:dio/dio.dart';
import 'package:github_app/models/repos_model.dart';
import 'package:github_app/repositories/baseDio.dart';

class ReposRepository {
  Dio dio = CustomDio().instance;

  Future<List<ReposModel>> getRepos(String username) async {
    List repositories = new List();
    try {
      Response response = await dio.get('users/$username/repos');
      repositories = response.data as List;
      return repositories
          .map((repository) => ReposModel.fromJson(repository))
          .toList();
    } on DioError catch (error) {
      throw error;
    }
  }
}
