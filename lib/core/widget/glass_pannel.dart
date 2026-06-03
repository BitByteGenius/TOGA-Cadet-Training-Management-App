import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:toga/core/constant/app_colors.dart';

class GlassPanel extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double blur;

  const GlassPanel({
    super.key, 
    required this.child, 
    this.padding,
    this.blur = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          padding: padding ?? const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.panelGlass,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.borderGlass, width: 1.0),
          ),
          child: child,
        ),
      ),
    );
  }
}