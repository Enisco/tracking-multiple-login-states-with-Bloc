import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/blocs/login_state_bloc.dart';
import 'package:flutter_bloc_tutorial/blocs/login_string_bloc.dart';
import 'package:flutter_bloc_tutorial/screens/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

TextEditingController idController = TextEditingController();
TextEditingController passwordController = TextEditingController();
String errorMessage = '';

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    LoginStateBloc _loginBloc = BlocProvider.of<LoginStateBloc>(context);

    return BlocBuilder<LoginStateBloc, int>(builder: (context, state) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: const Text("BLoC with Firebase"),
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
            children: [
              SizedBox(
                width: size.width,
                height: size.height / 10,
              ),

              SizedBox(
                width: size.width,
                height: size.height / 18,
                child: TextField(
                  controller: idController,
                  cursorColor: Colors.blueGrey,
                  style: const TextStyle(
                      fontFamily: 'Poppins', fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    labelText: 'ID',
                    labelStyle: const TextStyle(
                      fontFamily: 'Poppins',
                    ),
                    hintText: "Enter the ID",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18.0)),
                        borderSide: BorderSide(color: Colors.blueGrey)),
                    hintStyle: const TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),

              //---------------------------------------------------------------------------------------------------------

              SizedBox(
                width: size.width,
                height: size.height / 10,
              ),

              //---------------------------------------------------------------------------------------------------------

              SizedBox(
                width: size.width,
                height: size.height / 18,
                child: TextField(
                  controller: passwordController,
                  cursorColor: Colors.blueGrey,
                  style: const TextStyle(
                      fontFamily: 'Poppins', fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: const TextStyle(
                      fontFamily: 'Poppins',
                    ),
                    hintText: "Enter the Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18.0)),
                        borderSide: BorderSide(color: Colors.blueGrey)),
                    hintStyle: const TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),

              //---------------------------------------------------------------------------------------------------------

              SizedBox(
                width: size.width,
                height: size.height / 10,
              ),

              //---------------------------------------------------------------------------------------------------------

              ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: size.height / 10, maxWidth: size.width / 1.5),
                child: Text(
                  errorMessage,
                  style:
                      TextStyle(color: Colors.red, fontSize: size.width / 40),
                ),
              ),

              //---------------------------------------------------------------------------------------------------------

              SizedBox(
                width: size.width,
                height: size.height / 10,
              ),

              //---------------------------------------------------------------------------------------------------------

              FloatingActionButton(
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.add),
                  onPressed: () async {
                    if (idController.text == '' ||
                        passwordController.text == '') {
                      print('Enter both username and password');

                      setState(() {
                        errorMessage = 'Enter both username and password';
                      });
                    } else {
                      checkPasswordCorrect();
                    }
                  }),
            ],
          ),
        ),
      );
    });
  }
//covams00001 covams1

  void checkPasswordCorrect() async {
    String password = passwordController.text;
    String readPassword;

    final docSnapShot = await FirebaseFirestore.instance
        .collection("covamsdata")
        .doc(idController.text)
        .get();
    if (docSnapShot.exists) {
      readPassword = docSnapShot.data()!["Password"].toString();
      print(readPassword);

      if (readPassword == password) {
        print('Password matches: ${docSnapShot.data()!["Password"]}');
        loginString = docSnapShot.data()!["First Name"];
        setState(() {
          errorMessage = 'Access granted';
        });

        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      } else {
        print('Password doesn\'t  match: ${docSnapShot.data()!["Password"]}');
        print('Username or password Incorrect');
        setState(() {
          errorMessage = 'Username or password Incorrect';
        });
      }

      if (docSnapShot.data() == null) {
        print('User not found');
        print('Username or password Incorrect');
        setState(() {
          errorMessage = 'Username or password Incorrect';
        });
      }
    } else {
      print('Username or password Incorrect');
      setState(() {
        errorMessage = 'Username or password Incorrect';
      });
    }
  }
}
