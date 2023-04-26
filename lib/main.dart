import 'package:flutter/material.dart';
import 'package:midam_wagr/network/network.dart';
import 'package:midam_wagr/pages/leaderboard/leaderboard.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const WagrMidamApp());
}

class WagrMidamApp extends StatelessWidget {
  const WagrMidamApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(
          value: buildNetworkClient(),
        ),
      ],
      child: MaterialApp(
        title: 'Wagr Mid-Am Rankings',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const LeaderBoard(),
      ),
    );
  }
}
