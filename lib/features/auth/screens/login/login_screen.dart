import 'package:e_commerce_app/common/styles/spacing_styles.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../utils/constants/text_strings.dart';
import 'widgets/login_form.dart';
import 'widgets/login_header.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: SpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              LoginHeader(),
              LoginForm(),
              FormDivider(dividerText: TextStrings.orSignInWith),
              SizedBox(height: Sizes.spaceBetweenSections),
              SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
