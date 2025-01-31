import 'package:flutter/material.dart';
import '../../../../core/Widgets/profile_photo_widget.dart';
import '../../../../core/Widgets/profile_text_field.dart';
import '../screen/edit_profile.dart';

class ShowMyProfileWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final String imagePath = 'assets/images/image.jpg';

    return Column(
      children: [
        ProfilePhotoWidget(
            imagePath: imagePath,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditMyProfile(),
                  settings: RouteSettings(arguments: imagePath),
                ),
              );
            }),
        ProfileTextField(readOnly: true,)
      ],
    )
    ;
  }
}
