import 'package:brain_pulse/core/Theming/colors.dart';
import 'package:brain_pulse/core/Widgets/mybutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/Widgets/profile_photo_widget.dart';
import '../../../../core/helpers/spacing.dart';
import '../widget/edit_my_profile_widget.dart';

class EditMyProfile extends StatelessWidget {
  const EditMyProfile({super.key});
  static const String routeName = 'EditProfile';

  @override
  Widget build(BuildContext context) {
    final String? imagePath = ModalRoute.of(context)?.settings.arguments as String?;

    return
    Scaffold(
        appBar: AppBar(title: Text('Edit Profile'),
          backgroundColor: ColorsApp.white,
          leading: IconButton(color: ColorsApp.grey,
          onPressed: () { Navigator.pop(context); },
      icon:const Icon (Icons.arrow_back),)),
        backgroundColor: ColorsApp.white,
        body:
        Padding(
          padding: const EdgeInsets.only(top: 100 ,right: 15 , left: 15 ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ProfilePhotoWidget(imagePath: imagePath,),
                EditMyProfileWidget(),
                verticalSpace(190.h),
                MyButton(text: 'Save Changes', onPressed: (){})
              ],
            ),
          ),
        ),
    );
  }
}
