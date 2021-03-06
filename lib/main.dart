import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meeting_cell/resources/auth.dart';
import 'package:meeting_cell/resources/colors.dart';
import 'package:meeting_cell/screens/home_screen.dart';
import 'package:meeting_cell/screens/login_screen.dart';
import 'package:meeting_cell/resources/colors.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        '/home':(context) => const Home(),
      },


      home: StreamBuilder(
        stream: AuthMethods().authChange,
        builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(
                child: LinearProgressIndicator(),
              );
            }
            if(snapshot.hasData){
              return const Home();
            }
            return const Login();
        },
      ),
    );
  }
}
