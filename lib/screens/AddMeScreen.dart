import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AddMeScreen extends StatefulWidget {
const AddMeScreen({Key? key}) : super(key: key);

@override
_AddMeScreenState createState() => _AddMeScreenState();
}

class _AddMeScreenState extends State<AddMeScreen> {

// Here we have created list of steps that
// are required to complete the form
int _activeCurrentStep = 0;

TextEditingController name = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController pass = TextEditingController();
TextEditingController address = TextEditingController();
TextEditingController pincode = TextEditingController();

// Here we have created list of steps
// that are required to complete the form
List<Step> stepList() => [
	// This is step1 which is called Account.
	// Here we will fill our personal details
		Step(
		state: _activeCurrentStep <= 0 ? StepState.editing : StepState.complete,
		isActive: _activeCurrentStep >= 0,
		title: const Text(''),
		content: Container(
			child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
			children: [
        const SizedBox(
				height: 8.0,
				),
        Text('MeetMe',style: TextStyle(
          fontSize: 20.sp
        ),),
        const SizedBox(
				height: 8.0,
				),
				TextField(
				controller: name,
				decoration: const InputDecoration(fillColor: Colors.white,
					border: OutlineInputBorder(),
					labelText: 'Add title to Your MeetMe',
				),
				),
				const SizedBox(
				height: 8.0,
				),
        Text('Description',style: TextStyle(
          fontSize: 20.sp
        ),),
        const SizedBox(
				height: 8.0,
				),
				TextField(
				controller: email,
				decoration: const InputDecoration(
					border: OutlineInputBorder(),
					labelText: 'Describe Your MeetMe',
				),
				),
				const SizedBox(
				height: 8,
				),
				Container(

                  child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Add Participants'),
                IconButton(onPressed: (){}, icon: const Icon(Icons.add_circle_outline_rounded),iconSize: 45.h,)
              ],
            ),
                )
			],
			),
		),
		),
		// This is Step2 here we will enter our address
		Step(
			state:
				_activeCurrentStep <= 1 ? StepState.editing : StepState.complete,
			isActive: _activeCurrentStep >= 1,
			title: const Text(''),
			content: Container(
			child: Column(
				children: [
				const SizedBox(
					height: 8,
				),
				Row(
          children: [

          ],
        ),
				const SizedBox(
					height: 8,
				),
				Row(
          children: [

          ],
        )
				],
			),
			)),
	
			// This is Step3 here we will display all the details
			// that are entered by the user
		Step(
			state: StepState.complete,
			isActive: _activeCurrentStep >= 2,
			title: const Text(''),
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
			)))
	];

@override
Widget build(BuildContext context) {
	return Scaffold(
    backgroundColor: Colors.grey[200],
	appBar: AppBar(
		centerTitle: true,
		backgroundColor: Colors.white,
		title: const Text('Add a MeetMe',style: TextStyle(color: Colors.black), ),
	),
	// Here we have initialized the stepper widget
	body: Stepper(
		type: StepperType.horizontal,
		currentStep: _activeCurrentStep,
		steps: stepList(),
		
		// onStepContinue takes us to the next step
		onStepContinue: () {
		if (_activeCurrentStep < (stepList().length - 1)) {
			setState(() {
			_activeCurrentStep += 1;
			});
		}
		},
		
		// onStepCancel takes us to the previous step
		onStepCancel: () {
		if (_activeCurrentStep == 0) {
			return;
		}

		setState(() {
			_activeCurrentStep -= 1;
		});
		},
		
		// onStepTap allows to directly click on the particular step we want
		onStepTapped: (int index) {
		setState(() {
			_activeCurrentStep = index;
		});
		},
		
	),
	);
}
}