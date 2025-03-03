// import 'package:brain_pulse/core/Theming/colors.dart';
// import 'package:brain_pulse/core/Theming/text_style.dart';
// import 'package:brain_pulse/core/helpers/extentions.dart';
// import 'package:brain_pulse/features/auth/register/register.dart';
// import 'package:flutter/material.dart';

// class SignUp extends StatelessWidget {
//   String text3;
//   String text4;
//   SignUp({super.key, required this.text3, required this.text4});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           text3,
//           style: TextStyleApp.font12weight400colorGrey.copyWith(fontSize: 11),
//         ),
//         GestureDetector(
//           onTap: () {
//             Navigator.push(context, MaterialPageRoute(builder: (context) {
//               return const RegisterPage();
//             }));
//           },
//           child: Text(text4,
//               style: TextStyleApp.font12weight400colorGrey
//                   .copyWith(color: ColorsApp.blue, fontSize: 11)),
//         ),
//       ],
//     );
//   }
// }
