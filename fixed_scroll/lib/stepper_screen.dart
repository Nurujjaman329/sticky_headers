import 'package:flutter/material.dart';

//class MyHomePage extends StatefulWidget {
//const MyHomePage({Key? key}) : super(key: key);

//@override
//_MyHomePageState createState() => _MyHomePageState();
//}

//class _MyHomePageState extends State<MyHomePage> {

//// we have initialized active step to 0 so that
//// our stepper widget will start from first step
//int _activeCurrentStep = 0;

//TextEditingController name = TextEditingController();
//TextEditingController email = TextEditingController();
//TextEditingController pass = TextEditingController();
//TextEditingController address = TextEditingController();
//TextEditingController pincode = TextEditingController();

//// Here we have created list of steps
//// that are required to complete the form
//List<Step> stepList() => [
//	// This is step1 which is called Account.
//	// Here we will fill our personal details
//		Step(
//		state: _activeCurrentStep <= 0 ? StepState.editing : StepState.complete,
//		isActive: _activeCurrentStep >= 0,
//		title: const Text('Account'),
//		content: Container(
//			child: Column(
//			children: [
//				TextField(
//				controller: name,
//				decoration: const InputDecoration(
//					border: OutlineInputBorder(),
//					labelText: 'Full Name',
//				),
//				),
//				const SizedBox(
//				height: 8,
//				),
//				TextField(
//				controller: email,
//				decoration: const InputDecoration(
//					border: OutlineInputBorder(),
//					labelText: 'Email',
//				),
//				),
//				const SizedBox(
//				height: 8,
//				),
//				TextField(
//				controller: pass,
//				obscureText: true,
//				decoration: const InputDecoration(
//					border: OutlineInputBorder(),
//					labelText: 'Password',
//				),
//				),
//			],
//			),
//		),
//		),
//		// This is Step2 here we will enter our address
//		Step(
//			state:
//				_activeCurrentStep <= 1 ? StepState.editing : StepState.complete,
//			isActive: _activeCurrentStep >= 1,
//			title: const Text('Address'),
//			content: Container(
//			child: Column(
//				children: [
//				const SizedBox(
//					height: 8,
//				),
//				TextField(
//					controller: address,
//					decoration: const InputDecoration(
//					border: OutlineInputBorder(),
//					labelText: 'Full House Address',
//					),
//				),
//				const SizedBox(
//					height: 8,
//				),
//				TextField(
//					controller: pincode,
//					decoration: const InputDecoration(
//					border: OutlineInputBorder(),
//					labelText: 'Pin Code',
//					),
//				),
//				],
//			),
//			)),

//			// This is Step3 here we will display all the details
//			// that are entered by the user
//		Step(
//			state: StepState.complete,
//			isActive: _activeCurrentStep >= 2,
//			title: const Text('Confirm'),
//			content: Container(
//				child: Column(
//			crossAxisAlignment: CrossAxisAlignment.stretch,
//			mainAxisAlignment: MainAxisAlignment.start,
//			children: [
//				Text('Name: ${name.text}'),
//				Text('Email: ${email.text}'),
//				Text('Password: ${pass.text}'),
//				Text('Address : ${address.text}'),
//				Text('PinCode : ${pincode.text}'),
//			],
//			)))
//	];

//@override
//Widget build(BuildContext context) {
//	return Scaffold(
//	appBar: AppBar(
//		centerTitle: true,
//		backgroundColor: Colors.green,
//		title: const Text('GeeksforGeeks',style: TextStyle(color: Colors.white), ),
//	),
//	// Here we have initialized the stepper widget
//	body: Stepper(
//		type: StepperType.horizontal,
//		currentStep: _activeCurrentStep,
//		steps: stepList(),

//		// onStepContinue takes us to the next step
//		onStepContinue: () {
//		if (_activeCurrentStep < (stepList().length - 1)) {
//			setState(() {
//			_activeCurrentStep += 1;
//			});
//		}
//		},

//		// onStepCancel takes us to the previous step
//		onStepCancel: () {
//		if (_activeCurrentStep == 0) {
//			return;
//		}

//		setState(() {
//			_activeCurrentStep -= 1;
//		});
//		},

//		// onStepTap allows to directly click on the particular step we want
//		onStepTapped: (int index) {
//		setState(() {
//			_activeCurrentStep = index;
//		});
//		},

//	),
//	);
//}
//}

//class MyApp extends StatelessWidget {
//const MyApp({Key? key}) : super(key: key);

//// This widget is the root of your application.
//@override
//Widget build(BuildContext context) {
//	return MaterialApp(
//	title: 'Flutter Demo',
//	theme: ThemeData(
//		primarySwatch: Colors.blue,
//	),
//	home: const MyHomePage(),
//	);
//}
//}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _activeCurrentStep = 0;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pincode = TextEditingController();

  List<Step> stepList() => [
        Step(
          state:
              _activeCurrentStep <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeCurrentStep >= 0,
          title: const Text('Account'),
          content: Container(
            child: Column(
              children: [
                TextField(
                  controller: name,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Full Name',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: email,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: pass,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ],
            ),
          ),
        ),
        Step(
            state: _activeCurrentStep <= 1
                ? StepState.editing
                : StepState.complete,
            isActive: _activeCurrentStep >= 1,
            title: const Text('Address'),
            content: Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: address,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Full House Address',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: pincode,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Pin Code',
                    ),
                  ),
                ],
              ),
            )),
        Step(
          state: StepState.complete,
          isActive: _activeCurrentStep >= 2,
          title: const Text('Confirm'),
          content: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Name: ${name.text}'),
                Text('Email: ${email.text}'),
                Text('Password: ${pass.text}'),
                Text('Address : ${address.text}'),
                Text('PinCode : ${pincode.text}'),
              ],
            ),
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Stepper'),
      ),
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: _activeCurrentStep,
        steps: stepList(),
        onStepContinue: () {
          if (_activeCurrentStep < (stepList().length - 1)) {
            setState(() {
              _activeCurrentStep += 1;
            });
          }
        },
        onStepCancel: () {
          if (_activeCurrentStep == 0) {
            return;
          }

          setState(() {
            _activeCurrentStep -= 1;
          });
        },
        onStepTapped: (int index) {
          setState(() {
            _activeCurrentStep = index;
          });
        },
      ),
    );
  }
}
