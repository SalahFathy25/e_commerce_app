import 'package:e_commerce_app/common/widgets/appbar/custom_appbar.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/text_strings.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final isRTL = HelperFunctions.isRTL(context);

    return Scaffold(
      appBar: CustomAppbar(
        showBackArrow: true,
        title: Text(TextStrings.addNewAddress),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name Field
                TextFormField(
                  textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: TextStrings.name,
                  ),
                ),
                const SizedBox(height: Sizes.spaceBetweenInputFields),

                // Phone Field
                TextFormField(
                  textDirection: TextDirection.ltr,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.mobile),
                    labelText: TextStrings.phoneNo,
                  ),
                ),
                const SizedBox(height: Sizes.spaceBetweenInputFields),

                // Street + Postal Code Row
                Row(
                  textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
                  children: [
                    Expanded(
                      child: TextFormField(
                        textDirection:
                            isRTL ? TextDirection.rtl : TextDirection.ltr,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.building_31),
                          labelText: TextStrings.street,
                        ),
                      ),
                    ),
                    SizedBox(width: Sizes.spaceBetweenInputFields),
                    Expanded(
                      child: TextFormField(
                        textDirection: TextDirection.ltr,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.code),
                          labelText: TextStrings.postalCode,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Sizes.spaceBetweenInputFields),

                // City + State Row
                Row(
                  textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
                  children: [
                    Expanded(
                      child: TextFormField(
                        textDirection:
                            isRTL ? TextDirection.rtl : TextDirection.ltr,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.building),
                          labelText: TextStrings.city,
                        ),
                      ),
                    ),
                    SizedBox(width: Sizes.spaceBetweenInputFields),
                    Expanded(
                      child: TextFormField(
                        textDirection:
                            isRTL ? TextDirection.rtl : TextDirection.ltr,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.activity),
                          labelText: TextStrings.state,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Sizes.spaceBetweenInputFields),

                // Country Field
                TextFormField(
                  textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.global),
                    labelText: TextStrings.country,
                  ),
                ),
                const SizedBox(height: Sizes.defaultSpace),

                // Save Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(TextStrings.saveAddress),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
