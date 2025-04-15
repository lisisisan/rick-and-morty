import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/navigation/navigation_cubit.dart';
import 'package:rick_and_morty/features/main/presentation/screens/favorites_list_screen.dart';
import 'package:rick_and_morty/features/main/presentation/screens/main_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final ValueNotifier<ThemeMode> _themeNotifier = ValueNotifier(
    ThemeMode.system,
  );

  final List<Widget> _pages = const [MainScreen(), FavoritesListScreen()];

  @override
  void dispose() {
    _themeNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _themeNotifier,
      builder: (context, themeMode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: const Color.fromARGB(255, 42, 183, 115),
            cardColor: Colors.white,
            brightness: Brightness.light,
          ),
          darkTheme: ThemeData(
            primaryColor: Colors.greenAccent,
            cardColor: Colors.black,
            brightness: Brightness.dark,
          ),
          home: BlocBuilder<NavigationCubit, int>(
            builder: (context, state) {
              return Scaffold(
                appBar: AppBar(
                  title: Text('Rick and Morty'),
                  actions: [
                    Switch(
                      activeColor: Theme.of(context).primaryColor,
                      value: themeMode == ThemeMode.dark,
                      onChanged: (value) {
                        _themeNotifier.value =
                            value ? ThemeMode.dark : ThemeMode.light;
                      },
                    ),
                  ],
                ),
                body: _pages[state],
                bottomNavigationBar: BottomNavigationBar(
                  selectedItemColor: Theme.of(context).primaryColor,
                  currentIndex: state,
                  onTap:
                      (index) => context.read<NavigationCubit>().setTab(index),
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Main',
                    ),
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
      },
    );
  }
}
