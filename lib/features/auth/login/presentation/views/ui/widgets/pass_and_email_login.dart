import 'package:brain_pulse/core/Widgets/mytextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailAndPass extends StatefulWidget {
  const EmailAndPass({super.key});

  @override
  State<EmailAndPass> createState() => _EmailAndPassState();
}

class _EmailAndPassState extends State<EmailAndPass> {
  late TextEditingController passwordController;

  @override
  void initState() {
    // context.read<LoginCubit>().emailController.text = '';
    // context.read<LoginCubit>().passwordController.text = '';
    super.initState();
  }

  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      //   key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          MyTextField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid email';
              }
            },
            //  controller: context.read<LoginCubit>().emailController,
            hint: 'Email',
            icon: const Icon(Icons.email_outlined),
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
            //    controller: context.read<LoginCubit>().passwordController,
            showText: isObscureText ? true : false,
            hint: "Password",
            icon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
                color: isObscureText
                    ? const Color.fromARGB(255, 92, 92, 92)
                    : Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
