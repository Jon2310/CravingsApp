import 'package:flutter/material.dart';

import 'detailed_page.dart';
import 'signin_page.dart';

import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _traverseToDetailedPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const DetailedPage(
              tSpicy: false,
              tSweet: false,
              tSavory: false,
              tSalty: false,
              tSour: false,
              tBitter: false,
            )
        )
    );
  }

  void _traverseToSignIn() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const SignInPage()
      )
    );
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Center( //Use ListView.builder for page of list children: <Widget> + itemCount & itemBuilder ListTile: onTap setState updates screen on change
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: Image(
                        image: AssetImage('assets/logo-placeholder-image.png')
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 60,
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),

              SizedBox(
                height: 60,
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),

              SizedBox(
                height: 50,
                child: TextButton(
                  onPressed: () {
                    if(emailController.text.isNotEmpty && passwordController.text.length >= 6)
                      {
                        debugPrint('Successful Login');
                        login();
                        _traverseToDetailedPage();
                      }
                    else
                      {
                        debugPrint('Email is empty or Password is invalid');
                      }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.blue
                    ),
                  ),
                ),
              ),

              TextButton(
                onPressed: () {
                  _traverseToSignIn();
                },
                child: const Text(
                  'Sign up',
                  style: TextStyle(
                      color: Colors.blue
                  ),
                ),
              ),

            ],
          ),
        ),
      );
    }
    Future<void> login() async  {
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
    );
  }
}
