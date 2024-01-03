import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../data/firebase/firebase.dart';
import '../../data/local/shared_keys.dart';
import '../../data/local/shared_prefernce.dart';
import '../../utils/functions.dart';


part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController emailController2 = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();


  FirebaseAuth authProvider=  FirebaseAuth.instance;

  bool obscureText = true;

  Future<void> registerWithFirebase() async {
    emit(RegisterLoadingState());
    await authProvider.createUserWithEmailAndPassword(
      email: emailController2.text,
      password: passwordController2.text,
    ).then((value) async {
      print(value.user?.email);
      emit(RegisterSuccessState());
    }).catchError((error){
      print(error);
      Functions.showToast(message: error.toString(),background: Colors.red);
      emit(RegisterErrorState());
      throw error;
    });
  }

  Future<void> loginWithFirebase() async {
    emit(LoginLoadingState());
    await authProvider.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    ).then((value){
      print(value.user?.email);
      saveDataFirebase(value);
      emit(LoginSuccessState());
    }).catchError((error){
      print(error);
      Functions.showToast(message: error.toString(),background: Colors.red);
      emit(LoginErrorState());
      throw error;
    });
  }

  void saveDataFirebase(UserCredential value) {
    LocalData.set(key: SharedKeys.email, value: value.user?.email);
  }
  void changeObsecure (){
    obscureText=!obscureText;
    emit(ChangeObsecureState());
  }

  void clearData (){
    emailController.clear();
    passwordController.clear();
    emailController2.clear();
    passwordController2.clear();

    emit(ClearDataState());
  }

}
