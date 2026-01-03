import 'package:task_cli/types.dart';

void list(Args args) {
  final status = args.firstOrNull;
  if (status == null) {
    print('all');
    return;
  }
}
