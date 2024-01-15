import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _showNavBar = true;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 230) {
        if (_showNavBar) {
          setState(() {
            _showNavBar = false;
          });
        }
      } else {
        if (!_showNavBar) {
          setState(() {
            _showNavBar = true;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final title = 'GeeksforGeeks';

    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 300,
              floating: false,
              pinned: true,
              flexibleSpace: LayoutBuilder(
                builder: (context, constraints) {
                  bool isScrollingDown = _scrollController.hasClients &&
                      _scrollController.position.userScrollDirection ==
                          ScrollDirection.reverse;

                  return Container(
                    padding: EdgeInsets.all(10),
                    height: 340,
                    width: double.infinity,
                    child: isScrollingDown
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'TEST',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'TEST',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'TEST',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 1,
                              ),
                              Container(
                                height: 1,
                              ),
                              Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'TEST',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'TEST',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'TEST',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: NetworkImage('https://picsum.photos/400/400'),
                      fit: BoxFit.cover,
                    )),
                  );
                },
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                addSemanticIndexes: false,
                (context, index) => ListTile(
                  tileColor: (index % 2 == 0) ? Colors.white : Colors.green[50],
                  title: Center(
                    child: Text(
                      '$index',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 50,
                        color: Colors.greenAccent[400],
                      ),
                    ),
                  ),
                ),
                childCount: 51,
              ),
            ),
            SliverStickyHeader(
              header: Container(
                height: 60.0,
                color: Colors.lightBlue,
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Header #0',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) => ListTile(
                    leading: CircleAvatar(
                      child: Text('0'),
                    ),
                    title: Text('List tile #$i'),
                  ),
                  childCount: 50,
                ),
              ),
            ),
            SliverStickyHeader(
              header: Container(
                height: 20.0,
                color: Colors.lightBlue,
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Header #1',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) => ListTile(
                    leading: CircleAvatar(
                      child: Text('0'),
                    ),
                    title: Text('List tile #$i +1'),
                  ),
                  childCount: 40,
                ),
              ),
            ),
            SliverStickyHeader(
              header: Container(
                height: 60.0,
                color: Colors.lightBlue,
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Header #2',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) => Container(
                    child: Image.network(
                      'https://picsum.photos/400/400',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 200.0,
                    ),
                  ),
                  childCount: 3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
