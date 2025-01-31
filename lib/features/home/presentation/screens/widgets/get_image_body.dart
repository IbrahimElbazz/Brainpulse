import 'dart:io';

import 'package:brain_pulse/core/Theming/colors.dart';
import 'package:brain_pulse/features/home/presentation/screens/widgets/custom_bottton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class GetImageBody extends StatefulWidget {
  const GetImageBody({super.key});

  @override
  State<GetImageBody> createState() => _GetImageBodyState();
}

class _GetImageBodyState extends State<GetImageBody> {
  File? _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 80.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomBottton(
                  ontap: uploadcamera,
                  text: "Camera",
                  width: 140.w,
                  height: 50.h,
                ),
                CustomBottton(
                  ontap: uploadgallery,
                  text: "Gallery",
                  width: 140.w,
                  height: 50.h,
                ),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
              child: Container(
                width: double.infinity,
                height: 500.h,
                decoration: BoxDecoration(
                  color: ColorsApp.grey,
                  borderRadius: BorderRadius.circular(15.r),
                  image: DecorationImage(
                    image: _image != null
                        ? FileImage(_image!)
                        : const AssetImage(
                            "assets/images/products_noimageyet.jpg",
                          ),
                    fit: BoxFit.cover,
                  ),
                ),
              )),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 40.w),
            child: CustomBottton(
                text: "Send Report", width: double.infinity, height: 60.h),
          )
        ],
      ),
    );
  }

  void uploadcamera() async {
    final ImagePicker picker = ImagePicker();
    var image = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = File(image!.path);
    });
  }

  void uploadgallery() async {
    final ImagePicker picker = ImagePicker();
    var image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image!.path);
    });
  }
}
