import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repositories/user_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserRepository repository;

  HomeBloc(this.repository) : super(const HomeState()) {
    on<LoadUsers>(_onLoadUsers);
    on<RefreshUsers>(_onRefreshUsers);
  }

  Future<void> _onLoadUsers(
    LoadUsers event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        status: HomeStatus.loading,
      ),
    );

    try {
      final users = await repository.getUsers();

      emit(
        state.copyWith(
          status: HomeStatus.success,
          users: users,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: HomeStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _onRefreshUsers(
    RefreshUsers event,
    Emitter<HomeState> emit,
  ) async {
    try {
      final users = await repository.getUsers();

      emit(
        state.copyWith(
          status: HomeStatus.success,
          users: users,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: HomeStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
