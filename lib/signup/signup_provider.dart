
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_demo/graphql/graphql_config.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../constants.dart';
import '../main.dart';


final loadingProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});

final errorProvider = StateProvider.autoDispose<String>((ref) {
  return "";
});

final signupProvider = StateNotifierProvider.autoDispose<SignupNotifier,AsyncValue<String>>((ref)=>SignupNotifier(ref.read));

class SignupNotifier extends StateNotifier<AsyncValue<String>> {
  Reader read;
  SignupNotifier(this.read): super(AsyncData(""));


  signupUser(String email, String password,String firstName,String lastname) async {
    GraphQLConfiguration graphQLConfig = read(graphQLConfigProvider);
    GraphQLClient _client = graphQLConfig.clientToQuery();
    state = AsyncLoading();

    QueryResult result = await _client
        .mutate(MutationOptions(document: gql(registerUser), variables: {
      'email': email,
      'password': password,
      'firstname': firstName,
      'lastname': lastname,
    }));

    if(result != null){
      if(result.hasException){
        state= AsyncError(result.exception?.graphqlErrors[0].message ?? "");
      }else if(result.data != null){
        state= AsyncData('success');

      }
    }
  }


}