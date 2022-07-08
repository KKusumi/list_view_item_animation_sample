import 'package:flutter/material.dart';
import 'package:list_view_item_animation/sample_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final nameList = [
      'Bulbasour',
      'Ivysaur',
      'Venusaur',
      'Charmander',
      'Charmeleon',
      'Charizard',
      'Squirtle',
      'Wartortle',
      'Blastoise',
      'Caterpie',
      'Metapod',
      'Butterfree',
      'Weedle',
      'Kakuna',
      'Beedrill',
      'Pidgey',
      'Pidgeotto',
    ];
    final listKey = GlobalObjectKey<SampleListState>(context);

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(title),
      ),
      body: SampleList(
        key: listKey,
        nameList: nameList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          listKey.currentState?.animate(5);
        },
        tooltip: 'Flash',
        child: const Icon(Icons.flash_on),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
