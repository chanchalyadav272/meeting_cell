import 'package:flutter/material.dart';
import 'package:meeting_cell/resources/auth.dart';
import 'package:meeting_cell/resources/button.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthMethods _authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget> [
          const Text(
            'Start or join a meeting',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 38.0,),
            child: Container(width: MediaQuery.of(context).size.width,
            child: Image(image: AssetImage('assets/images/onboarding0.jpg'),
            fit: BoxFit.fill,)
          ),
    ),
          CustomButton(text: 'Google Sign In',
              onPressed: ()  async{
                bool signIn = await _authMethods.signInWithGoogle(context);
                if(signIn){
                  Navigator.pushNamed(context, '/home');
                }
              })

        ],
      ),
    );
  }
}
