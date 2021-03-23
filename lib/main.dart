import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Production test task'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.help,
              color: Colors.white,
            ),
            onPressed: () {
              print('Need add message');
              final snackBar = SnackBar(
                content: Text('You can find feature using double tap :)'),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {},
                ),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          )
        ],
      ),
      body: MainConteiner(),
    );
  }
}

class MainConteiner extends StatefulWidget {
  @override
  _MainConteinerState createState() => _MainConteinerState();
}

class _MainConteinerState extends State<MainConteiner> {
  Color _color = Color(0xFFFFFFFF);

  navigate(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChanceScreen()),
    );

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("$result")));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
          onTap: () {
            setState(() {
              _color = Color(Random().nextInt(0xFFFFFFFF));
            });
          },
          onDoubleTap: () => navigate(context),
          child: Container(
            decoration: BoxDecoration(color: _color),
            child: Center(
              child: Text(
                'Hey there',
                style: TextStyle(fontSize: 50.0),
              ),
            ),
          )),
    );
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Pick an option'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 'Like, subscribe and bell :)');
              },
              child: Text('Give a chance'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 'Dislike. Unsubscribe :(');
              },
              child: Text('Nooo'),
              style: ElevatedButton.styleFrom(
                primary: Colors.teal,
                onPrimary: Colors.white,
                onSurface: Colors.grey,
              ),
            ),
          )
        ],
      ),
    ),
  );
}

class ChanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Please select *.*'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: Text(
                  'Give a chance',
                  style: TextStyle(fontSize: 20.0),
                ),
                style: ElevatedButton.styleFrom(primary: Colors.green),
                onPressed: () {
                  Navigator.pop(context, 'Like, subscribe and bell :) ');
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: Text(
                  'Nooo',
                  style: TextStyle(fontSize: 15.0),
                ),
                style: ElevatedButton.styleFrom(primary: Colors.red),
                onPressed: () {
                  Navigator.pop(context, 'Dislike. Unsubscribe :(');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
