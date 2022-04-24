import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/blocs/login_state_bloc.dart';
import 'package:flutter_bloc_tutorial/screens/home.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginStateBloc _counterBloc = BlocProvider.of<LoginStateBloc>(context);

    return BlocBuilder<LoginStateBloc, int>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Flutter BLoC Page 2"),
            actions: [
              Center(
                child: Text(
                  loginStatesString[state],
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
                  },
                ),
                TextButton(
                  child: const Text("Hosp Vacc Centre Log In"),
                  onPressed: () {
                    _counterBloc.add(HospVaccCentreLoggedIn());
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
                builder: (context) => ThirdScreen(),
              ),
            ),
          ),
        );
      },
    );
  }
}

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginStateBloc _counterBloc = BlocProvider.of<LoginStateBloc>(context);

    return BlocBuilder<LoginStateBloc, int>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Flutter BLoC Page 3"),
            actions: [
              Center(
                child: Text(
                  loginStatesString[state],
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
                  child: const Text("Admin Log In"),
                  onPressed: () {
                    _counterBloc.add(AdminLoggedIn());
                  },
                ),
                TextButton(
                  child: const Text("Verif Centre Log In"),
                  onPressed: () {
                    _counterBloc.add(VerifCentreLoggedIn());
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
                builder: (context) => const HomeScreen(),
              ),
            ),
          ),
        );
      },
    );
  }
}
