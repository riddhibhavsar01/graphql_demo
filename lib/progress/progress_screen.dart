
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../home_provider.dart';
import 'add_progress_screen.dart';

class ProgressScreen extends ConsumerWidget {
  const ProgressScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context,WidgetRef ref) {

   ref.watch(progressProvider);
    return SafeArea(
      child: Scaffold(body:
      Stack(

        children: [
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: ((context){
                  return AddProgressScreen();
                })));
          }, child: Text('Add Progress'))
          , Center(
            child: RotatedBox(
              quarterTurns: -1,
              child: LinearProgressIndicator(
                minHeight: 20,
                value: ref.read(progressProvider.notifier).state.value ?? 0,
              ),
            ),
          ),
        ],
      ),),
    );
  }
}
