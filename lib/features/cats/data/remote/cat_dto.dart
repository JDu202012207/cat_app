import '../../domain/cat.dart';

/// El DTO es el encargado de convertir un objeto de la capa de datos en un objeto de la capa de dominio
/// Este es el DTO de la clase Cat
class CatDto {
  final String id;
  final String name;
  final String origin;
  final String description;
  final int energyLevel;
  final String? imageUrl;

/// Este es el constructor de la clase CatDto
  CatDto({
    required this.id,
    required this.name,
    required this.origin,
    required this.description,
    required this.energyLevel,
    this.imageUrl,
  });

/// Este metodo es el encargado de convertir un objeto CatDto en un objeto Cat
  Cat toDomain() {
    return Cat(
      id: id,
      name: name,
      origin: origin,
      description: description,
      energyLevel: energyLevel,
      imageUrl: imageUrl,
    );
  }

/// Este metodo es el encargado de convertir un json en un objeto CatDto
  factory CatDto.fromJson(Map<String, dynamic> json) {
    return CatDto(
      id: json['id'],
      name: json['name'],
      origin: json['origin'],
      description: json['description'],
      energyLevel: json['energy_level'],
      imageUrl: json['image_url'],
    );
  }
}