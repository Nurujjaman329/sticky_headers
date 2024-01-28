import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shimmer',
      routes: <String, WidgetBuilder>{
        'loading': (_) => const LoadingListPage(),
        'slide': (_) => SlideToUnlockPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shimmer'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: <Widget>[
            ListTile(
              title: const Text('Loading List'),
              onTap: () => Navigator.of(context).pushNamed('loading'),
            ),
            ListTile(
              title: const Text('Slide To Unlock'),
              onTap: () => Navigator.of(context).pushNamed('slide'),
            )
          ],
        ),
      ),
    );
  }
}

class LoadingListPage extends StatefulWidget {
  const LoadingListPage({super.key});

  @override
  State<LoadingListPage> createState() => _LoadingListPageState();
}

class _LoadingListPageState extends State<LoadingListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loading List'),
      ),
      body: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          enabled: true,
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                _shimmerUpcomingPayments(),
              ],
            ),
          )),
    );
  }

  Widget _shimmerUpcomingPayments() {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .25,
      child: Shimmer.fromColors(
        baseColor: Colors.red,
        highlightColor: Colors.green,
        child: SizedBox(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            scrollDirection: Axis.vertical,
            itemBuilder: (_, index) {
              return SizedBox(
                width: 350,
                child: Container(
                  height: 100,
                  width: 50,
                  color: Colors.green,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class SlideToUnlockPage extends StatefulWidget {
  SlideToUnlockPage({super.key});

  @override
  State<SlideToUnlockPage> createState() => _SlideToUnlockPageState();
}

class _SlideToUnlockPageState extends State<SlideToUnlockPage> {
  final List<String> days = <String>[
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  final List<String> months = <String>[
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  @override
  Widget build(BuildContext context) {
    final DateTime time = DateTime.now();
    final int hour = time.hour;
    final int minute = time.minute;
    final int day = time.weekday;
    final int month = time.month;
    final int dayInMonth = time.day;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slide To Unlock'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/images/background.jpg',
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 48.0,
            right: 0.0,
            left: 0.0,
            child: Center(
              child: Column(
                children: <Widget>[
                  Text(
                    '${hour < 10 ? '0$hour' : '$hour'}:${minute < 10 ? '0$minute' : '$minute'}',
                    style: const TextStyle(
                      fontSize: 60.0,
                      color: Colors.white,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                  ),
                  Text(
                    '${days[day - 1]}, ${months[month - 1]} $dayInMonth',
                    style: const TextStyle(fontSize: 24.0, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 32.0,
              left: 0.0,
              right: 0.0,
              child: Center(
                child: Opacity(
                  opacity: 0.8,
                  child: Shimmer.fromColors(
                    baseColor: Colors.black12,
                    highlightColor: Colors.white,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/chevron_right.png',
                          height: 20.0,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.0),
                        ),
                        const Text(
                          'Slide to unlock',
                          style: TextStyle(
                            fontSize: 28.0,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
























//void main() {
//  runApp(const MyApp());
//}

//class MyApp extends StatefulWidget {
//  const MyApp({Key? key}) : super(key: key);

//  @override
//  State<MyApp> createState() => _MyAppState();
//}

//class _MyAppState extends State<MyApp> {
//  int activeStep = 0;
//  int activeStep2 = 0;
//  int reachedStep = 0;
//  int upperBound = 5;
//  double progress = 0.2;
//  Set<int> reachedSteps = <int>{0, 2, 4, 5};
//  final dashImages = [
//    'assets/1.png',
//    'assets/2.png',
//    'assets/3.png',
//    'assets/4.png',
//    'assets/5.png',
//  ];

//  void increaseProgress() {
//    if (progress < 1) {
//      setState(() => progress += 0.2);
//    } else {
//      setState(() => progress = 0);
//    }
//  }

//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Example',
//      debugShowCheckedModeBanner: false,
//      theme: ThemeData(
//        scaffoldBackgroundColor: Colors.white,
//        primarySwatch: Colors.purple,
//        colorScheme: ColorScheme.fromSwatch(
//          primarySwatch: Colors.purple,
//          accentColor: Colors.deepOrange,
//          backgroundColor: Colors.white,
//        ),
//      ),
//      home: Scaffold(
//        body: SafeArea(
//          child: SingleChildScrollView(
//            child: Column(
//              children: [
//                SizedBox(
//                  height: 200,
//                  width: double.infinity,
//                  child: Column(
//                    children: [
//                      Image.asset(
//                        dashImages[activeStep],
//                        height: 150,
//                      ),
//                      const SizedBox(height: 5),
//                      Text('Dash ${activeStep + 1}')
//                    ],
//                  ),
//                ),
//                Table(
//                    border: TableBorder
//                        .all(), // Allows to add a border decoration around your table
//                    children: [
//                      TableRow(children: [
//                        Text('Year'),
//                        Text('Lang'),
//                        Text('Author'),
//                      ]),
//                      TableRow(children: [
//                        Text(
//                          '2011',
//                        ),
//                        Text('Dart'),
//                        Text('Lars Bak'),
//                      ]),
//                      TableRow(children: [
//                        Text('1996'),
//                        Text('Java'),
//                        Text('James Gosling'),
//                      ]),
//                    ]),

//                ///example with step tapping only on already reached steps
//                SizedBox(
//                  height: 120,
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: [
//                      Expanded(
//                          flex: 1,
//                          child: _previousStep(StepEnabling.sequential)),
//                      Expanded(
//                        flex: 15,
//                        child: EasyStepper(
//                          activeStep: activeStep2,
//                          maxReachedStep: reachedStep,
//                          lineStyle: LineStyle(
//                            lineLength: 100,
//                            lineSpace: 4,
//                            lineType: LineType.normal,
//                            unreachedLineColor: Colors.grey.withOpacity(0.5),
//                            finishedLineColor: Colors.deepOrange,
//                            activeLineColor: Colors.grey.withOpacity(0.5),
//                          ),
//                          activeStepBorderColor: Colors.purple,
//                          activeStepIconColor: Colors.purple,
//                          activeStepTextColor: Colors.purple,
//                          activeStepBackgroundColor: Colors.white,
//                          unreachedStepBackgroundColor:
//                              Colors.grey.withOpacity(0.5),
//                          unreachedStepBorderColor:
//                              Colors.grey.withOpacity(0.5),
//                          unreachedStepIconColor: Colors.grey,
//                          unreachedStepTextColor: Colors.grey.withOpacity(0.5),
//                          finishedStepBackgroundColor: Colors.deepOrange,
//                          finishedStepBorderColor: Colors.grey.withOpacity(0.5),
//                          finishedStepIconColor: Colors.grey,
//                          finishedStepTextColor: Colors.deepOrange,
//                          borderThickness: 10,
//                          internalPadding: 15,
//                          showLoadingAnimation: false,
//                          steps: [
//                            EasyStep(
//                              icon: const Icon(CupertinoIcons.cart),
//                              title: 'Cart',
//                              lineText: 'Add Address Info',
//                              enabled:
//                                  _allowTabStepping(0, StepEnabling.sequential),
//                            ),
//                            EasyStep(
//                              icon: const Icon(CupertinoIcons.info),
//                              title: 'Address',
//                              lineText: 'Go To Checkout',
//                              enabled:
//                                  _allowTabStepping(1, StepEnabling.sequential),
//                            ),
//                            EasyStep(
//                              icon: const Icon(
//                                  CupertinoIcons.cart_fill_badge_plus),
//                              title: 'Checkout',
//                              lineText: 'Choose Payment Method',
//                              enabled:
//                                  _allowTabStepping(2, StepEnabling.sequential),
//                            ),
//                            EasyStep(
//                              icon: const Icon(CupertinoIcons.money_dollar),
//                              title: 'Payment',
//                              lineText: 'Confirm Order Items',
//                              enabled:
//                                  _allowTabStepping(3, StepEnabling.sequential),
//                            ),
//                            EasyStep(
//                              icon: const Icon(Icons.file_present_rounded),
//                              title: 'Order Details',
//                              lineText: 'Submit Order',
//                              enabled:
//                                  _allowTabStepping(4, StepEnabling.sequential),
//                            ),
//                            EasyStep(
//                              icon: const Icon(Icons.check_circle_outline),
//                              title: 'Finish',
//                              enabled:
//                                  _allowTabStepping(5, StepEnabling.sequential),
//                            ),
//                          ],
//                          onStepReached: (index) => setState(() {
//                            activeStep2 = index;
//                          }),
//                        ),
//                      ),
//                      Expanded(
//                          flex: 1, child: _nextStep(StepEnabling.sequential)),
//                    ],
//                  ),
//                ),
//                const SizedBox(height: 20),
//                Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: [
//                    Expanded(
//                        flex: 1, child: _previousStep(StepEnabling.individual)),
//                    Expanded(
//                      flex: 15,
//                      child: EasyStepper(
//                        activeStep: activeStep2,
//                        reachedSteps: reachedSteps,
//                        lineStyle: LineStyle(
//                          lineLength: 100,
//                          lineSpace: 4,
//                          lineType: LineType.dotted,
//                          finishedLineColor: Colors.pink.withOpacity(0.5),
//                          unreachedLineColor: Colors.blueGrey.withOpacity(0.5),
//                          activeLineColor: Colors.blueGrey.withOpacity(0.5),
//                        ),
//                        activeStepBorderColor: Colors.blue,
//                        activeStepIconColor: Colors.blue,
//                        activeStepTextColor: Colors.blue,
//                        activeStepBackgroundColor: Colors.white,
//                        unreachedStepBackgroundColor:
//                            Colors.blueGrey.withOpacity(0.5),
//                        unreachedStepBorderColor:
//                            Colors.blueGrey.withOpacity(0.5),
//                        unreachedStepIconColor: Colors.blueGrey,
//                        unreachedStepTextColor:
//                            Colors.blueGrey.withOpacity(0.5),
//                        finishedStepBackgroundColor:
//                            Colors.pink.withOpacity(0.5),
//                        finishedStepBorderColor:
//                            Colors.blueGrey.withOpacity(0.5),
//                        finishedStepIconColor: Colors.blueGrey,
//                        finishedStepTextColor: Colors.pink.withOpacity(0.5),
//                        borderThickness: 2,
//                        internalPadding: 15,
//                        showStepBorder: true,
//                        showLoadingAnimation: false,
//                        stepRadius: 20,
//                        // stepShape: baseStep.StepShape.rRectangle,
//                        showTitle: true,
//                        steps: [
//                          EasyStep(
//                            icon: const Icon(CupertinoIcons.info),
//                            title: 'Address',
//                            lineText: 'Go To Checkout',
//                            enabled:
//                                _allowTabStepping(1, StepEnabling.individual),
//                          ),
//                          EasyStep(
//                            icon:
//                                const Icon(CupertinoIcons.cart_fill_badge_plus),
//                            title: 'Checkout',
//                            lineText: 'Choose Payment Method',
//                            enabled:
//                                _allowTabStepping(2, StepEnabling.individual),
//                          ),
//                          EasyStep(
//                            icon: const Icon(CupertinoIcons.money_dollar),
//                            title: 'Payment',
//                            lineText: 'Confirm Order Items',
//                            enabled:
//                                _allowTabStepping(3, StepEnabling.individual),
//                          ),
//                          EasyStep(
//                            icon: const Icon(Icons.file_present_rounded),
//                            title: 'Order Details',
//                            lineText: 'Submit Order',
//                            enabled:
//                                _allowTabStepping(4, StepEnabling.individual),
//                          ),
//                          EasyStep(
//                            icon: const Icon(Icons.check_circle_outline),
//                            title: 'Finish',
//                            enabled:
//                                _allowTabStepping(5, StepEnabling.individual),
//                          ),
//                        ],
//                        onStepReached: (index) => setState(() {
//                          activeStep2 = index;
//                        }),
//                      ),
//                    ),
//                    Expanded(
//                        flex: 1, child: _nextStep(StepEnabling.individual)),
//                  ],
//                ),
//                const SizedBox(height: 20),
//                Container(
//                  padding: const EdgeInsets.symmetric(vertical: 40),
//                  color: Colors.grey.shade200,
//                  clipBehavior: Clip.none,
//                  child: EasyStepper(
//                    activeStep: activeStep,
//                    lineStyle: const LineStyle(
//                      lineLength: 70,
//                      lineSpace: 0,
//                      lineType: LineType.normal,
//                      defaultLineColor: Colors.white,
//                      finishedLineColor: Colors.orange,
//                      lineThickness: 1.5,
//                    ),
//                    activeStepTextColor: Colors.black87,
//                    finishedStepTextColor: Colors.black87,
//                    internalPadding: 0,
//                    showLoadingAnimation: false,
//                    stepRadius: 8,
//                    showStepBorder: false,
//                    steps: [
//                      EasyStep(
//                        customStep: CircleAvatar(
//                          radius: 8,
//                          backgroundColor: Colors.white,
//                          child: CircleAvatar(
//                            radius: 7,
//                            backgroundColor:
//                                activeStep >= 0 ? Colors.orange : Colors.white,
//                          ),
//                        ),
//                        title: 'Waiting',
//                      ),
//                      EasyStep(
//                        customStep: CircleAvatar(
//                          radius: 8,
//                          backgroundColor: Colors.white,
//                          child: CircleAvatar(
//                            radius: 7,
//                            backgroundColor:
//                                activeStep >= 1 ? Colors.orange : Colors.white,
//                          ),
//                        ),
//                        title: 'Order Received',
//                        topTitle: true,
//                      ),
//                      EasyStep(
//                        customStep: CircleAvatar(
//                          radius: 8,
//                          backgroundColor: Colors.white,
//                          child: CircleAvatar(
//                            radius: 7,
//                            backgroundColor:
//                                activeStep >= 2 ? Colors.orange : Colors.white,
//                          ),
//                        ),
//                        title: 'Preparing',
//                      ),
//                      EasyStep(
//                        customStep: CircleAvatar(
//                          radius: 8,
//                          backgroundColor: Colors.white,
//                          child: CircleAvatar(
//                            radius: 7,
//                            backgroundColor:
//                                activeStep >= 3 ? Colors.orange : Colors.white,
//                          ),
//                        ),
//                        title: 'On Way',
//                        topTitle: true,
//                      ),
//                      EasyStep(
//                        customStep: CircleAvatar(
//                          radius: 8,
//                          backgroundColor: Colors.white,
//                          child: CircleAvatar(
//                            radius: 7,
//                            backgroundColor:
//                                activeStep >= 4 ? Colors.orange : Colors.white,
//                          ),
//                        ),
//                        title: 'Delivered',
//                      ),
//                    ],
//                    onStepReached: (index) =>
//                        setState(() => activeStep = index),
//                  ),
//                ),
//                const SizedBox(height: 50),
//                EasyStepper(
//                  activeStep: activeStep,
//                  lineStyle: const LineStyle(
//                    lineLength: 80,
//                    lineThickness: 1,
//                    lineSpace: 5,
//                  ),
//                  stepRadius: 20,
//                  unreachedStepIconColor: Colors.black87,
//                  unreachedStepBorderColor: Colors.black54,
//                  unreachedStepTextColor: Colors.black,
//                  showLoadingAnimation: false,
//                  steps: const [
//                    EasyStep(
//                      icon: Icon(Icons.my_location),
//                      title: 'You',
//                      lineText: '1.7 KM',
//                    ),
//                    EasyStep(
//                      icon: Icon(CupertinoIcons.cube_box),
//                      title: 'Pick Up',
//                      lineText: '3 KM',
//                    ),
//                    EasyStep(
//                      icon: Icon(CupertinoIcons.flag),
//                      title: 'Drop Off',
//                    ),
//                  ],
//                  onStepReached: (index) => setState(() => activeStep = index),
//                ),
//                const SizedBox(height: 40),
//                SizedBox(
//                  height: 450,
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceAround,
//                    children: [
//                      EasyStepper(
//                        lineStyle: const LineStyle(
//                          lineType: LineType.normal,
//                          unreachedLineType: LineType.dotted,
//                        ),
//                        activeStep: activeStep,
//                        direction: Axis.vertical,
//                        unreachedStepIconColor: Colors.white,
//                        unreachedStepBorderColor: Colors.black54,
//                        finishedStepBackgroundColor: Colors.deepPurple,
//                        unreachedStepBackgroundColor: Colors.deepOrange,
//                        showTitle: false,
//                        onStepReached: (index) =>
//                            setState(() => activeStep = index),
//                        steps: const [
//                          EasyStep(
//                            icon: Icon(CupertinoIcons.cart),
//                            title: 'Cart',
//                            activeIcon: Icon(CupertinoIcons.cart),
//                            lineText: 'Cart Line',
//                          ),
//                          EasyStep(
//                            icon: Icon(Icons.file_present),
//                            activeIcon: Icon(Icons.file_present),
//                            title: 'Address',
//                          ),
//                          EasyStep(
//                            icon: Icon(Icons.filter_center_focus_sharp),
//                            activeIcon: Icon(Icons.filter_center_focus_sharp),
//                            title: 'Checkout',
//                          ),
//                          EasyStep(
//                            icon: Icon(Icons.money),
//                            activeIcon: Icon(Icons.money),
//                            title: 'Payment',
//                          ),
//                          EasyStep(
//                            icon: Icon(Icons.local_shipping_outlined),
//                            activeIcon: Icon(Icons.local_shipping_outlined),
//                            title: 'Shipping',
//                          ),
//                          EasyStep(
//                            icon: Icon(Icons.file_copy_outlined),
//                            activeIcon: Icon(Icons.file_copy_outlined),
//                            title: 'Order Details',
//                          ),
//                          EasyStep(
//                            icon: Icon(Icons.check_circle_outline),
//                            activeIcon: Icon(Icons.check_circle_outline),
//                            title: 'Finish',
//                          ),
//                        ],
//                      ),
//                      EasyStepper(
//                        lineStyle: const LineStyle(
//                          lineType: LineType.normal,
//                        ),
//                        activeStep: activeStep,
//                        direction: Axis.vertical,
//                        unreachedStepIconColor: Colors.white,
//                        unreachedStepBorderColor: Colors.black54,
//                        finishedStepBackgroundColor: Colors.deepPurple,
//                        unreachedStepBackgroundColor: Colors.deepOrange,
//                        showTitle: false,
//                        onStepReached: (index) =>
//                            setState(() => activeStep = index),
//                        steps: const [
//                          EasyStep(
//                            icon: Icon(CupertinoIcons.cart),
//                            title: 'Cart',
//                            activeIcon: Icon(CupertinoIcons.cart),
//                            lineText: 'Cart Line',
//                          ),
//                          EasyStep(
//                            icon: Icon(Icons.file_present),
//                            activeIcon: Icon(Icons.file_present),
//                            title: 'Address',
//                          ),
//                          EasyStep(
//                            icon: Icon(Icons.filter_center_focus_sharp),
//                            activeIcon: Icon(Icons.filter_center_focus_sharp),
//                            title: 'Checkout',
//                          ),
//                          EasyStep(
//                            icon: Icon(Icons.money),
//                            activeIcon: Icon(Icons.money),
//                            title: 'Payment',
//                          ),
//                          EasyStep(
//                            icon: Icon(Icons.local_shipping_outlined),
//                            activeIcon: Icon(Icons.local_shipping_outlined),
//                            title: 'Shipping',
//                          ),
//                          EasyStep(
//                            icon: Icon(Icons.file_copy_outlined),
//                            activeIcon: Icon(Icons.file_copy_outlined),
//                            title: 'Order Details',
//                          ),
//                          EasyStep(
//                            icon: Icon(Icons.check_circle_outline),
//                            activeIcon: Icon(Icons.check_circle_outline),
//                            title: 'Finish',
//                          ),
//                        ],
//                      ),
//                      EasyStepper(
//                        lineStyle: const LineStyle(
//                          lineType: LineType.normal,
//                        ),
//                        activeStep: activeStep,
//                        direction: Axis.vertical,
//                        unreachedStepIconColor: Colors.white,
//                        unreachedStepBorderColor: Colors.black54,
//                        finishedStepBackgroundColor: Colors.deepPurple,
//                        unreachedStepBackgroundColor: Colors.deepOrange,
//                        showTitle: false,
//                        onStepReached: (index) =>
//                            setState(() => activeStep = index),
//                        steps: const [
//                          EasyStep(
//                            icon: Icon(CupertinoIcons.cart),
//                            title: 'Cart',
//                            activeIcon: Icon(CupertinoIcons.cart),
//                            lineText: 'Cart Line',
//                          ),
//                          EasyStep(
//                            icon: Icon(Icons.file_present),
//                            activeIcon: Icon(Icons.file_present),
//                            title: 'Address',
//                          ),
//                          EasyStep(
//                            icon: Icon(Icons.filter_center_focus_sharp),
//                            activeIcon: Icon(Icons.filter_center_focus_sharp),
//                            title: 'Checkout',
//                          ),
//                          EasyStep(
//                            icon: Icon(Icons.money),
//                            activeIcon: Icon(Icons.money),
//                            title: 'Payment',
//                          ),
//                          EasyStep(
//                            icon: Icon(Icons.local_shipping_outlined),
//                            activeIcon: Icon(Icons.local_shipping_outlined),
//                            title: 'Shipping',
//                          ),
//                          EasyStep(
//                            icon: Icon(Icons.file_copy_outlined),
//                            activeIcon: Icon(Icons.file_copy_outlined),
//                            title: 'Order Details',
//                          ),
//                          EasyStep(
//                            icon: Icon(Icons.check_circle_outline),
//                            activeIcon: Icon(Icons.check_circle_outline),
//                            title: 'Finish',
//                          ),
//                        ],
//                      ),
//                    ],
//                  ),
//                ),
//              ],
//            ),
//          ),
//        ),
//        floatingActionButton: FloatingActionButton(onPressed: increaseProgress),
//      ),
//    );
//  }

//  bool _allowTabStepping(int index, StepEnabling enabling) {
//    return enabling == StepEnabling.sequential
//        ? index <= reachedStep
//        : reachedSteps.contains(index);
//  }

//  /// Returns the next button.
//  Widget _nextStep(StepEnabling enabling) {
//    return IconButton(
//      onPressed: () {
//        if (activeStep2 < upperBound) {
//          setState(() {
//            if (enabling == StepEnabling.sequential) {
//              ++activeStep2;
//              if (reachedStep < activeStep2) {
//                reachedStep = activeStep2;
//              }
//            } else {
//              activeStep2 =
//                  reachedSteps.firstWhere((element) => element > activeStep2);
//            }
//          });
//        }
//      },
//      icon: const Icon(Icons.arrow_forward_ios),
//    );
//  }

//  /// Returns the previous button.
//  Widget _previousStep(StepEnabling enabling) {
//    return IconButton(
//      onPressed: () {
//        if (activeStep2 > 0) {
//          setState(() => enabling == StepEnabling.sequential
//              ? --activeStep2
//              : activeStep2 =
//                  reachedSteps.lastWhere((element) => element < activeStep2));
//        }
//      },
//      icon: const Icon(Icons.arrow_back_ios),
//    );
//  }
//}

//enum StepEnabling { sequential, individual }












//class MyHomePage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Flutter UI Design'),
//      ),
//      body: ListView(scrollDirection: Axis.vertical, children: [
//        Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: [
//            // Card
//            Card(
//              margin: EdgeInsets.all(16.0),
//              child: Padding(
//                padding: EdgeInsets.all(16.0),
//                child: Text(
//                  'This is a Card',
//                  style: TextStyle(fontSize: 18.0),
//                ),
//              ),
//            ),

//            Container(
//              height: 200,
//              width: 300,
//              child: ListView(
//                scrollDirection: Axis.horizontal,
//                children: [
//                  Container(
//                    height: 20,
//                    width: 20,
//                    color: Colors.red,
//                  ),
//                  Container(
//                    height: 20,
//                    width: 20,
//                    color: Colors.red,
//                  ),
//                  Container(
//                    height: 20,
//                    width: 80,
//                    color: Colors.red,
//                  ),
//                  Container(
//                    height: 20,
//                    width: 80,
//                    color: Colors.red,
//                  ),
//                  Container(
//                    height: 20,
//                    width: 80,
//                    color: Colors.green,
//                  ),
//                  Container(
//                    height: 20,
//                    width: 80,
//                    color: Colors.red,
//                  ),
//                ],
//              ),
//            ),

//            Container(
//              height: 150.0,
//              child: ListView.builder(
//                scrollDirection: Axis.horizontal,
//                itemCount: 5,
//                itemBuilder: (context, index) {
//                  return Container(
//                    width: 150.0,
//                    margin: EdgeInsets.all(8.0),
//                    color: Colors.blue,
//                    child: Center(
//                      child: Text(
//                        'Item $index',
//                        style: TextStyle(color: Colors.white),
//                      ),
//                    ),
//                  );
//                },
//              ),
//            ),

//            // Multiple Columns
//            Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: [
//                Text(
//                  'Column 1',
//                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
//                ),
//                Row(
//                  children: [
//                    Text('Item 1'),
//                    Spacer(),
//                    Icon(Icons.star),
//                  ],
//                ),
//                Row(
//                  children: [
//                    Text('Item 2'),
//                    Spacer(),
//                    Icon(Icons.star),
//                  ],
//                ),
//              ],
//            ),

//            Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: [
//                Text(
//                  'Column 2',
//                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
//                ),
//                Row(
//                  children: [
//                    Text('Item 3'),
//                    Spacer(),
//                    Icon(Icons.star),
//                  ],
//                ),
//                Row(
//                  children: [
//                    Text('Item 4'),
//                    Spacer(),
//                    Icon(Icons.star),
//                  ],
//                ),
//              ],
//            ),
//            Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: [
//                Text(
//                  'Column 2',
//                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
//                ),
//                Row(
//                  children: [
//                    Text('Item 3'),
//                    Spacer(),
//                    Icon(Icons.star),
//                  ],
//                ),
//                Row(
//                  children: [
//                    Text('Item 4'),
//                    Spacer(),
//                    Icon(Icons.star),
//                  ],
//                ),
//              ],
//            ),
//            Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: [
//                Text(
//                  'Column 2',
//                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
//                ),
//                Row(
//                  children: [
//                    Text('Item 3'),
//                    Spacer(),
//                    Icon(Icons.star),
//                  ],
//                ),
//                Row(
//                  children: [
//                    Text('Item 4'),
//                    Spacer(),
//                    Icon(Icons.star),
//                  ],
//                ),
//              ],
//            ),
//            Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: [
//                Text(
//                  'Column 2',
//                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
//                ),
//                Row(
//                  children: [
//                    Text('Item 3'),
//                    Spacer(),
//                    Icon(Icons.star),
//                  ],
//                ),
//                Row(
//                  children: [
//                    Text('Item 4'),
//                    Spacer(),
//                    Icon(Icons.star),
//                  ],
//                ),
//              ],
//            ),
//            Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: [
//                Text(
//                  'Column 2',
//                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
//                ),
//                Row(
//                  children: [
//                    Text('Item 3'),
//                    Spacer(),
//                    Icon(Icons.star),
//                  ],
//                ),
//                Row(
//                  children: [
//                    Text('Item 4'),
//                    Spacer(),
//                    Icon(Icons.star),
//                  ],
//                ),
//              ],
//            ),
//            Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: [
//                Text(
//                  'Column 2',
//                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
//                ),
//                Row(
//                  children: [
//                    Text('Item 3'),
//                    Spacer(),
//                    Icon(Icons.star),
//                  ],
//                ),
//                Row(
//                  children: [
//                    Text('Item 4'),
//                    Spacer(),
//                    Icon(Icons.star),
//                  ],
//                ),
//              ],
//            ),
//          ],
//        ),
//      ]),
//    );
//  }
//}
