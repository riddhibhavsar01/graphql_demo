



import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_demo/Utils/authentication.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';
import 'graphql/graphql_config.dart';
import 'login/login_provider.dart';
import 'main.dart';

final homeProvider = Provider((_)=> HomeProvider());


final progressProvider = StateNotifierProvider<ProgressNotifier,AsyncValue<double?>>(
      (ref)=>ProgressNotifier());
class ProgressNotifier extends StateNotifier<AsyncValue<double?>> {

  ProgressNotifier(): super(AsyncData(0));

  addProgress(double progress){
    state =  AsyncData(progress);
  }



}
class HomeProvider{

Future<QueryResult> currentUser(AutoDisposeFutureProviderRef ref) async {

  GraphQLConfiguration graphQLConfig = ref.read(graphQLConfigProvider);
  GraphQLClient _client = graphQLConfig.clientToQuery();
  await getToken('token').then((value) async {
    graphQLConfig.setToken(value ?? "");
  });
  QueryOptions options = QueryOptions(document: gql(fetchUser),);
  final QueryResult? result = await _client.query(options);

  if (result != null && result.hasException) {
    return throw Exception(result.exception?.graphqlErrors.first.message);  }
  return Future.value(result);
}

  Future<String?> getToken(String key) async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance();
    return sharedPreferences.getString(key);
  }

}