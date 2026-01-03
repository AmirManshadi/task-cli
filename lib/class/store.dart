import 'dart:convert';

import 'package:task_cli/class/task.dart';

class Store {
  final List<Task> _data;

  Store.fromJson(String jsonString) : _data = _parseData(jsonString);
  Store.fromData(this._data);

  static List<Task> _parseData(String jsonString) {
    final decoded = jsonDecode(jsonString) as List;
    return decoded
        .map((item) => Task.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  List<Task> get tasks => List<Task>.from(_data);
  String get json => jsonEncode(_data);
}
