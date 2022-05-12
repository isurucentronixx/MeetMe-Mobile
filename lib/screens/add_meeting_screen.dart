import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meet_me_app/screens/icon_and_text_button_custom.dart';
import 'package:meet_me_app/widgets/buttons.dart';

class AddMeScreen extends StatefulWidget {
  const AddMeScreen({Key? key}) : super(key: key);

  @override
  _AddMeScreenState createState() => _AddMeScreenState();
}

class _AddMeScreenState extends State<AddMeScreen> {
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
          title: const Text(''),
          content: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            padding: EdgeInsets.only(
                left: 8.0.w, right: 8.0.w, top: 12.0.h, bottom: 8.0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  'MeetMe',
                  style: TextStyle(fontSize: 20.sp),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextField(
                  controller: name,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Add title to Your MeetMe',
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Description',
                  style: TextStyle(fontSize: 20.sp),
                ),
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
                      Text(
                        'Add Participants',
                        style: TextStyle(fontSize: 17.sp),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add_circle_outline_rounded),
                        iconSize: 45.h,
                        color: Colors.deepOrange,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 25.0.h,
                ),
                MainElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Next',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w100),
                    ))
              ],
            ),
          ),
        ),

        // This is Step2 here we will enter our address
        Step(
            state: _activeCurrentStep <= 1
                ? StepState.editing
                : StepState.complete,
            isActive: _activeCurrentStep >= 1,
            title: const Text(''),
            content: Container(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                padding: EdgeInsets.only(
                    left: 8.0.w, right: 8.0.w, top: 12.0.h, bottom: 8.0.h),
                child: Column(
                  children: [
                    Row(
                      children: [
                        MainDateTimePicker(
                          buttonText: 'MM/DD/YYYY',
                          fontWeight: FontWeight.w600,
                          icons: Icons.date_range_outlined,
                          onSelected: () async {
                            await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(DateTime.now().year - 1),
                              lastDate: DateTime(DateTime.now().year + 1),
                              //borderRadius: 2,
                            );
                          },
                        ),
                        SizedBox(
                          width: 12.0.w,
                        ),
                        MainDateTimePicker(
                          buttonText: '00.00 PM',
                          fontWeight: FontWeight.w600,
                          icons: Icons.date_range_outlined,
                          onSelected: () async {
                            await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),

                              //borderRadius: 2,
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        MainDateTimePicker(
                          buttonText: 'MM/DD/YYYY',
                          fontWeight: FontWeight.w600,
                          icons: Icons.date_range_outlined,
                          onSelected: () async {
                            await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(DateTime.now().year - 1),
                              lastDate: DateTime(DateTime.now().year + 1),
                              //borderRadius: 2,
                            );
                          },
                        ),
                        SizedBox(
                          width: 12.0.w,
                        ),
                        MainDateTimePicker(
                          buttonText: '00.00 PM',
                          fontWeight: FontWeight.w600,
                          icons: Icons.date_range_outlined,
                          onSelected: () async {
                            await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),

                              //borderRadius: 2,
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.0.h,
                    ),
                    MainElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Next',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w100),
                        ))
                  ],
                ),
              ),
            )),

        // This is Step3 here we will display all the details
        // that are entered by the user
        Step(
            state: StepState.complete,
            isActive: _activeCurrentStep >= 2,
            title: const Text(''),
            content: Container(
              padding: EdgeInsets.only(
                  left: 8.0.w, right: 8.0.w, top: 12.0.h, bottom: 8.0.h),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    'Meeting Point',
                    style: TextStyle(fontSize: 20.sp),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                    controller: name,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Search Location',
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  MainElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Create Meet Me',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w100),
                      ))
                ],
              ),
            ))
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        title: const Text(
          'Add a MeetMe',
          style: TextStyle(color: Colors.black),
        ),
      ),
      // Here we have initialized the stepper widget
      body: Stepper(
        controlsBuilder: (context, details) {
          return (Container());
        },
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
