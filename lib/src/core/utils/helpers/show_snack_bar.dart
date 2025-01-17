import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_labs_task/src/config/theme/colors_manager.dart';

void showSnackBar({
  required BuildContext context,
  required String message,
  required Color color,
  required String icon,
  double horizontalPadding = 16,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      clipBehavior: Clip.none,
      padding: const EdgeInsets.symmetric(vertical: 16),
      content: Padding(
        padding:  EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: ClipRRect(
          clipBehavior: Clip.none,
          borderRadius:  BorderRadius.circular(4),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            decoration:   BoxDecoration(
              color: color,
              borderRadius:  BorderRadius.circular(4),
            ),
            alignment: Alignment.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 2,
                  ),
                  child: SvgPicture.asset(
                    icon,
                    width: 20,
                    height: 20,
                    colorFilter: const ColorFilter.mode(
                      ColorsManager.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    message,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: ColorsManager.white,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 3,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
  );
}
