import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_labs_task/src/core/resources/image_paths.dart';

class RegisterHeaderWidget extends StatelessWidget {
  const RegisterHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Image.asset(
              ImagePaths.logo,
              width: 76,
              height: 49,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SvgPicture.asset(
          ImagePaths.start,
          height: 350,
        ),
      ],
    );
  }
}
