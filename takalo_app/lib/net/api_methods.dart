import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<double> getPrice(String id) async {
  try {
    var url = Uri.parse('https://api.coingecko.com/api/v3/simple/price?ids=' +
        id +
        '&vs_currencies=usd');
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var value = json[id]['usd'].toString();
    return double.parse(value);
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    return 0.0;
  }
}
