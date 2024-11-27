import 'package:equatable/equatable.dart';

class Cat extends Equatable {
  final String id;
  final String name;
  final String origin;
  final String description;
  final int energyLevel;
  final String? imageUrl;

  const Cat({
    required this.id,
    required this.name,
    required this.origin,
    required this.description,
    required this.energyLevel,
    this.imageUrl,
  });

  @override
  List<Object?> get props => [id, name, origin, description, energyLevel, imageUrl];
}
