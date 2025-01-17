import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_labs_task/src/core/resources/image_paths.dart';

class AccountItemWidget extends StatelessWidget {
  final Function() onTap;
  final String label;

  const AccountItemWidget({
    super.key,
    required this.onTap,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Color(0xFF282828),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          SvgPicture.asset(
            ImagePaths.arrow,
            matchTextDirection: true,
          )
        ],
      ),
    );
  }
}
