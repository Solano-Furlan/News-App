import 'package:flutter/material.dart';
import 'package:presentation/theme/colors.dart';

class PrimaryButton extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String? text;
  final bool isLoading;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final bool isDisabled;
  final Function()? onPressed;
  const PrimaryButton({
    Key? key,
    this.color = AppColors.primaryColor,
    this.text,
    this.isLoading = false,
    this.isDisabled = false,
    this.onPressed,
    this.leadingIcon,
    this.trailingIcon,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isLoading || isDisabled,
      child: ElevatedButton(
        onPressed: () => onPressed != null ? onPressed!() : null,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: isDisabled ? AppColors.lightGray : color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: SizedBox(
          height: 78,
          width: double.maxFinite,
          child: isLoading
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 3,
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (leadingIcon != null) ...[
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: leadingIcon,
                      ),
                    ],
                    Text(
                      text ?? '',
                      style: TextStyle(
                        fontSize: 20,
                        color:
                            isDisabled ? AppColors.kGrey.shade400 : textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (trailingIcon != null) ...[
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: trailingIcon,
                      ),
                    ],
                  ],
                ),
        ),
      ),
    );
  }
}
