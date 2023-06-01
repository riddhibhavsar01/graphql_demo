import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:graphql_demo/customwidget/google_button.dart';

class FirebaseLogin extends ConsumerWidget {
   FirebaseLogin({Key? key}) : super(key: key);

   @override
    Widget build(BuildContext context,WidgetRef ref) {
      return Scaffold(

          body: Center(child: GoogleButton()));
    }

  }

