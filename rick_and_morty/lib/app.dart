import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/navigation/navigation_cubit.dart';
import 'package:rick_and_morty/features/main/presentation/screens/favorites_list_screen.dart';
import 'package:rick_and_morty/features/main/presentation/screens/main_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final List<Widget> _pages = const [MainScreen(), FavoritesListScreen()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<NavigationCubit, int>(
        builder: (context, state) {
          return Scaffold(
            body: _pages[state],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state,
              onTap: (index) => context.read<NavigationCubit>().setTab(index),
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Main'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.star),
                  label: 'Favorites',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
