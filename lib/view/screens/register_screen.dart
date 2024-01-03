import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_model/bloc/auth_cubit/auth_cubit.dart';
import '../../view_model/utils/colors.dart';
import '../../view_model/utils/navigation.dart';
import '../comonents/custom_button.dart';
import '../comonents/custom_text.dart';
import '../comonents/custom_text_form_field.dart';
import 'login_screen.dart';
import 'package:firebase_core/firebase_core.dart';

class RegisterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = AuthCubit.get(context);
              return Form(
                key: cubit.formKey2,
                child: ListView(
                  children: [
                    SizedBox(
                      height: 75,
                    ),
                    Image.asset(
                      'assets/images/scholar.png',
                      height: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: 'Chat App',
                          fontSize: 32,
                          fontFamily: 'pacifico',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 75,
                    ),
                    CustomText(
                      text: 'REGISTER',
                      fontSize: 24,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomTextFormField(
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      controller: cubit.emailController2,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if ((value ?? '').isEmpty) {
                          return 'Please, Enter your Email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      hintText: 'Password',
                      keyboardType: TextInputType.text,
                      controller: cubit.passwordController2,
                      suffixIcon: Icons.remove_red_eye,
                      obscureText: cubit.obscureText,
                      secondSuffixIcon: Icons.visibility_off,
                      isPasswordText: true,
                      validator: (value) {
                        if ((value ?? '').isEmpty) {
                          return 'Please, Enter your Password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      text: 'Register',
                      color: AppColors.black,
                      onPressed: () async {
                        if (cubit.formKey2.currentState!.validate()) {
                          cubit.registerWithFirebase().then((value) {
                            Navigation.pushAndRemove(context, LoginScreen());
                            cubit.clearData();
                          });
                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomText(
                          text: 'Don\'t have an account ?  ',
                          fontSize: 15,
                          color: AppColors.grey,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigation.pushAndRemove(context, LoginScreen());
                          },
                          child: const CustomText(
                            text: 'Login',
                            fontSize: 17,
                            color: Color(0xffC7EDE6),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
