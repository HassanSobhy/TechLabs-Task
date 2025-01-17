import 'package:equatable/equatable.dart';

class Service extends Equatable {
  final String title;
  final String subtitle;
  final String description;
  final String imageUrl;

  const Service({
    this.title = "",
    this.subtitle = "",
    this.description = "",
    this.imageUrl = "",
  });

  @override
  List<Object> get props => [
    title,
    subtitle,
    description,
    imageUrl,
  ];
}
