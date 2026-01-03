import 'package:task_cli/types.dart';

class Task {
  final int id;
  String desc;
  Status status;
  final DateTime createdAt;
  DateTime updatedAt;

  Task(this.desc)
    : id = DateTime.now().millisecondsSinceEpoch,
      status = Status.todo,
      createdAt = DateTime.now(),
      updatedAt = DateTime.now();
}
