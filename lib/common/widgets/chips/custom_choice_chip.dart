import 'package:e_commerce_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/app_colors.dart';

class CustomChoiceChip extends StatelessWidget {
  const CustomChoiceChip({
    super.key,
    required this.text,
    required this.isSelected,
    this.onSelected,
    this.translationKey,
  });

  final String text;
  final bool isSelected;
  final void Function(bool)? onSelected;
  final String? translationKey;

  @override
  Widget build(BuildContext context) {
    final isColor = HelperFunctions.getColor(text) != null;
    final isRTL = HelperFunctions.isRTL(context);
    // final displayText = translationKey != null
    //     ? S.of(context)!.translate(translationKey!)
    //     : text;

    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label:
            isColor
                ? const SizedBox()
                : Text(
                  text,
                  textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
                ),
        selected: isSelected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: isSelected ? AppColors.white : null),
        avatar:
            isColor
                ? CircularContainer(
                  width: 50,
                  height: 50,
                  backgroundColor: HelperFunctions.getColor(text)!,
                )
                : null,
        shape: isColor ? const CircleBorder() : null,
        labelPadding: isColor ? const EdgeInsets.all(0) : null,
        padding: isColor ? const EdgeInsets.all(0) : null,
        backgroundColor: isColor ? HelperFunctions.getColor(text)! : null,
        visualDensity: VisualDensity.standard,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}
