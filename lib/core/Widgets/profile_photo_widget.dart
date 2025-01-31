import 'package:flutter/material.dart';
import '../Theming/colors.dart';

class ProfilePhotoWidget extends StatelessWidget {
  final String? imagePath;
  final VoidCallback? onTap;

  ProfilePhotoWidget({
    this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        InkWell(
          onTap: onTap,
          child: CircleAvatar(
            radius: 60,
            backgroundColor: ColorsApp.grey500,
            backgroundImage: imagePath != null ? AssetImage(imagePath!) : null,
            child: imagePath == null ? Icon(Icons.person, size: 60, color: ColorsApp.white) : null,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: CircleAvatar(
            backgroundColor: ColorsApp.grey300,
            radius: 20,
            child: Icon(Icons.camera_alt, color: ColorsApp.blue),
          ),
        ),
      ],
    );
  }
}
