import 'package:flutter/material.dart';
import '../../../../core/Theming/colors.dart';
import '../../../../core/Theming/text_style.dart';
import '../../../auth/register/ui/widgets/pass_and_email_register.dart';
import '../screen/show_my_profile.dart';

class MyProfileWidget extends StatelessWidget {
  String? text1;
  String? text2;
  final String imagePath = 'assets/images/image.jpg';

  MyProfileWidget([this.text1, this.text2]);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ShowMyProfile(),
                settings: RouteSettings(arguments: imagePath),
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "my profile",
                style: TextStyleApp.font32wieght700ColorBlue,
              ),
              CircleAvatar(
                radius: 60,
                backgroundColor: ColorsApp.grey500,
                backgroundImage:
                    imagePath != null ? AssetImage(imagePath!) : null,
                child: imagePath == null
                    ? Icon(Icons.person, size: 60, color: ColorsApp.white)
                    : null,
              ),
            ],
          ),
        )
      ],
    );
  }
}
