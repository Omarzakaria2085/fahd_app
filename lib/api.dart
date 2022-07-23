import 'dart:convert';
import 'package:rayan_app/models/item.dart';
import 'package:http/http.dart' as http;
import 'package:rayan_app/models/new_order.dart';

class Api {
// CONSTANTS
  static const String _baseUrl = 'http://omarsultan682-001-site1.dtempurl.com';
// ----------------------------------------------------------------------------------------------------- //

// GET REQUESTS
  // Home Page Items
  static Future<List<Item>> getHomePageItems() async {
    Uri url = Uri.parse('$_baseUrl/api/homepage');

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      Iterable jsonList = json.decode(response.body);
      return jsonList.map((model) => Item.fromMap(model)).toList();
    }

    return null;
  }
// ----------------------------------------------------------------------------------------------------- //

// POST REQUESTS
  // Post New Order and User
  static Future<bool> saveOrderItem(NewOrder newOrder) async {
    Uri url = Uri.parse('$_baseUrl/api/BasketApi/SaveOrderItem');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: newOrder.toJson(),
    );

    if (response.statusCode == 200) return json.decode(response.body)["data"];
    return null;
  }

// ----------------------------------------------------------------------------------------------------- //

}
