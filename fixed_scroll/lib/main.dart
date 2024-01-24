import 'package:flutter/material.dart';

import 'homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      home: HomePage(),
    );
  }
}

//class HomePage extends StatefulWidget {
//  @override
//  State<HomePage> createState() => _HomePageState();
//}

//class _HomePageState extends State<HomePage> {
//  ScrollController _scrollController = ScrollController();
//  double _appBarOpacity = 1.0;

//  @override
//  void initState() {
//    super.initState();

//    _scrollController.addListener(() {
//      double newOpacity =
//          1.0 - (_scrollController.offset / 150).clamp(0.0, 1.0);

//      if (newOpacity != _appBarOpacity) {
//        setState(() {
//          _appBarOpacity = newOpacity;
//        });
//      }
//    });
//  }

//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: CustomScrollView(
//        controller: _scrollController,
//        slivers: <Widget>[
//          SliverAppBar(
//            expandedHeight: 200.0,
//            floating: false,
//            pinned: true,
//            flexibleSpace: LayoutBuilder(
//              builder: (context, constraints) {
//                return FlexibleSpaceBar(
//                  title: Opacity(
//                    opacity: _appBarOpacity,
//                    child: Text('Current Weather'),
//                  ),
//                  background: Image.network(
//                    'https://example.com/current_weather_background.jpg',
//                    fit: BoxFit.cover,
//                  ),
//                );
//              },
//            ),
//          ),
//          SliverToBoxAdapter(
//            child: Container(
//              height: 500,
//              child: ListView.builder(
//                  itemCount: 10,
//                  itemBuilder: (context, index) => StickyHeaderBuilder(
//                      builder: (context, st) {
//                        st = 1 - st.clamp(0, 10);
//                        return Container(
//                          width: double.infinity,
//                          color: Color.lerp(Colors.white, Colors.green, st),
//                          child: Padding(
//                            padding: const EdgeInsets.all(16.0),
//                            child: Text("Sticky Headers $index"),
//                          ),
//                        );
//                      },
//                      content: Text("Content"))),
//            ),
//          ),
//          SliverStickyHeader(
//            sticky: true,
//            header: Container(
//              height: 60.0,
//              color: Colors.green,
//              alignment: Alignment.center,
//              child: Text('10-Day Forecast0'),
//            ),
//            sliver: SliverList(
//              delegate: SliverChildBuilderDelegate(
//                (context, index) {
//                  index = 1 - index.clamp(0, 1);
//                  return ListTile(
//                    title: Text('Day $index'),
//                    // Additional forecast details here
//                  );
//                },
//                childCount: 10,
//              ),
//            ),
//          ),
//          SliverStickyHeader(
//            header: Container(
//              height: 60.0,
//              color: Colors.grey.withOpacity(1.0 - _appBarOpacity),
//              alignment: Alignment.center,
//              child: Text('10-Day Forecast1'),
//            ),
//            sliver: SliverList(
//              delegate: SliverChildBuilderDelegate(
//                (BuildContext context, int index) {
//                  return ListTile(
//                    title: Text('Day $index'),
//                    // Additional forecast details here
//                  );
//                },
//                childCount: 15,
//              ),
//            ),
//          ),

//          // Additional Slivers for more content or sections
//        ],
//      ),
//    );
//  }
//}
