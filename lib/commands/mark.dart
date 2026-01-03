import 'package:task_cli/types.dart';

void mark(Status status, Args args) {
  final id = args.firstOrNull;
  if (id == null) throw "No id provided";
}
