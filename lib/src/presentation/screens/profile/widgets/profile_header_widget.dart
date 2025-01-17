import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_labs_task/generated/l10n.dart';
import 'package:tech_labs_task/src/config/theme/colors_manager.dart';
import 'package:tech_labs_task/src/core/resources/image_paths.dart';

class ProfileHeaderWidget extends StatelessWidget {
  final Function() onTap;

  const ProfileHeaderWidget({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                onTap();
              },
              child: SvgPicture.asset(
                ImagePaths.backArrow,
                matchTextDirection: true,
              ),
            ),
            const SizedBox(
              width: 14,
            ),
            Text(
              S.of(context).profile,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        const SizedBox(
          height: 36,
        ),
        Center(
          child: Image.asset(
            ImagePaths.logo,
            width: 150,
            height: 125,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 21,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: ColorsManager.primary,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF46007F).withOpacity(
                  0.22,
                ),
                spreadRadius: 0,
                blurRadius: 11,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: Text(
            S.of(context).personalInfo,
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
