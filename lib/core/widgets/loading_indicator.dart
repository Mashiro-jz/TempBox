// lib/core/widgets/loading_indicator.dart
import 'package:flutter/material.dart';
import '../theme/app_palette.dart';

class LoadingIndicator extends StatelessWidget {
  final double size;

  const LoadingIndicator({super.key, this.size = 48.0});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          strokeWidth: 4.0,
          valueColor: AlwaysStoppedAnimation<Color>(AppPalette.primary.main),
        ),
      ),
    );
  }
}
