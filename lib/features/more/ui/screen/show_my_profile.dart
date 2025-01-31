import 'package:flutter/material.dart';
import '../../../../core/Theming/colors.dart';
import '../widget/show_my_profile_widget.dart';

class ShowMyProfile extends StatelessWidget {
  const ShowMyProfile({super.key});

  static const String routeName = 'ShowMyProfile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('my Profile'),
          backgroundColor: ColorsApp.white,
          leading: IconButton(
            color: ColorsApp.grey,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          )),
      backgroundColor: ColorsApp.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 100, right: 15, left: 15),
        child: Column(
          children: [

            ShowMyProfileWidget()
          ],
        ),
      ),
    );
  }
}
