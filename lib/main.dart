import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/blocs/login_state_bloc.dart';
import 'package:flutter_bloc_tutorial/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginStateBloc>(
      create: (BuildContext context) {
        return LoginStateBloc();
      },
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}