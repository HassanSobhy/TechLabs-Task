import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_labs_task/generated/l10n.dart';
import 'package:tech_labs_task/src/config/theme/colors_manager.dart';
import 'package:tech_labs_task/src/core/resources/image_paths.dart';
import 'package:tech_labs_task/src/presentation/screens/landing/widgets/account_screen.dart';
import 'package:tech_labs_task/src/presentation/screens/landing/widgets/home_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final List<Widget> _screens = const [
    AccountScreen(),
    HomeScreen(),
  ];
  int _currentScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Color(0xFF98BEE0).withOpacity(0.15),
              blurRadius: 4,
              spreadRadius: 0,
              offset: const Offset(0, -3),
            ),
          ]),
          child: BottomNavigationBar(
            enableFeedback: false,
            type: BottomNavigationBarType.fixed,
            landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
            currentIndex: _currentScreenIndex,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            backgroundColor: ColorsManager.white,
            iconSize: 24,
            onTap: (index) {
              setState(() {
                _currentScreenIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  ImagePaths.profileUnActive,
                  fit: BoxFit.scaleDown,
                ),
                activeIcon: SvgPicture.asset(
                  ImagePaths.profileActive,
                  fit: BoxFit.scaleDown,
                ),
                label: S.of(context).account,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  ImagePaths.homeUnActive,
                  fit: BoxFit.scaleDown,
                ),
                activeIcon: SvgPicture.asset(
                  ImagePaths.homeActive,
                  fit: BoxFit.scaleDown,
                ),
                label: S.of(context).home,
              ),
            ],
          ),
        ),
        body: _screens[_currentScreenIndex],
      ),
    );
  }
}
