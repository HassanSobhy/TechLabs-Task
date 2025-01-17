import 'package:flutter/material.dart';
import 'package:tech_labs_task/src/config/theme/colors_manager.dart';
import 'package:tech_labs_task/src/domain/entities/services/service.dart';

class HomeServiceWidget extends StatelessWidget {
  final Service service;

  const HomeServiceWidget({
    super.key,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: ColorsManager.black.withOpacity(0.15),
            blurRadius: 16,
            spreadRadius: 0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                service.imageUrl,
                width: 50,
                height: 50,
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(service.title,
                      style: TextStyle(
                        color: ColorsManager.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      )),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    service.subtitle,
                    style: TextStyle(
                      color: ColorsManager.darkerGrey,
                      fontWeight: FontWeight.w400,
                      fontSize: 8,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            service.description,
            style: TextStyle(
              color: ColorsManager.black,
              fontWeight: FontWeight.w400,
              fontSize: 8,
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }
}
