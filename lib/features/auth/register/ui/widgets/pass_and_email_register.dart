import 'package:brain_pulse/core/Theming/text_style.dart';
import 'package:brain_pulse/core/Widgets/mytextfield.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PassAndEmail extends StatefulWidget {
  const PassAndEmail({super.key});

  @override
  State<PassAndEmail> createState() => _PassAndEmailState();
}

class _PassAndEmailState extends State<PassAndEmail> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          MyTextField(
            //  controller: context.read<RegisterCubit>().nameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid name';
              }
            },
            hint: "Name",
          ),
          const SizedBox(
            height: 20,
          ),
          MyTextField(
            // controller: context.read<RegisterCubit>().emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid email';
              }
            },
            icon: const Icon(Icons.email_outlined),
            showtext: false,
            hint: 'Email',
          ),
          const SizedBox(
            height: 20,
          ),
          IntlPhoneField(
            initialCountryCode: 'EG',
            //  controller: context.read<RegisterCubit>().phoneController,
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
            //   controller: context.read<RegisterCubit>().passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid pass';
              }
            },
            showtext: isObscureText ? true : false,
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
          const SizedBox(
            height: 20,
          ),
          MyTextField(
            //  controller: context.read<RegisterCubit>().confirmPasswordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid pass';
              }
            },
            showtext: isObscureText ? true : false,
            hint: "Password Confirm",
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
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
