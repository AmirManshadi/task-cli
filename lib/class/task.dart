import 'package:task_cli/types.dart';
import 'package:uuid/v4.dart';

const v4 = UuidV4();

class Task {
  final String id;
  String desc;
  Status status;
  final DateTime createdAt;
  DateTime updatedAt;

  Task(this.desc)
    : id = v4.generate(),
      status = Status.todo,
      createdAt = DateTime.now(),
      updatedAt = DateTime.now();

  Map<String, dynamic> toJson() => {
    'id': id,
    'desc': desc,
    'status': status.value,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };

  static Task fromJson(Map<String, dynamic> json) {
    final task = Task(json['desc'] as String);

    task.status = Status.values.firstWhere(
      (s) => s.value == json['status'],
      orElse: () => Status.todo,
    );

    task.updatedAt = DateTime.parse(json['updatedAt'] as String);

    return task;
  }
}
