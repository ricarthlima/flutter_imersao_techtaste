import 'package:flutter/material.dart';

import '../../_core/app_colors.dart';
import '../../_core/app_theme.dart';

class CheckoutWidget extends StatelessWidget {
  final Function onTap;
  final Widget leading;
  final Widget child;
  const CheckoutWidget({
    super.key,
    required this.onTap,
    required this.leading,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap.call(),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundLightColor,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 16,
              children: [
                leading,
                child,
              ],
            ),
            IconButton.filled(
              onPressed: () {},
              icon: Icon(Icons.arrow_forward_ios_rounded),
              style: AppTheme.iconButtonStylized,
            ),
          ],
        ),
      ),
    );
  }
}
