import 'package:brain_pulse/features/more/ui/screen/my_profile.dart';
import 'package:flutter/material.dart';

class More extends StatelessWidget {
  const More({super.key});
  static const String routeName = 'More';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body:
       Padding(
         padding: EdgeInsets.only(top: 150 ,right: 15 , left: 15 ),
         child: MyProfile(),
       ),


    );
  }
}
