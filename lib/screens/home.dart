import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/add_data.dart';
import 'package:flutter_bloc_tutorial/blocs/login_state_bloc.dart';
import 'package:flutter_bloc_tutorial/blocs/login_string_bloc.dart';
import 'package:flutter_bloc_tutorial/screens/other_screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginStateBloc _counterBloc = BlocProvider.of<LoginStateBloc>(context);

    return BlocBuilder<LoginStateBloc, int>(builder: (context, state) {
      return BlocBuilder<LoginStringBloc, String>(builder: (context, string) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Flutter BLoC Page 1"),
            actions: [
              Center(
                child: Text(
                  // loginStatesString[state],
                  loginString,
                  style: const TextStyle(fontSize: 20, color: Colors.amber),
                ),
              ),
            ],
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$state',
                  style: const TextStyle(fontSize: 40),
                ),
                TextButton(
                  child: const Text("Logged Out"),
                  onPressed: () {
                    _counterBloc.add(LoggedOut());
                    loginString = 'My Account';
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const AddData()),
                        (Route<dynamic> route) => false);
                  },
                ),
                TextButton(
                  child: const Text("User Log In"),
                  onPressed: () {
                    _counterBloc.add(UserLoggedIn());
                  },
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.arrow_right),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SecondScreen(),
              ),
            ),
          ),
        );
      });
    });
  }
}
