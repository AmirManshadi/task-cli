import 'package:task_cli/types.dart';

(Command, Args) parse(Args args) {
  if (args.isEmpty) throw 'No command provided';

  final [commandToken, ...params] = args;

  final command = Command.values.firstWhere(
    (c) => c.value == commandToken,
    orElse: () => Command.unknown,
  );

  if (command == Command.unknown) throw 'Unknown command: $commandToken';

  return (command, params);
}
