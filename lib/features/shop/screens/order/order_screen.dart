import 'package:e_commerce_app/common/widgets/appbar/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';
import 'widgets/order_list.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: Text(
          'My Orders',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(Sizes.defaultSpace),
        child: OrderListItems(),
      ),
    );
  }
}
