import 'package:e_commerce_app/utils/constants/images_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/success_screen/success_screen.dart';
import '../login/login_screen.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed:
                () => Get.offAll(
                  () => const LoginScreen(),
                  transition: Transition.cupertino,
                ),
            icon: const Icon(CupertinoIcons.clear_circled),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              Image(
                image: const AssetImage(
                  ImagesStrings.deliveredEmailIllustration,
                ),
                width: HelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: Sizes.spaceBetweenSections),
              Text(
                TextStrings.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Sizes.spaceBetweenItems),
              Text(
                'example@gmail.com',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Sizes.spaceBetweenItems),
              Text(
                TextStrings.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Sizes.spaceBetweenSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed:
                      () => Get.to(
                        () =>  SuccessScreen(
                          image: ImagesStrings.staticSuccessIllustration,
                          title: TextStrings.yourAccountCreatedTitle,
                          subTitle: TextStrings.yourAccountCreatedSubTitle,
                          onPressed: () => Get.to(
                            () => const LoginScreen(),
                            transition: Transition.cupertino,
                          ),
                        ),
                        transition: Transition.cupertinoDialog,
                      ),
                  child: Text(TextStrings.tContinue),
                ),
              ),
              const SizedBox(height: Sizes.spaceBetweenItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: Text(TextStrings.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
