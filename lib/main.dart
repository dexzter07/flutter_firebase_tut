import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/views/auth/sign_in.dart';
import 'package:flutter_firebase/views/auth/sign_up.dart';
import 'package:flutter_firebase/views/dashboard.dart';
import 'package:flutter_firebase/views/welcome_screen.dart';

import 'constants/constants.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/welcomeScreen',
      routes: {
        '/welcomeScreen': (context) => const WelcomeScreen(),
        '/login': (context) => SignInPage(),
        '/register': (context) => SignUpPage(),
        '/dashboard': (context) => const MainDashboard(),

      },
      debugShowCheckedModeBanner: false,
      title: "Flutter Firebase Tutorial",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: primaryColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: textColor),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            padding: const EdgeInsets.all(defaultPadding),
          )
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: textFieldBorder,
          enabledBorder: textFieldBorder,
          focusedBorder: textFieldBorder,
        )
      ),
      home:const WelcomeScreen(),
    );
  }
}
