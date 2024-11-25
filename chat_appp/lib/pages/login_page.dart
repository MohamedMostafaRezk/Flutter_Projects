// ignore_for_file: unused_local_variable, non_constant_identifier_names, must_be_immutable, use_build_context_synchronously, prefer_const_constructors_in_immutables

import 'package:chat_app/helper/snake.dart';
import 'package:chat_app/pages/chatpage.dart';
import 'package:chat_app/widgets/Buttons.dart';
import 'package:chat_app/widgets/Teaxtfield.dart';
import 'package:chat_app/widgets/constants_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email;

  String? password;

  bool isloading = false;
  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Image.asset('assets/images/scholar.png'),
                const Text(
                  'ScholarChat',
                  style: TextStyle(
                    fontSize: 38,
                    color: Colors.white,
                    fontFamily: 'Pacifico',
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 305, top: 100, bottom: 15),
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: custom_textfield(
                    onchange: (data) {
                      email = data;
                    },
                    textf: 'Email',
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: custom_textfield(
                    obscure: true,
                    onchange: (data) {
                      password = data;
                    },
                    textf: 'Password',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SizedBox(
                    width: 400,
                    child: Buttons(
                      onpress: () async {
                        if (formkey.currentState!.validate()) {
                          setState(() {
                            isloading = true; // Start loading state
                          });

                          try {
                            await sign_user();
                            // Navigate to ChatPage only if sign in is successful
                            Navigator.pushNamed(context, Chatpage.id,
                                arguments: [email]);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              showSnakBar(
                                  context, 'No user found for that email.');
                            } else if (e.code == 'wrong-password') {
                              showSnakBar(context,
                                  'Wrong password provided for that user.');
                            } else {
                              // Catch any other Firebase related issues
                              showSnakBar(context, 'Error: ${e.message}');
                            }
                          } catch (e) {
                            // Catch any other type of errors
                            showSnakBar(context,
                                'An unknown error occurred. Please try again.');
                          } finally {
                            setState(() {
                              isloading =
                                  false; // End loading state after operation
                            });
                          }
                        }
                      },
                      txt: 'Sign In',
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'don' 't have an acount',
                      style: TextStyle(
                        color: Color.fromARGB(255, 223, 217, 217),
                        fontSize: 14,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'register_page');
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.all(
                            8), // Optional: Add padding around the text
                        child: const Text(
                          'Sign Up!',
                          style: TextStyle(
                            color: Color.fromARGB(255, 223, 217, 217),
                            fontSize: 18,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> sign_user() async {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
