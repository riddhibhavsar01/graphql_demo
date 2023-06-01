import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_demo/models/product_details_model.dart';

import 'package:graphql_demo/models/user_model.dart';
import 'package:graphql_demo/profile/profile_provider.dart';


class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileData = ref.watch(result);

    return SafeArea(
      child: Scaffold(
          body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: profileData.when(
            data: (result) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(ProductData.fromJson(result.data).products?.items?.single.name.toString() ?? ""),
                ],
              );
            },
            error: (e, st) => Text('Error: $e'),
            loading: () => Center(child: CircularProgressIndicator())),
      )),
    );
  }


}
