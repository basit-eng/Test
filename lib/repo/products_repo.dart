import '../models/products_model.dart';
import 'package:http/http.dart' as http;

class ProductRepo {
  Future<List<Products>> getProucts() async {
    var response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if (response.statusCode == 200) {
      return productsFromJson(response.body);
    } else {
      throw Exception("Failed to Load Data");
    }
  }
}
