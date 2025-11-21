import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/increment': (context) => IncrementPage(),
        '/decrement': (context) => DecrementPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Halaman Utama")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/increment'),
              child: Text("Pergi ke Halaman Increment"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/decrement'),
              child: Text("Pergi ke Halaman Decrement"),
            ),
          ],
        ),
      ),
    );
  }
}

class IncrementPage extends StatefulWidget {
  @override
  _IncrementPageState createState() => _IncrementPageState();
}

class _IncrementPageState extends State<IncrementPage> {
  int number = 0;
  Color backgroundColor = Colors.white;

  void changeBackgroundColor() {
    backgroundColor = Color(Random().nextInt(0xffffffff)).withOpacity(1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Halaman Increment")),
      body: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        color: backgroundColor, // <- warna background berubah
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$number",
                style: TextStyle(fontSize: 50, color: Colors.black),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    number++;
                    changeBackgroundColor();
                  });
                },
                child: Text("Increment +1"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class DecrementPage extends StatefulWidget {
  @override
  _DecrementPageState createState() => _DecrementPageState();
}

class _DecrementPageState extends State<DecrementPage> {
  int number = 0;
  Color backgroundColor = Colors.white;

  void changeBackgroundColor() {
    backgroundColor = Color(Random().nextInt(0xffffffff)).withOpacity(1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Halaman Decrement")),
      body: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        color: backgroundColor, // ⬅ background berubah
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$number",
                style: TextStyle(fontSize: 50, color: Colors.black),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    number--;
                    changeBackgroundColor(); // ⬅ ganti warna
                  });
                },
                child: Text("Decrement -1"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
