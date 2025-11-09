import 'package:flutter/material.dart';

class Answer1 extends StatelessWidget {
  const Answer1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(title: Text('Comment Thread')),
      body: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(radius: 24, child: Text('A')),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'User A',
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'This is the main comment. Flutter layouts are fun!',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(Icons.thumb_up_alt_outlined, size: 18),
                  Text(' 12'),
                  SizedBox(width: 20),
                  Icon(Icons.comment_outlined, size: 18),
                  Text(' Reply'),
                  Spacer(),
                  Text('1h ago', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Row(
                
                children: [
                  CircleAvatar(radius: 18, child: Text('B')),
                  SizedBox(width: 15),
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      Text('User B', style: TextStyle(fontWeight: FontWeight.bold),),
                      Text('I agree!'),
                      
                    ],
                  )),
                  SizedBox(height: 70,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
