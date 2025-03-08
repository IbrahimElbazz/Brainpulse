import 'package:brain_pulse/core/Theming/colors.dart';
import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("By logging. you agree to our ",
                style: Theme.of(context).textTheme.bodySmall),
            GestureDetector(
              onTap: () {},
              child: Text("Terms & Conditions",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: ColorsApp.grey500)),
            ),
            Text(
              " and",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        Center(
            child: GestureDetector(
          onTap: () {},
          child: Text("PrivacyPolicy.",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: ColorsApp.grey500)),
        )),
      ],
    );
  }
}
