import 'package:flutter/material.dart';
import '../../domain/cat.dart';

class CatCard extends StatelessWidget {
  final Cat cat;

  const CatCard({required this.cat, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen del gato
            if (cat.imageUrl != null)
              Center(
                child: Image.network(
                  cat.imageUrl!,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              )
            else
              const Center(
                child: Icon(Icons.pets, size: 100, color: Colors.grey),
              ),

            const SizedBox(height: 16),

            // Nombre del gato
            Text(
              'Name: ${cat.name}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            // Origen del gato
            Text(
              'Origin: ${cat.origin}',
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 8),

            // Nivel de energía
            Row(
              children: [
                const Text('Energy Level:'),
                Expanded(
                  child: Slider(
                    value: cat.energyLevel.toDouble(),
                    min: 0,
                    max: 5,
                    divisions: 5,
                    onChanged: null, // Solo lectura
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Descripción
            Text(
              'Description:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              cat.description,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
