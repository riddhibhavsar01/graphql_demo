import "package:flutter/material.dart";
import "package:graphql_flutter/graphql_flutter.dart";
import 'package:shared_preferences/shared_preferences.dart';

class GraphQLConfiguration {
  Link? link ;
  //HttpLink httpLink = HttpLink("https://mobileapp.mageinic.com/graphql",);
  HttpLink httpLink = HttpLink("https://afh.mageinic.com/graphql",);
  ValueNotifier<GraphQLClient>? _client;


   setToken(String token) {
    AuthLink alink = AuthLink(getToken: () async => 'Bearer ' + token);
    link = alink.concat(httpLink);
  }

  GraphQLConfiguration(){
     _client = ValueNotifier(
      GraphQLClient(
        link: link ??  httpLink,
        cache: GraphQLCache(
          store: InMemoryStore(),
        ),
      ),
    );
  }


  ValueNotifier<GraphQLClient>? get client => _client;

  removeToken() {
    link = null;
  }

   getToken() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
   String? token =  preferences.getString("token");
   if(token != null && token.isNotEmpty)
     setToken(token);
  }




  GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: GraphQLCache(
        store: InMemoryStore(),
      ),
      link: link ??  httpLink,
    );
  }
}
