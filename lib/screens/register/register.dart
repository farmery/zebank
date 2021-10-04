import 'package:e_banking/model/user.dart';
import 'package:e_banking/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../auth.dart';

class Register extends StatefulWidget {
  const Register({Key? key, required this.auth}) : super(key: key);
  final Auth auth;

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  String? userName;
  String? password;
  @override
  Widget build(BuildContext context) {
    final phoneHeight = (MediaQuery.of(context).size.height) -
        MediaQuery.of(context).padding.bottom;
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Padding(
            padding: EdgeInsets.only(top: 16),
            child: Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        resizeToAvoidBottomInset: false,
        body: Form(
          key: formKey,
          child: SizedBox(
            height: phoneHeight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: phoneHeight * 0.25,
                    child: Text(
                      'Ze-Bank',
                      style: GoogleFonts.redHatDisplay(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xffFEE8D7),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Create an account with Ze-Bank',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    onChanged: (val) {
                      userName = val;
                    },
                    validator: (val) {
                      if (val!.length < 4) {
                        return 'UserName cannot be less than 4 characters';
                      }
                    },
                    decoration: InputDecoration(
                      label: const Text('UserName'),
                      labelStyle:
                          TextStyle(color: Colors.white.withOpacity(0.65)),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white10)),
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color:
                                Theme.of(context).colorScheme.secondaryVariant),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    validator: (val) {
                      if (val!.length < 4) {
                        return 'Enter a valid Email-Address';
                      }
                    },
                    decoration: InputDecoration(
                      label: const Text('Email Adress'),
                      labelStyle:
                          TextStyle(color: Colors.white.withOpacity(0.65)),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white10)),
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color:
                                Theme.of(context).colorScheme.secondaryVariant),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    style: const TextStyle(color: Colors.white),
                    onChanged: (val) {
                      password = val;
                    },
                    validator: (val) {
                      if (val!.length < 4) {
                        return 'Password too short';
                      }
                    },
                    decoration: InputDecoration(
                      label: const Text('Password'),
                      labelStyle:
                          TextStyle(color: Colors.white.withOpacity(0.65)),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white10)),
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color:
                                Theme.of(context).colorScheme.secondaryVariant),
                      ),
                    ),
                  ),
                  const Spacer(flex: 1),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: TextButton(
                        child: Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondaryVariant,
                              borderRadius: BorderRadius.circular(5)),
                          child: const Text(
                            'Create Account',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            widget.auth.loginUser(
                              User(
                                displayName: userName!,
                                id: userName! +
                                    DateTime.now().toIso8601String(),
                              ),
                            );
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
