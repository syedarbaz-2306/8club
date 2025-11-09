import 'package:flutter/material.dart';
import 'package:hotspot/styles/app_styles.dart';

class GradientButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool isEnabled;

  const GradientButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled ? onPressed : null,
      child: Container(
        padding: EdgeInsets.all($styles.insets.sm),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular($styles.insets.sm),
          border: Border.all(color: $styles.colors.text4, width: 0.2),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.05, 0.5, 0.95],
            colors: [
              $styles.colors.base1,
              $styles.colors.text5,
              $styles.colors.base1,
            ],
          ),
        ),
        child: Row(
          spacing: $styles.insets.xs,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: $styles.fonts.body1Regular.copyWith(
                color: isEnabled ? $styles.colors.text1 : $styles.colors.text4,
              ),
            ),
            if (icon != null) ...[
              Icon(
                icon,
                size: $styles.insets.md,
                color: isEnabled ? $styles.colors.text1 : $styles.colors.text4,
              )
            ]
          ],
        ),
      ),
    );
  }
}
