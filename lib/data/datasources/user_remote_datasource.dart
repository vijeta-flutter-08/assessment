import 'package:dio/dio.dart';

import '../models/user_model.dart';

class UserRemoteDataSource {
  final Dio dio;

  UserRemoteDataSource(this.dio);

  Future<List<UserModel>> getUsers() async {
    final response = await dio.get(
      'https://randomuser.me/api/?results=20',
    );

    final List results = response.data['results'];

    return results
        .map(
          (user) => UserModel.fromJson(
            user as Map<String, dynamic>,
          ),
        )
        .toList();
  }
}
