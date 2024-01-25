import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController = ScrollController();
  double _appBarOpacity = 1.0;
  bool _visible = true;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      double newOpacity = 7.0 - (_scrollController.offset - 230) / 100;
      newOpacity = newOpacity.clamp(0.5, 1.0);

      if (newOpacity != _appBarOpacity) {
        setState(() {
          _appBarOpacity = newOpacity;
        });
      }
    });
  }

  SliverGridDelegate _gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 8.0,
    mainAxisSpacing: 8.0,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            CustomScrollView(
              //shrinkWrap: true,
              controller: _scrollController,
              slivers: <Widget>[
                SliverGrid(
                  gridDelegate: _gridDelegate,
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return const Text('OK.');
                    },
                    childCount: 2,
                  ),
                ),
                SliverGrid(
                  gridDelegate: _gridDelegate,
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return const Text('...');
                    },
                    childCount: 2,
                    semanticIndexOffset: 2,
                  ),
                ),
                SliverAnimatedOpacity(
                  opacity: _visible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  sliver: SliverFixedExtentList(
                    itemExtent: 20.0,
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Container(
                          color: index.isEven
                              ? Colors.indigo[200]
                              : Colors.orange[200],
                        );
                      },
                      childCount: 2,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                    child: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      _visible = !_visible;
                    });
                  },
                  tooltip: 'Toggle opacity',
                  child: const Icon(Icons.flip),
                )),
                SliverAppBar(
                  expandedHeight: 300,
                  floating: false,
                  pinned: true,
                  backgroundColor: Colors.green.withOpacity(_appBarOpacity),
                  flexibleSpace: LayoutBuilder(
                    builder: (context, constraints) {
                      bool isScrollingDown = _scrollController.hasClients &&
                          _scrollController.position.userScrollDirection ==
                              ScrollDirection.reverse;

                      double cardTopPosition = isScrollingDown
                          ? -100
                          : _scrollController.offset > 300
                              ? -100
                              : 60;

                      return Container(
                        height: 340,
                        width: double.infinity,
                        child: Center(child: Text("Appbar")),
                        decoration: BoxDecoration(
                          color: Color(0XFF20A248),
                        ),
                      );
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                SliverStickyHeader(
                  sticky: true,
                  header: Opacity(
                    opacity: _appBarOpacity,
                    child: Container(
                      height: 60.0,
                      color: Colors.grey,
                      child: Center(
                        child: Text("Header 1"),
                      ),
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
                      childCount: 10,
                    ),
                  ),
                ),
                SliverGrid(
                  gridDelegate: _gridDelegate,
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Container(color: Colors.amber, child: Text('OK'));
                    },
                    semanticIndexCallback: (widget, localIndex) {},
                    childCount: 2,
                    semanticIndexOffset: 4,
                  ),
                ),
                SliverStickyHeader(
                  sticky: true,
                  header: Container(
                    height: 20.0,
                    color: Colors.green,
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
                    color: Colors.green,
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
          ],
        ),
      ),
    );
  }
}
