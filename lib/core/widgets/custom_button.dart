import 'package:flutter/material.dart';
import '../theme/app_styles.dart';
import '../theme/app_colors.dart';

class GlowingButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Color color;

  const GlowingButton({
    super.key,
    required this.label,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.95), color.withOpacity(0.75)],
          ),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.25),
              blurRadius: 18,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: color.withOpacity(0.12),
              blurRadius: 6,
              spreadRadius: 1,
            ),
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        child: Center(child: Text(label, style: AppStyles.button)),
      ),
    );
  }
}
