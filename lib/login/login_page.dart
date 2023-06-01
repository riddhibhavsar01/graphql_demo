import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_demo/graphql/graphql_config.dart';
import 'package:graphql_demo/login/login_provider.dart';
import 'package:graphql_demo/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    var error = ref.watch(errorProvider.state).state;
    var loading = ref.watch(loadingProvider.state).state;

    ref.watch(loginProvider).when(data: (token) {
      if (token.isNotEmpty) {
        ref.read(loginProvider.notifier).setToken(token);
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
        child: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                    ref.read(loginProvider.notifier).loginUser(
                        emailController.text, passwordController.text);
                  },
                  child: Text('Login')),
              SizedBox(
                height: 10,
              ),
              if (error.isNotEmpty)
                Text(
                  error,
                  style: TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                )
            ],
          ),
          if (loading) Center(child: CircularProgressIndicator())
        ]),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
