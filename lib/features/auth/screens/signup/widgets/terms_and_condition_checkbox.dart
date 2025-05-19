import 'package:flutter/material.dart';

import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TermsAndConditionCheckBox extends StatefulWidget {
  const TermsAndConditionCheckBox({super.key});

  @override
  State<TermsAndConditionCheckBox> createState() =>
      _TermsAndConditionCheckBoxState();
}

class _TermsAndConditionCheckBoxState extends State<TermsAndConditionCheckBox> {
  bool _terms = true;
  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: _terms,
            onChanged: (value) {
              setState(() {
                _terms = value!;
              });
            },
          ),
        ),
        const SizedBox(width: Sizes.spaceBetweenItems),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '${TextStrings.iAgreeTo} ',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: TextStrings.privacyPolicy,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? AppColors.white : AppColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? AppColors.white : AppColors.primary,
                ),
              ),
              TextSpan(
                text: ' ${TextStrings.and} ',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: TextStrings.termsOfUse,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? AppColors.white : AppColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? AppColors.white : AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
