import 'package:flutter/material.dart';

import 'login_page.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const SignInPage()
  );
}

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});
  @override
  SignInPageState createState() => SignInPageState();
}

class CheckBoxState {
  final String title;
  bool value;

  CheckBoxState({
    required this.title,
    this.value = false,
});
}

class SignInPageState extends State<SignInPage> {

  void _traverseToLogIn() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const LoginPage(),
        )
    );
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final allergenList = [
    CheckBoxState(title: 'Milk'),
    CheckBoxState(title: 'Eggs'),
    CheckBoxState(title: 'Fish'),
    CheckBoxState(title: 'Shellfish'),
    CheckBoxState(title: 'Tree nuts'),
    CheckBoxState(title: 'Peanuts'),
    CheckBoxState(title: 'Wheat'),
    CheckBoxState(title: 'Soy'),
    CheckBoxState(title: 'Sesame'),
  ];

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(     //Use ListView.builder for page of list children: <Widget> + itemCount & itemBuilder ListTile: onTap setState updates screen on change
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              SizedBox(
                height: 70,
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                  ),
                ),
              ),

              SizedBox(
                height: 70,
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),

              SizedBox(
                height: 70,
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),

              const Text(
                  'Allergens',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),

              ...allergenList.map(buildSingleCheckbox),

              TextButton(
                onPressed: () {
                  FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text,
                  );
                  CollectionReference collRef = FirebaseFirestore.instance.collection('client');
                  collRef.add({
                    'name': nameController.text,
                    'email':  emailController.text,
                    'milk': allergenList[0].value,
                    'eggs': allergenList[1].value,
                    'fish': allergenList[2].value,
                    'shellfish':  allergenList[3].value,
                    'tree_nuts': allergenList[4].value,
                    'peanuts': allergenList[5].value,
                    'wheat': allergenList[6].value,
                    'soy':  allergenList[7].value,
                    'sesame': allergenList[8].value,
                  });
                  _traverseToLogIn();
                },
                child: const Text(
                  'Create Account',
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
  Widget buildSingleCheckbox(CheckBoxState checkbox) => CheckboxListTile(
    value: checkbox.value,
    title: Text(
      checkbox.title,
    ),
    onChanged: (value) => setState(() => checkbox.value = value!),
  );
  }

