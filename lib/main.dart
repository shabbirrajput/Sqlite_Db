import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

late Database db;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  db = await openDatabase('my_db.db');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String counter = '';

  TextEditingController inputController = TextEditingController();

  Future<void> _incrementCounter() async {
    counter = '';

    // await db.execute(
    //   "CREATE TABLE Models(id INTEGER PRIMARY KEY, fruitName TEXT, quantity TEXT)",
    // );

    // await db
    //     .execute(
    //         "INSERT INTO Models(id, fruitName, quantity) VALUES(7,'Watermelon','15' )")
    //     .then((value) {
    //   print('object--------------------');
    // });

    await db.rawQuery('SELECT * FROM Models').then((value) {
      value.forEach((element) {
        print("element['id'] =================> ${element['id']}");
        print(
            "element['fruitName'] =================> ${element['fruitName']}");
        print("element['quantity'] =================> ${element['quantity']}");
      });
/*      print('object--------------------${jsonEncode(value.first)}');

      ModelTestResponse modelTestResponse =
          ModelTestResponse.fromMap(value.first);
      print(
          'modelTestResponse.name--------------------${modelTestResponse.name}');
      print('modelTestResponse.id--------------------${modelTestResponse.id}');
      print(
          'modelTestResponse.value--------------------${modelTestResponse.value}');
      print(
          'modelTestResponse.num--------------------${modelTestResponse.num}');*/
    });

    /*int count = await db.rawUpdate(
        'UPDATE Test SET name = ?, value = ? WHERE name = ?',
        ['Shubham', '9876', 'some name']);*/

    // int count =
    //     Sqflite.firstIntValue(await db.rawQuery('SELECT (*) FROM Test')) ?? 0;
    // print('updated: $count');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              counter,
            ),
            TextField(
              controller: inputController,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _incrementCounter();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
