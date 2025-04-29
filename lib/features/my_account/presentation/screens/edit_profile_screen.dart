import 'package:brain_pulse/core/Theming/colors.dart';
import 'package:brain_pulse/core/Widgets/gap.dart';
import 'package:brain_pulse/core/Widgets/pop_circle_button.dart';
import 'package:brain_pulse/core/helpers/extentions.dart';
import 'package:brain_pulse/features/my_account/presentation/widgets/button.dart';
import 'package:brain_pulse/features/my_account/presentation/widgets/text_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: <Widget>[
                AppBar(
                  title: const Text(
                    'Update Profile',
                  ),
                  leading: const PopCircleButton(),
                  centerTitle: true,
                ),
                const GapH(height: 40),
                textFieldCustom(
                  hintText: 'Doctor name',
                  iconP: IconButton(
                    icon: IconButton(
                      icon: SvgPicture.asset('assets/svgs/user.svg'),
                      onPressed: () {},
                    ),
                    onPressed: () {},
                  ),
                ),
                const GapH(height: 20),
                textFieldCustom(
                  hintText: 'Email',
                  iconP: IconButton(
                    icon: IconButton(
                      icon: SvgPicture.asset('assets/svgs/mail.svg'),
                      onPressed: () {},
                    ),
                    onPressed: () {},
                  ),
                ),
                const GapH(height: 20),
                IntlPhoneField(
                  dropdownIconPosition: IconPosition.trailing,
                  dropdownTextStyle: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: 16.sp,
                  ),
                  decoration: InputDecoration(
                    focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                    labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400),
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.2),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                  ),
                  initialCountryCode: 'EG',
                  showCountryFlag: false,
                  keyboardType: TextInputType.number,
                  dropdownIcon: const Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: Colors.grey,
                  ),
                  onChanged: (PhoneNumber phone) {
                    //  phoneController.text = phone.completeNumber.toString();
                    print(phone.completeNumber);
                    print(
                      '++++++++++++++++++++++++++++++++++++++++++++++++++++++',
                    );
                  },
                ),
                const GapH(height: 300),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: 160.w,
                      height: 60.h,
                      child: CustomButtonAcc(
                        color: ColorsApp.primary,
                        text: 'Save',
                        onTap: () {},
                      ),
                    ),
                    SizedBox(
                      width: 160.w,
                      height: 60.h,
                      child: CustomButtonAcc(
                        color: Colors.white,
                        textColor: const Color(0xFFAAB9C5),
                        text: 'Cancel',
                        onTap: () {
                          context.pop();
                        },
                      ),
                    ),
                  ],
                ),
                const GapH(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
