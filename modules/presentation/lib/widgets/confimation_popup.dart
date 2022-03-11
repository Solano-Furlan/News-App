import 'package:flutter/material.dart';
import 'package:presentation/theme/colors.dart';

class ConfirmationPopup extends StatelessWidget {
  final String title;
  final String text;
  final Color? primaryColor;
  final Function()? onConfirmation;
  const ConfirmationPopup({
    Key? key,
    required this.title,
    required this.text,
    this.onConfirmation,
    this.primaryColor = AppColors.red,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: const EdgeInsets.all(0),
      insetPadding: const EdgeInsets.all(0),
      content: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.white,
        ),
        clipBehavior: Clip.hardEdge,
        child: IntrinsicHeight(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Text(
                title,
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Divider(
                  color: AppColors.kGrey.shade200,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        primary: AppColors.kGrey.shade100,
                      ),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 1,
                    color: AppColors.kGrey.shade100,
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () =>
                          onConfirmation != null ? onConfirmation!() : null,
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 30,
                        ),
                        primary: AppColors.kGrey.shade100,
                      ),
                      child: Text(
                        "Yes",
                        style: TextStyle(
                          fontSize: 20,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
