import 'package:flutter/material.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/device/device_utility.dart';
import '../../../utils/helpers/helper_functions.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final isRTL = HelperFunctions.isRTL(context);

    return Material(
      color: dark ? AppColors.black : AppColors.white,
      child: Directionality(
        textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
        child: TabBar(
          tabs: tabs,
          isScrollable: true,
          indicatorColor: AppColors.primary,
          unselectedLabelColor: AppColors.darkerGrey,
          labelColor: dark ? AppColors.white : AppColors.primary,
          physics: const BouncingScrollPhysics(),
          labelPadding: EdgeInsetsDirectional.only(
            start: isRTL ? Sizes.lg : Sizes.md,
            end: isRTL ? Sizes.md : Sizes.lg,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(DeviceUtils.getAppBarHeight());
}
