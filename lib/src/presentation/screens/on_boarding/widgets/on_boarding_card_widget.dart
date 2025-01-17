import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_labs_task/src/presentation/screens/on_boarding/on_boarding_screen.dart';

class OnBoardingCardWidget extends StatelessWidget {
  final OnBoard onBoard;

  const OnBoardingCardWidget({
    super.key,
    required this.onBoard,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          height: 360,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 80,
              ),
              Text(
                onBoard.title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF35323E),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                onBoard.description,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF35323E),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Positioned(
          top: -44,
          left: 0,
          right: 0,
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Color(0xFFCB2127),
              shape: BoxShape.circle,
            ),
            height: 88,
            width: 88,
            child: SvgPicture.asset(
              onBoard.icon,
              height: 40,
              width: 40,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ],
    );
  }
}
