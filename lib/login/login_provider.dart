import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_demo/graphql/graphql_config.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';
import '../main.dart';

final loadingProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});

final errorProvider = StateProvider.autoDispose<String>((ref) {
  return "";
});


final loginProvider = StateNotifierProvider.autoDispose<LoginNotifier,AsyncValue<String>>((ref)=>LoginNotifier(ref.read));

class LoginNotifier extends StateNotifier<AsyncValue<String>> {

  Reader read;
  LoginNotifier(this.read): super(const AsyncData(""));

  loginUser(String email, String password) async {
    GraphQLConfiguration graphQLConfig = read(graphQLConfigProvider);
    GraphQLClient _client = graphQLConfig.clientToQuery();
    state = const AsyncLoading();

    QueryResult result = await _client
        .mutate(MutationOptions(document: gql(generateToken), variables: {
      'email': email,
      'password': password,
    }));

    if(result != null){
      if(result.hasException){
       state= AsyncError(result.exception?.graphqlErrors[0].message ?? "");
      }else if(result.data != null){
        state= AsyncData(result.data?['generateCustomerToken']['token']);

      }
    }
  }

  Future<void> setToken(String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("token", token);
    read(graphQLConfigProvider).setToken(token);
  }
}





