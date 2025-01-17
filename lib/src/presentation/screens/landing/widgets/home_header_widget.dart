import 'package:flutter/material.dart';
import 'package:tech_labs_task/src/config/theme/colors_manager.dart';
import 'package:tech_labs_task/src/core/resources/image_paths.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 184,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            ImagePaths.homeHeaderBg,
          ),
          fit: BoxFit.fitWidth,
        ),
      ),
      alignment: Alignment.centerLeft,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "TechLabs London",
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              color: ColorsManager.black,
            ),
          ),
          Text(
            "Microsoft AI Cloud Solution Partner",
            style: TextStyle(
              color: ColorsManager.primary,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
