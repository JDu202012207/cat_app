import '../../domain/cat.dart';

/// El DTO es el encargado de convertir un objeto de la capa de datos en un objeto de la capa de dominio.
/// Este es el DTO de la clase Cat.
class CatDto {
  final String id;
  final String name;
  final String origin;
  final String description;
  final int energyLevel;
  final String? referenceImageId;
  String? imageUrl;

  /// Este es el constructor de la clase CatDto.
  CatDto({
    required this.id,
    required this.name,
    required this.origin,
    required this.description,
    required this.energyLevel,
    this.referenceImageId,
    this.imageUrl,
  });

  /// Este método es el encargado de convertir un JSON en un objeto CatDto.
  factory CatDto.fromJson(Map<String, dynamic> json) {
    final referenceImageId = json['reference_image_id'] as String?;
    final imageUrl = referenceImageId != null
        ? 'https://cdn2.thecatapi.com/images/$referenceImageId.jpg'
        : null;

    // Depuración: imprime la URL generada
    print('Generated imageUrl for ${json['name']}: $imageUrl');

    return CatDto(
      id: json['id'] as String,
      name: json['name'] as String,
      origin: json['origin'] as String,
      description: json['description'] as String,
      energyLevel: json['energy_level'] as int,
      referenceImageId: referenceImageId,
      imageUrl: imageUrl,
    );
  }

  /// Este metodo es el encargado de convertir un objeto CatDto en un objeto Cat.
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
}
