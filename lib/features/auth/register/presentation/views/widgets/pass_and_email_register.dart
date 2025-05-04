import 'package:brain_pulse/core/Theming/colors.dart';
import 'package:brain_pulse/core/Theming/text_style.dart';
import 'package:brain_pulse/core/Widgets/gap.dart';
import 'package:brain_pulse/core/Widgets/mytextfield.dart';
import 'package:brain_pulse/features/auth/register/presentation/controller/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ionicons/ionicons.dart';

class PassAndEmail extends StatefulWidget {
  const PassAndEmail({super.key});
  @override
  State<PassAndEmail> createState() => _PassAndEmailState();
}

class _PassAndEmailState extends State<PassAndEmail> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    var read = context.read<RegisterCubit>();
    return Form(
      key: read.keyform,
      child: Column(
        children: [
          MyTextField(
            controller: read.firstname,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid  firstname';
              }
            },
            hint: "First Name",
          ),
          const SizedBox(
            height: 20,
          ),
          // MyTextField(
          //   controller: read.lastname,
          //   validator: (value) {
          //     if (value == null || value.isEmpty) {
          //       return 'Please enter a valid lastname';
          //     }
          //   },
          //   hint: "Last Name",
          // ),
          const SizedBox(
            height: 20,
          ),
          MyTextField(
            controller: read.email,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid email';
              }
            },
            icon: const Icon(Ionicons.mail_outline, color: Colors.grey),
            showText: false,
            hint: 'Email',
          ),
          const SizedBox(
            height: 20,
          ),
          IntlPhoneField(
            initialCountryCode: 'EG',
            controller: read.phone,
            validator: (value) {
              if (value == null) {
                return 'Please enter a valid phone number';
              }
              return null;
            },
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: Colors.grey[300]!,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
              ),
              hintText: "Your number",
              hintStyle:
                  TextStyleApp.styleText(15, Colors.grey, FontWeight.normal),
              fillColor: const Color(0xffFDFDFF),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MyTextField(
            controller: read.password,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid pass';
              }
            },
            showText: isObscureText ? true : false,
            hint: "Password",
            icon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Ionicons.eye_off_outline : Ionicons.eye_outline,
                color: isObscureText ? Colors.grey : ColorsApp.primary,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MyTextField(
            controller: read.confirmpassword,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid pass';
              }
            },
            showText: isObscureText ? true : false,
            hint: "Password Confirm",
            icon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Ionicons.eye_off_outline : Ionicons.eye_outline,
                color: isObscureText ? Colors.grey : ColorsApp.primary,
              ),
            ),
          ),
          const GapH(
            height: 30,
          ),
        ],
      ),
    );
  }
}
