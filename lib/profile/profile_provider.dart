
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_demo/home_provider.dart';
import 'package:graphql_flutter/graphql_flutter.dart';



final result = FutureProvider.autoDispose<QueryResult>((ref) async {
  return ref.read(homeProvider).currentUser(ref);
});






