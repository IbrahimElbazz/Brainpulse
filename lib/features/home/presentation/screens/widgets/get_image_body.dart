import 'dart:io';

import 'package:brain_pulse/core/Theming/colors.dart';
import 'package:brain_pulse/core/Theming/text_style.dart';
import 'package:brain_pulse/core/Widgets/custom_circle_button_pop.dart';
import 'package:brain_pulse/core/helpers/extentions.dart';
import 'package:brain_pulse/core/routing/routers.dart';

import 'package:brain_pulse/features/home/presentation/screens/widgets/custom_button.dart';
import 'package:dotted_border/dotted_border.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50.h, right: 300.w),
              child: const CustomCircleButtonPop(),
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 20.w),
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(15.r),
                  strokeWidth: 3,
                  dashPattern: [5, 8],
                  color: ColorsApp.primary,
                  child: Container(
                      width: double.infinity,
                      height: 500.h,
                      decoration: BoxDecoration(
                        color: ColorsApp.white,
                        borderRadius: BorderRadius.circular(15.r),
                        // image: DecorationImage(
                        //   image: _image != null
                        //       ? FileImage(_image!)
                        //       : const AssetImage(
                        //           "assets/images/products_noimageyet.jpg",
                        //         ),
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                      child: _image != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(15.r),
                              child: Image.file(
                                _image!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/image.png",
                                  width: 100.w,
                                  height: 100.h,
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                Text(
                                  "No image selected, Drop image here",
                                  style: TextStyleApp.styleText(
                                      15, ColorsApp.black, FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                CustomButton(
                                  onTap: uploadgallery,
                                  text: "Gallery",
                                  width: 140.w,
                                  height: 50.h,
                                  color: ColorsApp.primary,
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Text(
                                  "-------      or     -------",
                                  style: TextStyleApp.styleText(
                                      15, ColorsApp.black, FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                CustomButton(
                                  onTap: uploadcamera,
                                  text: "Camera",
                                  width: 140.w,
                                  height: 50.h,
                                  color: ColorsApp.primary,
                                ),
                              ],
                            )),
                )),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 40.w),
              child: CustomButton(
                text: "Show Result",
                width: double.infinity,
                color: ColorsApp.primary,
                height: 60.h,
                onTap: () {
                  if (_image != null) {
                    Navigator.pushNamed(context, Routes.eegdata);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("Please select an image first")),
                    );
                  }
                },
              ),
              // child: CustomButton(
              //     text: "Send Report", width: double.infinity, height: 60.h),
            )
          ],
        ),
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
