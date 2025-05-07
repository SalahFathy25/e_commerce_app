import 'package:e_commerce_app/common/widgets/appbar/custom_appbar.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:e_commerce_app/common/widgets/language&theme/change_language_button.dart';
import 'package:e_commerce_app/common/widgets/language&theme/change_theme_button.dart';
import 'package:e_commerce_app/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/shop/screens/order/order_screen.dart';
import 'package:e_commerce_app/utils/constants/app_colors.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../../../../utils/constants/sizes.dart';
import '../address/address.dart';
import '../profile/profile_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  CustomAppbar(
                    title: Text(
                      TextStrings.account,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium!.apply(color: AppColors.white),
                    ),
                  ),

                  UserProfileTile(
                    onPressed: () => Get.to(() => const ProfileScreen()),
                  ),
                  SizedBox(height: Sizes.spaceBetweenSections),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.all(Sizes.defaultSpace),
              child: Column(
                children: [
                  SectionHeading(
                    title: TextStrings.accountSettings,
                    showActionButton: false,
                  ),
                  SizedBox(height: Sizes.spaceBetweenItems),

                  SettingsMenuTile(
                    title: TextStrings.address,
                    subtitle: TextStrings.addressSubtitle,
                    icon: Iconsax.safe_home,
                    onTap:
                        () => Get.to(
                          () => const UserAddressScreen(),
                          transition: Transition.rightToLeft,
                          duration: const Duration(milliseconds: 500),
                        ),
                  ),
                  SettingsMenuTile(
                    title: TextStrings.cart,
                    subtitle: TextStrings.cartSubtitle,
                    icon: Iconsax.shopping_cart,
                  ),
                  SettingsMenuTile(
                    title: TextStrings.orders,
                    subtitle: TextStrings.ordersSubtitle,
                    icon: Iconsax.bag_tick,
                    onTap:
                        () => Get.to(
                          () => const OrderScreen(),
                          transition: Transition.rightToLeft,
                          duration: const Duration(milliseconds: 500),
                        ),
                  ),
                  SettingsMenuTile(
                    title: TextStrings.bankAccount,
                    subtitle: TextStrings.bankAccountSubtitle,
                    icon: Iconsax.bank,
                  ),
                  SettingsMenuTile(
                    title: TextStrings.coupons,
                    subtitle: TextStrings.couponsSubtitle,
                    icon: Iconsax.discount_shape,
                  ),
                  SettingsMenuTile(
                    title: TextStrings.notifications,
                    subtitle: TextStrings.notificationsSubtitle,
                    icon: Iconsax.notification,
                  ),
                  SettingsMenuTile(
                    title: TextStrings.accountPrivacy,
                    subtitle: TextStrings.accountPrivacy,
                    icon: Iconsax.security_card,
                  ),

                  SizedBox(height: Sizes.spaceBetweenSections),
                  SectionHeading(
                    title: TextStrings.appSettings,
                    showActionButton: false,
                  ),
                  SizedBox(height: Sizes.spaceBetweenItems),
                  // SettingsMenuTile(
                  //   title: 'Load Data',
                  //   subtitle: 'Upload Data to your Cloud Firebase',
                  //   icon: Iconsax.document_upload,
                  // ),
                  // SettingsMenuTile(
                  //   title: 'Geolocation',
                  //   subtitle: 'Set recommendation based on location',
                  //   icon: Iconsax.location,
                  //   trailing: Switch(value: true, onChanged: (value) {}),
                  // ),
                  SettingsMenuTile(
                    title: TextStrings.theme,
                    subtitle: TextStrings.themeSubtitle,
                    icon: Iconsax.moon,
                    trailing: ChangeThemeButton(),
                  ),
                  // SettingsMenuTile(
                  //   title: TextStrings.language,
                  //   subtitle: TextStrings.languageSubtitle,
                  //   icon: Iconsax.location,
                  //   trailing: ChangeLanguageButton(),
                  // ),
                  SettingsMenuTile(
                    title: TextStrings.safeMode,
                    subtitle: TextStrings.safeModeSubtitle,
                    icon: Iconsax.security_user,
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  SettingsMenuTile(
                    title: TextStrings.hdImage,
                    subtitle: TextStrings.hdImageSubtitle,
                    icon: Iconsax.image,
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),

                  SizedBox(height: Sizes.spaceBetweenSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text(TextStrings.logOut),
                    ),
                  ),
                  SizedBox(height: Sizes.spaceBetweenSections * 2.5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
