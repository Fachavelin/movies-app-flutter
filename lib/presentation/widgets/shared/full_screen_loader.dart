import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages(){
final messages = <String>[
      'Fetching movies…',
      'Loading trending titles…',
      'Sorting by popularity…',
      'Finding something you’ll love…',
      'Grabbing cast & crew details…',
      'Loading posters and backdrops…',
    ];


    return Stream.periodic(
      Duration(milliseconds: 1200),
      (step) {
        return messages[step];
      }
    ).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Please wait'),
          SizedBox(height: 10),
          CircularProgressIndicator(strokeWidth: 2),
          StreamBuilder(
            stream: getLoadingMessages(), 
            builder: (context, snapshot){
              if(!snapshot.hasData) return Text('Loading…');
              
              return Text(snapshot.data!);
            }
          )
        ],

      ),
    );
  }
}