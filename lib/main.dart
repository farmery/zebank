import 'package:e_banking/screens/login_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild!.unfocus();
        }
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            // This is the theme of your application.

            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            brightness: Brightness.dark,
            primarySwatch: Colors.blue,
            textTheme: GoogleFonts.latoTextTheme(),
            colorScheme: const ColorScheme(
              primary: Color(0xff131522),
              primaryVariant: Color(0xff272A3F),
              secondary: Color(0xff8A6BA5),
              secondaryVariant: Color(0xffF35383),
              surface: Color(0xff8A6BA5),
              background: Color(0xff272A3F),
              error: Colors.red,
              onPrimary: Colors.white,
              onSecondary: Colors.white,
              onSurface: Colors.white,
              onBackground: Colors.white,
              onError: Colors.white,
              brightness: Brightness.dark,
            )),
        debugShowCheckedModeBanner: false,
        home: ChangeNotifierProvider(
          create: (_) => Auth(),
          child: const LoginWrapper(),
        ),
      ),
    );
  }
}
