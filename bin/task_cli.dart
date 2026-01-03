import 'dart:io';

import 'package:task_cli/parse.dart';
import 'package:task_cli/commands/add.dart';
import 'package:task_cli/commands/delete.dart';
import 'package:task_cli/commands/list.dart';
import 'package:task_cli/commands/mark.dart';
import 'package:task_cli/commands/update.dart';
import 'package:task_cli/store.dart';
import 'package:task_cli/types.dart';
import 'package:path/path.dart' show absolute;

void main(Args args) async {
  try {
    final dataFilePath = absolute('data.json');
    print(dataFilePath);

    if (!File(dataFilePath).existsSync()) {
      File(dataFilePath).writeAsStringSync('[]');
    }

    final stringData = File(dataFilePath).readAsStringSync();
    print(stringData);

    print("-----------------------");

    final data = Store(stringData).jsonData;
    print(data);

    final (command, params) = parse(args);
    print(command);
    print(params);

    switch (command) {
      case Command.add:
        add(params);
      case Command.delete:
        delete(params);
      case Command.list:
        list(params);
      case Command.markInProgress:
        mark(Status.inProgress, params);
      case Command.markDone:
        mark(Status.done, params);
      case Command.update:
        update(params);
      case Command.unknown:
        throw 'Unknown command';
    }
  } catch (e) {
    print('Error: $e');
  }
}
