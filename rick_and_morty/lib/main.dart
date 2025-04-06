import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app.dart';
import 'core/navigation/navigation_cubit.dart';

void main() {
  runApp(BlocProvider(create: (_) => NavigationCubit(), child: MyApp()));
}
