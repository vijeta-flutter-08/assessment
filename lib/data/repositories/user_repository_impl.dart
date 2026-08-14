import '../../domain/repositories/user_repository.dart';
import '../datasources/user_remote_datasource.dart';
import '../models/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource dataSource;

  UserRepositoryImpl(this.dataSource);

  @override
  Future<List<UserModel>> getUsers() {
    return dataSource.getUsers();
  }
}