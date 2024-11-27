class AppConstants {
  // Base URL de la API
  static const String apiBaseUrl = 'https://api.thecatapi.com/v1/';

 // Endpoints de la API
  static const String breedsEndpoint = '${apiBaseUrl}breeds';
  static const String imageEndpoint = '${apiBaseUrl}images/';

  // Base de datos local
  static const String localDatabaseName = 'cats_app.db';
  static const String favoritesTable = 'favorites';

  // Mensajes genéricos
  static const String errorFetchingData = 'Error fetching data. Please try again.';
  static const String noInternetConnection = 'No internet connection. Check your network.';

  // Configuración de red
  static const Duration networkTimeout = Duration(seconds: 15);

  // Estilos compartidos
  static const double defaultPadding = 16.0;
  static const double defaultBorderRadius = 8.0;

}
