import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../data/remote/cat_service.dart';
import '../../data/repository/cat_repository.dart';
import '../widgets/cat_card.dart';

class ShowPage extends StatelessWidget {
  const ShowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Inicializamos las dependencias aquí
    final client = http.Client();
    final catService = CatService(client: client);
    final repository = CatRepository(catService);

    return Scaffold(
      appBar: AppBar(title: const Text('Cat Breeds')),
      body: FutureBuilder(
        future: repository.getCats(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator()); // Mostramos un indicador de carga
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}')); // Manejamos errores
          } else if (snapshot.hasData) {
            final result = snapshot.data;

            if (result != null) {
              return result.fold(
                (error) => Center(child: Text('Error: ${error.toString()}')), // Error desde el repositorio
                (cats) => ListView.builder(
                  itemCount: cats.length,
                  itemBuilder: (context, index) {
                    final cat = cats[index];
                    return CatCard(cat: cat); // Mostramos cada gato con CatCard
                  },
                ),
              );
            } else {
              return const Center(child: Text('No data available')); // Datos vacíos
            }
          } else {
            return const Center(child: Text('No data available')); // Manejo por defecto
          }
        },
      ),
    );
  }
}
