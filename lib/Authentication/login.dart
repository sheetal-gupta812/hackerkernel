import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hackerkernel/Screens/bottombarpage.dart';
import 'package:hackerkernel/Services/api.dart';
import 'package:hackerkernel/Services/apiservice.dart';
import 'package:hackerkernel/Widgets/button.dart';
import 'package:hackerkernel/Widgets/color.dart';
import 'package:hackerkernel/Widgets/text.dart';
import 'package:hackerkernel/Widgets/textbox.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  var response;
  Future<void> login() async {
    Object? body = jsonEncode(<String, String>{
      'email': emailController.text,
      'password': passController.text.toString(),
    });
    response = await BaseApiService.post(Urls.login, body);
    log("Login URL:-" + Urls.login);
    if (response.statusCode == 200) {
      log("Response Send OTP:-" + response.body);
      var data = response.body;
      log("Data Send otp:-" + data.toString());
      var jsonData = json.decode(response.body);
      var token = jsonData['token'];
      log("Token:-" + token.toString());
      BaseApiService.token = token.toString();
      BaseApiService.email = emailController.text.toString();
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomBarPage(),
          ));

      //return jsonData;
    } else {
      wrongLoginCredentials(context);
      throw Exception('Failed to create album.');
    }
  }

  void wrongLoginCredentials(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
              child: AppText(
                'Please check your email id or password!',
                size: 18,
                color: ColorData.secondary,
              ),
            ),
            actions: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: AppText(
                    'Ok',
                    size: 14,
                    color: ColorData.secondary,
                  )),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 260.0, bottom: 20.0, left: 20.0, right: 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      WidthTextBox(
                        controller: emailController,
                        width: double.infinity,
                        textName: 'Email',
                        color: ColorData.secondary,
                        hintText: 'Enter Here',
                        icon: const Icon(
                          Icons.mail,
                          color: ColorData.secondary,
                        ),
                        weight: FontWeight.w500,
                        validatorText: 'Enter Email Id',
                      ),
                      const SizedBox(height: 20),
                      PasswordTextBox(
                        controller: passController,
                        width: double.infinity,
                        textName: 'Password',
                        color: ColorData.secondary,
                        hintText: '********',
                        icon: const Icon(
                          Icons.lock,
                          color: ColorData.secondary,
                        ),
                        weight: FontWeight.w500,
                        validatorText: 'Enter Password',
                      ),
                      const SizedBox(height: 20),
                      WidthButton(
                          textName: 'Login',
                          onPressed: () async {
                            _formKey.currentState!.save();
                            if (_formKey.currentState!.validate()) {
                              await login();
                            }
                          },
                          width: double.infinity,
                          textColor: ColorData.primary,
                          buttonColor: ColorData.secondary),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUp(),
                              ));*/
                        },
                        child: AppText(
                          'Create an Account',
                          color: ColorData.secondary,
                          size: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          /* Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ForgetPassword(),
                              ));*/
                        },
                        child: AppText(
                          'forget password?',
                          color: ColorData.secondary,
                          size: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ));
  }
}
