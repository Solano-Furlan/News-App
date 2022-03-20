import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

class PrimaryTextButton extends StatelessWidget {
  final Function() onPressed;
  final String text1;
  final String? text2;
  const PrimaryTextButton({
    Key? key,
    required this.onPressed,
    required this.text1,
    this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 18),
        primary: AppColors.kGrey,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text1,
            style: TextStyle(
              color: text2 != null && text2!.isNotEmpty
                  ? AppColors.kGrey
                  : AppColors.primaryColor,
              fontWeight: text2 != null && text2!.isNotEmpty
                  ? FontWeight.normal
                  : FontWeight.bold,
              fontSize: 18,
            ),
          ),
          if (text2 != null && text2!.isNotEmpty)
            Text(
              ' $text2',
              style: const TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
        ],
      ),
    );
  }
}
