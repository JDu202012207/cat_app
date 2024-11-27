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
            Center(
              child: (cat.imageUrl != null && Uri.tryParse(cat.imageUrl!)?.hasAbsolutePath == true)
                  ? Image.network(
                      cat.imageUrl!,
                      height: 150,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(child: CircularProgressIndicator());
                      },
                      errorBuilder: (context, error, stackTrace) {
                        print('Error loading image: $error');
                        return const Icon(Icons.broken_image, size: 100, color: Colors.grey);
                      },
                    )
                  : const Icon(Icons.pets, size: 100, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Text('Name: ${cat.name}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Origin: ${cat.origin}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('Energy Level:'),
                Expanded(
                  child: Slider(
                    value: cat.energyLevel.toDouble(),
                    min: 0,
                    max: 5,
                    divisions: 5,
                    onChanged: null,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text('Description:', style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(cat.description, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
