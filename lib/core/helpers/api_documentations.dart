class ApiDocumentations {
  static const String baseUrl = 'https://crudcrud.com/api/1843bb395eda41bfaea01f1670e15318';
  static const String allProducts = '$baseUrl/products';
  static String productById(String id) => '$baseUrl/products/$id';
}