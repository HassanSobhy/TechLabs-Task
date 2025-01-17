import 'package:flutter/material.dart';
import 'package:tech_labs_task/generated/l10n.dart';
import 'package:tech_labs_task/src/config/route/routes_manager.dart';
import 'package:tech_labs_task/src/core/resources/image_paths.dart';
import 'package:tech_labs_task/src/di/injector.dart';
import 'package:tech_labs_task/src/domain/usecases/main/set_onboarding_status_use_case.dart';
import 'package:tech_labs_task/src/presentation/screens/on_boarding/widgets/on_boarding_card_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  final List<OnBoard> _onBoardingData = [
    OnBoard(
      title: S.current.digitalTransformation,
      description: S.current.digitalTransformationShortDescription,
      icon: ImagePaths.onboardingOne,
    ),
    OnBoard(
      title: S.current.consultancyServices,
      description: S.current.consultancyServicesShortDescription,
      icon: ImagePaths.onboardingTwo,
    ),
    OnBoard(
      title: S.current.microsoftLicensingService,
      description: S.current.microsoftLicensingServiceShortDescription,
      icon: ImagePaths.onboardingThree,
    ),
  ];
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xFFE5E5E5),
          body: Stack(
            clipBehavior: Clip.hardEdge,
            children: [
              Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: PageView.builder(
                    clipBehavior: Clip.none,
                    controller: _pageController,
                    itemCount: _onBoardingData.length,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.18,
                        ),
                        child: OnBoardingCardWidget(
                          onBoard: _onBoardingData[_currentPage],
                        ),
                      );
                    },
                  )),
              Positioned.directional(
                textDirection: Directionality.of(context),
                top: 20,
                start: 16,
                child: Image.asset(
                  ImagePaths.logo,
                  width: 76,
                  height: 49,
                ),
              ),
              Positioned(
                bottom: 150,
                right: 0,
                left: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _onBoardingData.length,
                    (index) => Container(
                      height: 10,
                      width: 10,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? Color(0xFFF46262)
                            : Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(width: 2, color: Color(0xFFF46262)),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 80,
                right: 0,
                left: 0,
                child: InkWell(
                  onTap: () async {
                    await _setOnBoardingStatus();
                    if (context.mounted) {
                      _navigateToRegisterScreen(context);
                    }
                  },
                  child: Text(
                    S.of(context).skip,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFCB2127),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Future<void> _setOnBoardingStatus() async {
    await injector<SetOnboardingStatusUseCase>()(true);
  }

  void _navigateToRegisterScreen(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      Routes.register,
      (route) => false,
    );
  }
}

class OnBoard {
  final String title;
  final String description;
  final String icon;

  OnBoard({
    required this.title,
    required this.description,
    required this.icon,
  });
}
