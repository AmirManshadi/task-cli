import 'package:task_cli/class/task.dart';
import 'package:task_cli/types.dart';

class Manager {
  final List<Task> _tasks;

  Manager(this._tasks);

  List<Task> get tasks => List<Task>.from(_tasks);

  void add(Args args) {
    final desc = args.firstOrNull ?? (throw "No description provided");
    _tasks.add(Task(desc));
  }

  void delete(Args args) {
    final id = args.firstOrNull ?? (throw "No id provided");
    final oneBasedIndex = int.tryParse(id) ?? (throw 'Invalid id');
    _tasks.removeAt(oneBasedIndex - 1);
  }

  void _listAll() {
    for (var index = 0; index < _tasks.length; index++) {
      final task = _tasks[index];
      print('${index + 1}: ${task.desc} (${task.status.value})');
    }
  }

  void _listStatus(String status) {
    final statusEnum = Status.values.firstWhere((s) => s.value == status);
    for (var index = 0; index < _tasks.length; index++) {
      final task = _tasks[index];
      if (task.status == statusEnum) {
        print('${index + 1}: ${task.desc}');
      }
    }
  }

  void list(Args args) {
    final status = args.firstOrNull;

    if (status == null) {
      _listAll();
    } else if (Status.values.map((s) => s.value).toList().contains(status)) {
      _listStatus(status);
    } else {
      throw "Invalid Status";
    }
  }

  void update(Args args) {
    if (args.length < 2) throw "Not enough arguments for update";
    if (args.length > 2) throw "Too many arguments for update";

    final id = args.firstOrNull ?? (throw "No id provided");
    final desc = args.lastOrNull ?? (throw "No description provided");
    final oneBasedIndex = int.tryParse(id) ?? (throw 'Invalid id');
    final task =
        _tasks.elementAtOrNull(oneBasedIndex - 1) ?? (throw "Task not found");

    if (desc.isEmpty) throw "No description provided";

    task.desc = desc;
    task.updatedAt = DateTime.now();
  }

  void mark(Status status, Args args) {
    final id = args.firstOrNull ?? (throw "No id provided");
    final index = int.tryParse(id) ?? (throw 'Invalid id');
    final task = _tasks.elementAtOrNull(index - 1) ?? (throw "Task not found");

    task.status = status;
    task.updatedAt = DateTime.now();
  }
}
