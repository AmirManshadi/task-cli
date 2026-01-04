import 'dart:io';

import 'package:task_cli/class/manager.dart';
import 'package:task_cli/helpers/parse.dart';
import 'package:task_cli/class/store.dart';
import 'package:task_cli/types.dart';
import 'package:path/path.dart' show absolute;

final filePath = absolute('data.json');

void main(Args args) async {
  try {
    final (command, params) = parse(args);

    if (!File(filePath).existsSync()) {
      File(filePath).writeAsStringSync('[]');
    }

    final jsonData = File(filePath).readAsStringSync();
    final store = Store.fromJson(jsonData);
    final app = Manager(store.tasks);

    switch (command) {
      case Command.add:
        app.add(params);
      case Command.delete:
        app.delete(params);
      case Command.list:
        app.list(params);
      case Command.markInProgress:
        app.mark(Status.inProgress, params);
      case Command.markDone:
        app.mark(Status.done, params);
      case Command.update:
        app.update(params);
      case Command.unknown:
        throw 'Unknown command';
    }

    final updatedTasks = app.tasks;
    final output = Store.fromData(updatedTasks).json;
    File(filePath).writeAsStringSync(output);
  } catch (e) {
    print('Error: $e');
  }
}
