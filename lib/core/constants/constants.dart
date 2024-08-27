class Urls {
  static String baseUrl =
      'https://g5-flutter-learning-path-be.onrender.com/api/v1';

  static String getProductById(String id) => '$baseUrl/groceries/$id';
  static String getAllProducts() => '$baseUrl/groceries';

  static String getUser() => '$baseUrl/users/me';
  static String signIn() => '$baseUrl/auth/login';
  static String signUp() => '$baseUrl/auth/register';
}
