import 'package:brain_pulse/core/Theming/colors.dart';
import 'package:brain_pulse/core/Widgets/mytextfield.dart';
import 'package:brain_pulse/features/auth/login/presentation/controller/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';

class EmailAndPass extends StatefulWidget {
  const EmailAndPass({super.key});

  @override
  State<EmailAndPass> createState() => _EmailAndPassState();
}

class _EmailAndPassState extends State<EmailAndPass> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    var read = context.read<LoginCubit>();
    return Form(
      key: read.keyform,
      child: Column(
        children: [
          MyTextField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid email';
              }
            },
            controller: read.email,
            hint: 'Email',
            icon: const Icon(
              Ionicons.mail_outline,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          MyTextField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid pass';
              }
            },
            controller: read.password,
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
        ],
      ),
    );
  }
}
