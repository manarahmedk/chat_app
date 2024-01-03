import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_model/bloc/auth_cubit/auth_cubit.dart';
import '../../view_model/utils/colors.dart';
import '../../view_model/utils/navigation.dart';
import '../comonents/custom_button.dart';
import '../comonents/custom_text.dart';
import '../comonents/custom_text_form_field.dart';
import 'chat_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {

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
                key: cubit.formKey,
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
                      text: 'LOGIN',
                      fontSize: 24,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomTextFormField(
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      controller: cubit.emailController,
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
                      controller: cubit.passwordController,
                      suffixIcon: Icons.remove_red_eye,
                      obscureText: cubit.obscureText,
                      isPasswordText: true,
                      secondSuffixIcon: Icons.visibility_off,
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
                      text: 'Login',
                      color: AppColors.black,
                      onPressed: () {
                        if (cubit.formKey.currentState!.validate()) {
                          cubit.loginWithFirebase().then((value) {
                            Navigation.push(context, ChatScreen());
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
                            Navigation.pushAndRemove(context, RegisterScreen());
                          },
                          child: const CustomText(
                            text: 'Register',
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
