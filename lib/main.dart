import 'package:flutter/material.dart';
import 'package:meeting_cell/resources/colors.dart';
import 'package:meeting_cell/screens/login.dart';
import 'package:meeting_cell/resources/colors.dart';



void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false
      ,
      title: 'Meeting cell',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor
      ),
      routes: {
        '/login': (context) => const Login(),
      },


      home: const Login(),
    );
  }
}
