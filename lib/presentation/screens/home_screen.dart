import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home/home_bloc.dart';
import '../bloc/home/home_event.dart';
import '../bloc/home/home_state.dart';
import '../widgets/home_header.dart';
import '../widgets/profile_stack.dart';
import '../widgets/bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3EEE8),
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.status == HomeStatus.loading && state.users.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color(0xFFB74D72),
                ),
              );
            }

            if (state.status == HomeStatus.failure && state.users.isEmpty) {
              return _ErrorView(
                message: state.errorMessage ?? 'Something went wrong',
                onRetry: () {
                  context.read<HomeBloc>().add(LoadUsers());
                },
              );
            }

            return Column(
              children: [
                const HomeHeader(),
                Expanded(
                  child: RefreshIndicator(
                    color: const Color(0xFFB74D72),
                    onRefresh: () async {
                      context.read<HomeBloc>().add(
                            RefreshUsers(),
                          );

                      await Future.delayed(
                        const Duration(milliseconds: 800),
                      );
                    },
                    child: ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      children: [
                        ProfileStack(
                          users: state.users,
                        ),
                      ],
                    ),
                  ),
                ),
                // BottomNavigation(
                //   selectedIndex: selectedIndex,
                //   onChanged: (index) {
                //     setState(() {
                //       selectedIndex = index;
                //     });
                //   },
                // ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorView({
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.cloud_off_rounded,
              size: 50,
              color: Colors.grey,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onRetry,
              child: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }
}
