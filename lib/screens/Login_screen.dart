import 'package:digicala_test1/bloc/authentication/auth_bloc.dart';
import 'package:digicala_test1/bloc/authentication/auth_event.dart';
import 'package:digicala_test1/bloc/authentication/auth_state.dart';
import 'package:digicala_test1/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _usernameTextContorller = TextEditingController(text: 'Mahdi0915_17');
  final _passwordTextContorller = TextEditingController(text: '123456789');
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.blueApp,
        body: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/icon_application.png',
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(height: 30),
                  Text(
                    'دیجیکالا',
                    style: TextStyle(
                      fontFamily: 'sb',
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: _usernameTextContorller,
                      decoration: InputDecoration(
                        labelText: 'نام کاربری',
                        labelStyle: TextStyle(
                            fontFamily: 'sm',
                            fontSize: 18,
                            color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.black, width: 3),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide:
                              BorderSide(color: AppColors.blueApp, width: 2),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _passwordTextContorller,
                      decoration: InputDecoration(
                        labelText: 'رمز عبور',
                        labelStyle: TextStyle(
                            fontFamily: 'sm',
                            fontSize: 18,
                            color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.black, width: 3),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide:
                              BorderSide(color: AppColors.blueApp, width: 2),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        if (state is AuthInitiateState) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              textStyle: TextStyle(
                                fontFamily: 'sb',
                                fontSize: 18,
                              ),
                              minimumSize: Size(200, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            onPressed: () {
                              BlocProvider.of<AuthBloc>(context).add(
                                AuthLoginRequest(
                                  _usernameTextContorller.text,
                                  _passwordTextContorller.text,
                                ),
                              );
                            },
                            child: Text(
                              'ورود به حساب کاربری',
                              style: TextStyle(),
                            ),
                          );
                        }

                        if (state is AuthLoadingState) {
                          return CircularProgressIndicator();
                        }

                        if (state is AuthResponseState) {
                          // ignore: non_constant_identifier_names
                          Text Widget = Text('');
                          state.reponse.fold((l) {
                            Widget = Text(l);
                          }, (r) {
                            Widget = Text(r);
                          });
                          return Widget;
                        }

                        return Text('خطای نا مشخص');
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
