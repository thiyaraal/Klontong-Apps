class ApiDocumentations {
  static const String baseUrl = 'https://crudcrud.com/api/f5daa848df3f4144b1b65776a4e9b6d6';
  static const String allProducts = '$baseUrl/products';
  static String productById(String id) => '$baseUrl/products/$id';
}