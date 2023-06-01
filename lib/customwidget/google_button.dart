
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_demo/Utils/authentication.dart';
import 'package:graphql_demo/firebase_login/firebase_login_provider.dart';
import 'package:graphql_demo/home_provider.dart';
import 'package:graphql_demo/signup/signup_page.dart';


class GoogleButton extends ConsumerWidget {


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DecoratedBox(

      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.black, width: 1),
        ),
        color: Colors.white,
      ),
      child: ElevatedButton(

        onPressed: () async {

          await ref.read(authProvider).signInWithGoogle().then((result) {
            print(result);
            if(result !=null && result.email != null){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Login Success'),
              ));
              Navigator.of(context).pop();
            }
          }).catchError((error) {
            print('Registration Error: $error');
          });

        },

        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        child: const Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child:   Image(
                    image: AssetImage("assets/images/ic_google_image.png"),
                    height: 30.0,
                  )),
      ),
    );
  }
}
