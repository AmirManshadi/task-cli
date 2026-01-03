typedef Args = List<String?>;

enum Command {
  add('add'),
  update('update'),
  delete('delete'),
  markInProgress('mark-in-progress'),
  markDone('mark-done'),
  list('list'),
  unknown('unknown');

  final String value;
  const Command(this.value);
}

enum Status {
  todo("todo"),
  inProgress("in-progress"),
  done("done");

  final String value;
  const Status(this.value);
}
