import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/add_data.dart';
import 'package:flutter_bloc_tutorial/blocs/login_state_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc_tutorial/blocs/login_string_bloc.dart';

TextEditingController idController = TextEditingController();
TextEditingController passwordController = TextEditingController();
String errorMessage = '';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return BlocProvider<LoginStateBloc>(
    //   create: (BuildContext context) {
    //     return LoginStateBloc();
    //   },
    //   child: const MaterialApp(
    //     home: AddData(),
    //   ),
    // );
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginStateBloc>(
          create: (BuildContext context) => LoginStateBloc(),
        ),
        BlocProvider<LoginStringBloc>(
          create: (BuildContext context) => LoginStringBloc(),
        ),
      ],
      child: const MaterialApp(
        home: AddData(),
      ),
    );
  }
}
