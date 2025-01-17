import 'package:flutter/material.dart';
import 'package:tech_labs_task/generated/l10n.dart';
import 'package:tech_labs_task/src/config/theme/colors_manager.dart';
import 'package:tech_labs_task/src/core/resources/image_paths.dart';
import 'package:tech_labs_task/src/domain/entities/services/service.dart';
import 'package:tech_labs_task/src/presentation/screens/landing/widgets/home_header_widget.dart';
import 'package:tech_labs_task/src/presentation/screens/landing/widgets/home_service_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Service> _services = [
    Service(
      title: S.current.digitalTransformation,
      subtitle: S.current.digitalTransformationSubTitle,
      description: S.current.digitalTransformationDescription,
      imageUrl: ImagePaths.digitalTransformation,
    ),
    Service(
      title: S.current.consultancyServices,
      subtitle: S.current.consultancyServicesSubTitle,
      description: S.current.consultancyServicesDescription,
      imageUrl: ImagePaths.consultancyServices,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: true,
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                HomeHeaderWidget(),
                const SizedBox(
                  height: 42,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    S.of(context).ourService,
                    style: Theme.of(context).textTheme.displayMedium,
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _services.length,
                    itemBuilder: (context, index) {
                      return HomeServiceWidget(
                        service: _services[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 16,
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}