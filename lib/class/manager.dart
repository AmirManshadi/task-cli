import 'package:task_cli/class/task.dart';
import 'package:task_cli/types.dart';

class Manager {
  final List<Task> _tasks;

  Manager(this._tasks);

  List<Task> get tasks => List<Task>.from(_tasks);

  void add(Args args) {
    final desc = args.firstOrNull;
    if (desc == null) throw "No description provided";
    _tasks.add(Task(desc));
  }

  void delete(Args args) {
    final index = args.firstOrNull;
    if (index == null) throw "No id provided";
    final parsedIndex = int.tryParse(index);
    if (parsedIndex == null) throw 'Invalid id';
    _tasks.removeAt(parsedIndex - 1);
  }

  void list(Args args) {
    final status = args.firstOrNull;

    if (status == null) {
      for (var i = 0; i < _tasks.length; i++) {
        final t = _tasks[i];
        print('${i + 1}: ${t.desc} (${t.status.value})');
      }
    } else if (Status.values.map((s) => s.value).toList().contains(status)) {
      final statusEnum = Status.values.firstWhere((s) => s.value == status);
      for (var i = 0; i < _tasks.length; i++) {
        final t = _tasks[i];
        if (t.status == statusEnum) {
          print('${i + 1}: ${t.desc}');
        }
      }
    } else {
      throw "Invalid Status";
    }
  }

  void update(Args args) {
    if (args.length < 2) throw "Not enough arguments for update";
    if (args.length > 2) throw "Too many arguments for update";

    final id = args.firstOrNull;
    final desc = args.lastOrNull;

    if (id == null) throw "No id provided";
    if (desc == null || desc.isEmpty) throw "No description provided";

    final parsedIndex = int.tryParse(id) ?? (throw 'Invalid id');
    final task = _tasks.elementAtOrNull(parsedIndex - 1);

    if (task == null) throw "Task not found";

    task.desc = desc;
    _tasks[parsedIndex - 1] = task;
  }
}
