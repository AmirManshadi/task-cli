import 'package:task_cli/types.dart';

void add(Args params) {
  final desc = params.firstOrNull;
  if (desc == null) throw "No description provided";
}
