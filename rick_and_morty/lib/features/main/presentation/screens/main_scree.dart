import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/main/presentation/presenter/main_presenter.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = MainPresenter();
    return Center(child: Text(presenter.getTitle()));
  }
}
