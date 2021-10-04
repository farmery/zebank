import 'package:e_banking/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home/home.dart';
import 'login/login.dart';

class LoginWrapper extends StatelessWidget {
  const LoginWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authState = Provider.of<Auth>(context);
    return authState.isLoggedIn ? const Home() : const Login();
  }
}
