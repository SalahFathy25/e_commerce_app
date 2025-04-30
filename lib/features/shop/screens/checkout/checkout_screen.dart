import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_app/common/widgets/success_screen/success_screen.dart';
import 'package:e_commerce_app/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:e_commerce_app/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:e_commerce_app/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/utils/constants/app_colors.dart';
import 'package:e_commerce_app/utils/constants/images_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/custom_appbar.dart';
import '../../../../common/widgets/products/cart/coupon_code_widget.dart';
import '../../../../utils/helpers/helper_functions.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: CustomAppbar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              // Item In Cart
              CartItems(showAddRemoveButtons: false),
              SizedBox(height: Sizes.spaceBetweenSections),

              // Coupon Code
              CouponCode(),
              SizedBox(height: Sizes.spaceBetweenSections),

              // Billing Section
              RoundedContainer(
                padding: const EdgeInsets.all(Sizes.md),
                showBorder: true,
                backgroundColor: dark ? AppColors.black : AppColors.white,
                child: Column(
                  children: [
                    BillingAmountSection(),
                    SizedBox(height: Sizes.spaceBetweenItems),

                    Divider(),
                    SizedBox(height: Sizes.spaceBetweenItems),

                    BillingPaymentSection(),
                    SizedBox(height: Sizes.spaceBetweenItems),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(Sizes.defaultSpace),
        child: ElevatedButton(
          onPressed:
              () => Get.to(
                () => SuccessScreen(
                  image: ImagesStrings.successfulPaymentIcon,
                  title: 'Payment Success!',
                  subTitle: 'Your item will be shipped soon!',
                  onPressed: () => Get.offAll(() => const NavigationMenu()),
                ),
                transition: Transition.rightToLeft,
              ),
          child: Text('Checkout \$256.0'),
        ),
      ),
    );
  }
}
