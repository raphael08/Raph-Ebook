import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_ebook/page/auth_page.dart';
import 'package:flutter_ebook/views/main_screen.dart';

class Page extends StatelessWidget {
  const Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
    Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MainScreen();
        }else{
                return AuthPage();
        }
      },
      ),
      
      
      
     
    );
    
  
}