import 'package:task_cli/types.dart';

void delete(Args args) {
  final id = args.firstOrNull;
  if (id == null) throw "No id provided";
}
