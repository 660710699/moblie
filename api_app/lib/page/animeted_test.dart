import 'package:flutter/material.dart';

class AnimetedTest extends StatefulWidget {
  const AnimetedTest({super.key});

  @override
  State<AnimetedTest> createState() => _AnimetedTestState();
}

class _AnimetedTestState extends State<AnimetedTest> {
  int _current = 0; // 0=แดง, 1=เหลือง, 2=เขียว
  double _on = 1.0;
  double _off = 0.3;

  void _next() {
    setState(() {
      _current = (_current + 1) % 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              duration: Duration(milliseconds: 800),
              opacity: _current == 0 ? _on : _off,
              child: Container(width: 100, height: 100, decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),),
            ),
            SizedBox(height: 20),
            AnimatedOpacity(
              duration: Duration(milliseconds: 800),
              opacity: _current == 1 ? _on : _off,
              child: Container(width: 100, height: 100, decoration: BoxDecoration(color: Colors.amber, shape: BoxShape.circle),),
            ),
            SizedBox(height: 20,),
            AnimatedOpacity(
              duration: Duration(milliseconds: 800),
              opacity: _current == 2 ? _on : _off,
              child: Container(width: 100, height: 100, decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle),),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: _next,
              child: Text("Change Light Color"),
            ),
          ],
        ),
        
      ),
    );
  }
}
