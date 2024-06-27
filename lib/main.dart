import 'package:flutter/material.dart';

import 'home_page.dart';
import 'detailed_page.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, AsyncSnapshot<User?> snapshot)  {
            if(snapshot.hasData && snapshot.data!=null)  {
              debugPrint('Logged in');
              return const DetailedPage(
                tSpicy: false,
                tSweet: false,
                tSavory: false,
                tSalty: false,
                tSour: false,
                tBitter: false,
              );
            }
            else if(snapshot.connectionState == ConnectionState.waiting) {
              debugPrint('Loading');
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            debugPrint('Not Logged in');
            return const MyHomePage();
          },
      ),
    );
  }
}

