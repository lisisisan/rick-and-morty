import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/main/presentation/presenter/favorites_presenter.dart';

class FavoritesListScreen extends StatelessWidget {
  const FavoritesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = FavoritesPresenter();
    return Center(child: Text(presenter.getTitle()));
  }
}
