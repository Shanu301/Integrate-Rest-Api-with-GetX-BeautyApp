import 'package:http/http.dart' as http;
import 'package:instafeed/model/Empty.dart';


class RemoteServices {
  static var client = http.Client();

  static Future<List<Empty>> fetchProducts() async {
    var response = await client.get(
        'http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline');
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return emptyFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
}