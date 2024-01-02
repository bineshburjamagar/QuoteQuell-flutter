import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.title,
    this.ontap,
  });
  final String? title;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      width: double.infinity,
      child: FilledButton(
        style: FilledButton.styleFrom(
          shape:
              BeveledRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
        onPressed: ontap ?? () {},
        child: Center(
          child: Text(
            title ?? 'Continue',
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
