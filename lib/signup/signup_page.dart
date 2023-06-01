import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_demo/profile/profile_page.dart';
import 'package:graphql_demo/signup/signup_provider.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../constants.dart';
import '../main.dart';

class SignupScreen extends ConsumerWidget {
  SignupScreen({Key? key}) : super(key: key);

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var error = ref.watch(errorProvider.state).state;
    var loading = ref.watch(loadingProvider.state).state;

    ref.watch(signupProvider).when(data: (result) {
      if (result.isNotEmpty && result.compareTo('success') == 1) {
        SchedulerBinding.instance?.addPostFrameCallback((_) {
          Navigator.pop(context);
        });
      }
    }, error: (message, _) {
      error = message.toString();
    }, loading: () {
      loading = true;
    });
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: firstNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'First Name',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: lastNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Last Name',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email Id',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      ref.read(signupProvider.notifier).signupUser(
                          emailController.text,
                          passwordController.text,
                          firstNameController.text,
                          lastNameController.text);
                    },
                    child: Text('Sign up')),
                if (error.isNotEmpty)
                  Text(
                    error,
                    style: TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  )
              ],
            ),
            if (loading) Center(child: CircularProgressIndicator())
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
  }
}
