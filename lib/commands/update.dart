import 'package:task_cli/types.dart';

void update(Args args) {
  if (args.length < 2) throw "Not enough arguments for update";
  if (args.length > 2) throw "Too many arguments for update";
  final id = args.firstOrNull;
  final desc = args.lastOrNull;
  if (id == null) throw "No id provided";
  if (desc == null || desc == '') throw "No description provided";
}
