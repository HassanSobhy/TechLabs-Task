import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_labs_task/src/config/theme/colors_manager.dart';
import 'package:tech_labs_task/src/core/resources/image_paths.dart';

class AccountHeaderWidget extends StatelessWidget {
  final Function() logout;

  const AccountHeaderWidget({
    super.key,
    required this.logout,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 70,
          height: 115,
          decoration: BoxDecoration(
            color: ColorsManager.primary,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(45),
              bottomRight: Radius.circular(45),
            ),
          ),
          child: Center(
            child: Image.asset(
              ImagePaths.logoWhite,
              width: 76,
              height: 76,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            logout();
          },
          child: SvgPicture.asset(
            ImagePaths.logout,
            width: 24,
            height: 24,
            matchTextDirection: true,
          ),
        )
      ],
    );
  }
}
