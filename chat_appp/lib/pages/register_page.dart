// ignore_for_file: must_be_immutable, avoid_print, unused_local_variable, unnecessary_brace_in_string_interps, use_build_context_synchronously, non_constant_identifier_names, unnecessary_import, prefer_const_constructors_in_immutables

import 'package:chat_app/helper/snake.dart';
import 'package:chat_app/widgets/Buttons.dart';
import 'package:chat_app/widgets/Teaxtfield.dart';
import 'package:chat_app/widgets/constants_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                Padding(
                  padding: const EdgeInsets.only(top: 65, right: 350),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
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
                  padding: EdgeInsets.only(right: 290, top: 65, bottom: 15),
                  child: Text(
                    'Register',
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
                          isloading = true;
                          setState(() {});

                          try {
                            await register_user();
                            showSnakBar(context, 'Sucusess register');
                            Navigator.pop(context);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              showSnakBar(context, 'Password is weak');
                            } else if (e.code == 'email-already-in-use') {
                              showSnakBar(context,
                                  'The account already exists for that email.');
                            }
                          } catch (e) {
                            showSnakBar(
                                context, 'Try later, there was an error');
                          }
                          isloading = false;
                          setState(() {});
                        }
                      },
                      txt: 'Register',
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'if you have an acount',
                      style: TextStyle(
                        color: Color.fromARGB(255, 223, 217, 217),
                        fontSize: 14,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.all(
                            8), // Optional: Add padding around the text
                        child: const Text(
                          'Sign In',
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

  Future<void> register_user() async {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
