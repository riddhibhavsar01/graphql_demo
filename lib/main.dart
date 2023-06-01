import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_demo/firebase_login/firebase_login_provider.dart';
import 'package:graphql_demo/firebase_login/firebase_login_screen.dart';
import 'package:graphql_demo/google_map/google_map_screen.dart';

import 'package:graphql_demo/login/login_page.dart';
import 'package:graphql_demo/profile/profile_page.dart';
import 'package:graphql_demo/progress/progress_screen.dart';
import 'package:graphql_demo/signup/signup_page.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'graphql/graphql_config.dart';
import 'home_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
runApp(ProviderScope(child: MyApp()));

}
final graphQLConfigProvider = Provider <GraphQLConfiguration> ((ref) {
  return GraphQLConfiguration();
});
class MyApp extends ConsumerWidget {


  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    ref.read(graphQLConfigProvider).getToken();
    return GraphQLProvider(
      client: ref.watch(graphQLConfigProvider).client,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,

        ),
        home: ProviderScope(child:  MyHomePage()),
      ),
    );
  }


}

class MyHomePage extends ConsumerWidget {

  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:  [
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: ((context){
                      return LoginScreen();
                    })
                ));
              }, child: Text('Login')),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: ((context){
                      return SignupScreen();
                    })
                ));
              }, child: Text('Sign up')),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: ((context){
                      return ProfileScreen();
                    })
                ));
              }, child: Text('Profile'))
              ,
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: ((context){
                      return ProgressScreen();
                    })
                ));
              }, child: Text('Progress Bar')),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: ((context){
                      return FirebaseLogin();
                    })
                ));
              }, child: Text('Firebase Login')),
              ElevatedButton(onPressed: (){
               ref.read(authProvider).signOutGoogle();
               ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                 content: Text('Logout Success'),
               ));
              }, child: Text('Logout')),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: ((context){
                      return MapScreen();

                    })
                ));
              }, child: Text('Google Map'))
            ],
          ),
        ),
      );

  }


/*  Query(
  options: QueryOptions(
  document: gql(readCapsules),
  variables: {"pageSize": 10,
  "currentPage" : 1,
  "search" : "jacket"
  },
  ),
  builder: (result, {fetchMore, refetch}) {

  if (result.isLoading) {
  return const Center(
  child: CircularProgressIndicator(),
  );
  }

 print(result.data);
  final capsuleList = Data.fromJson(result.data).characters.results;
  return Column(
  children: [
  Expanded(
  child: ListView.separated(
  itemCount: capsuleList.length,

  itemBuilder: (context, index) {
  return Container(
  color: Colors.yellow,
  padding: EdgeInsets.all(50),
  child: Text(
  capsuleList[index].name ?? "",
  ),
  );
  }, separatorBuilder: (BuildContext context, int index) {return Divider(); },
  ),
  ),
  ],
  );
  },
  ),*/

   }






