import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter UI Design'),
      ),
      body: ListView(scrollDirection: Axis.vertical, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card
            Card(
              margin: EdgeInsets.all(16.0),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'This is a Card',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),

            Container(
              height: 200,
              width: 300,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    color: Colors.red,
                  ),
                  Container(
                    height: 20,
                    width: 20,
                    color: Colors.red,
                  ),
                  Container(
                    height: 20,
                    width: 80,
                    color: Colors.red,
                  ),
                  Container(
                    height: 20,
                    width: 80,
                    color: Colors.red,
                  ),
                  Container(
                    height: 20,
                    width: 80,
                    color: Colors.green,
                  ),
                  Container(
                    height: 20,
                    width: 80,
                    color: Colors.red,
                  ),
                ],
              ),
            ),

            Container(
              height: 150.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    width: 150.0,
                    margin: EdgeInsets.all(8.0),
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        'Item $index',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Multiple Columns
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Column 1',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text('Item 1'),
                    Spacer(),
                    Icon(Icons.star),
                  ],
                ),
                Row(
                  children: [
                    Text('Item 2'),
                    Spacer(),
                    Icon(Icons.star),
                  ],
                ),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Column 2',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text('Item 3'),
                    Spacer(),
                    Icon(Icons.star),
                  ],
                ),
                Row(
                  children: [
                    Text('Item 4'),
                    Spacer(),
                    Icon(Icons.star),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Column 2',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text('Item 3'),
                    Spacer(),
                    Icon(Icons.star),
                  ],
                ),
                Row(
                  children: [
                    Text('Item 4'),
                    Spacer(),
                    Icon(Icons.star),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Column 2',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text('Item 3'),
                    Spacer(),
                    Icon(Icons.star),
                  ],
                ),
                Row(
                  children: [
                    Text('Item 4'),
                    Spacer(),
                    Icon(Icons.star),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Column 2',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text('Item 3'),
                    Spacer(),
                    Icon(Icons.star),
                  ],
                ),
                Row(
                  children: [
                    Text('Item 4'),
                    Spacer(),
                    Icon(Icons.star),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Column 2',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text('Item 3'),
                    Spacer(),
                    Icon(Icons.star),
                  ],
                ),
                Row(
                  children: [
                    Text('Item 4'),
                    Spacer(),
                    Icon(Icons.star),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Column 2',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text('Item 3'),
                    Spacer(),
                    Icon(Icons.star),
                  ],
                ),
                Row(
                  children: [
                    Text('Item 4'),
                    Spacer(),
                    Icon(Icons.star),
                  ],
                ),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
