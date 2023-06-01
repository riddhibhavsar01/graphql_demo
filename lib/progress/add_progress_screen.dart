import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_demo/progress/progress_screen.dart';

import '../home_provider.dart';

class AddProgressScreen extends ConsumerWidget {
  AddProgressScreen({Key? key}) : super(key: key);
  final numberController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              controller: numberController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Progress',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  double progress = double.parse(numberController.text);
                  if (progress <= 100) {
                    ref.read(progressProvider.notifier).addProgress(progress/100);
                    Navigator.pop(context);
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Enter valid value'),
                    ));
                  }
                },
                child: Text('Add'))
          ],
        ),
      ),
    );
  }
}
