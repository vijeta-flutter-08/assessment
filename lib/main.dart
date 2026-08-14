import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/presentation/screens/app_navigation.dart';

import 'core/network/api_logger.dart';
import 'core/theme/app_theme.dart';
import 'data/datasources/user_remote_datasource.dart';
import 'data/repositories/user_repository_impl.dart';
import 'presentation/bloc/home/home_bloc.dart';
import 'presentation/bloc/home/home_event.dart';
import 'presentation/screens/home_screen.dart';

void main() {
  final dio = Dio()
    ..interceptors.add(ApiLogger());

  final dataSource = UserRemoteDataSource(dio);

  final repository = UserRepositoryImpl(dataSource);

  runApp(
    MyApp(
      repository: repository,
    ),
  );
}

class MyApp extends StatelessWidget {
  final UserRepositoryImpl repository;

  const MyApp({
    super.key,
    required this.repository,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dating App',
      theme: AppTheme.lightTheme,
      home: BlocProvider(
        create: (_) => HomeBloc(repository)..add(LoadUsers()),
        child: const AppNavigation(),
      ),
    );
  }
}
