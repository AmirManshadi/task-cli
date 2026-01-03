import 'dart:convert';

class Store {
  final String jsonData;
  late List<Map<String, Object>> data;

  Store(this.jsonData) {
    data = jsonDecode(jsonData);
  }
}
