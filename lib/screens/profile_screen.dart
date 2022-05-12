import 'package:flutter/material.dart';
import 'package:meet_me_app/screens/PersonalInformationScreen.dart';
import 'package:meet_me_app/screens/SettingScreen.dart';
import 'package:meet_me_app/themes/font_size.dart';
import 'package:meet_me_app/widgets/abstract_home_widget.dart';
import 'package:meet_me_app/widgets/buttons.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meet_me_app/widgets/safe_padded_loading_overlay.dart';
import 'package:sizer/sizer.dart';

import '../gen/assets.gen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbstractHomeView(
        selectedView: SelectedView.profile,
        child: SafePaddedLoadingOverlay(
          isLoading: false,
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                const SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                    child: Center(
                      child: CircleAvatar(
                        backgroundColor: Color(0xffE6E6E6),
                        radius: 60,
                        child: Icon(
                          Icons.person,
                          color: Color(0xffCCCCCC),
                        ),
                      ),
                    ),
                  ),
                ),
                const Center(
                  child: Text(
                    'User',
                    style: TextStyle(
                        fontSize: FontSize.pt18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MainElevatedButtonIcon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const PersonalInformationScreen()));
                  },
                  icon: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  label: Container(
                    height: 75,
                    child: Row(
                      children: [
                        Text(
                          'Personal Information',
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        Icon(
                          Icons.arrow_forward_outlined,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                MainElevatedButtonIcon(
                  onPressed: () => {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SettingScreen())),
                  },
                  icon: Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                  label: Container(
                    height: 75,
                    child: Row(
                      children: [
                        Text(
                          'Settigns ',
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          width: 170,
                        ),
                        Icon(
                          Icons.arrow_forward_outlined,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                MainElevatedButtonIcon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                  label: Container(
                    height: 75,
                    child: Row(
                      children: [
                        Text(
                          'Confidentiality',
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          width: 135,
                        ),
                        Icon(
                          Icons.arrow_forward_outlined,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 20,
                  ),
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.exit_to_app),
                    label: Text(
                      'Log out',
                      style: TextStyle(color: Color(0xffff7466)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
