import 'package:bloc/bloc.dart';

abstract class LoginEvent {}

class LogIn extends LoginEvent {}

class LogOut extends LoginEvent {}

String loginString = 'My Account';

class LoginStringBloc extends Bloc<LoginEvent, String> {
  LoginStringBloc() : super('My Account') {
    on<LogOut>((event, emit) => emit(loginString = 'My Account'));
    on<LogIn>((event, emit) => emit(loginString = loginString));
    // on<LogIn>((event, emit) => emit(loginString = loginString));
  }
}
