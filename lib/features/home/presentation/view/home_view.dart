import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doko_platter/core/common/snackbar/my_snackbar.dart';
import 'package:doko_platter/features/home/presentation/view_model/home_cubit.dart';
import 'package:doko_platter/features/home/presentation/view_model/home_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  final bool _isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade300, // Light orange app bar
        title: const Text('Doko Platter'),
        centerTitle: true,
        leading: Switch(
          value: _isDarkTheme,
          onChanged: (value) {
            // Theme toggle logic (To be implemented)
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app), // Changed logout icon
            onPressed: () {
              // Logout functionality
              showMySnackBar(
                context: context,
                message: 'Logging out...',
                color: Colors.red,
              );

              context.read<HomeCubit>().logout(context);
            },
          ),
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return state.views.elementAt(state.selectedIndex);
        },
      ),
      bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return BottomNavigationBar(
            backgroundColor: Colors.orange.shade300, // Light orange bottom bar
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                label: 'Dashboard',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: 'Menu',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Account',
              ),
            ],
            currentIndex: state.selectedIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.black54,
            onTap: (index) {
              context.read<HomeCubit>().onTabTapped(index);
            },
          );
        },
      ),
    );
  }
}
