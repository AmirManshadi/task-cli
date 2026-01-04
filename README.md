# task-cli

Tiny Dart CLI for managing tasks stored in a local JSON file.

## Quick start

```bash
dart pub get
dart run bin/task_cli.dart add "Write docs"
dart run bin/task_cli.dart list
```

- Requires Dart SDK 3.10+.
- Data persists to `data.json` in the current working directory; running from another folder creates a different file.
- Task IDs are 1-based list positions (the UUID is internal).

## Usage

```bash
dart run bin/task_cli.dart <command> [args]
```

### Commands

- add: `dart run bin/task_cli.dart add "Do something"`
- list (all or by status):
  - `dart run bin/task_cli.dart list`
  - `dart run bin/task_cli.dart list in-progress`
- update `<id> <new description>`: `dart run bin/task_cli.dart update 2 "New text"`
- mark-in-progress `<id>`: `dart run bin/task_cli.dart mark-in-progress 1`
- mark-done `<id>`: `dart run bin/task_cli.dart mark-done 1`
- delete `<id>`: `dart run bin/task_cli.dart delete 3`

Errors are printed as `Error: ...` and use 1-based IDs; invalid indices throw.

## Development

- Entrypoint and dispatch live in [bin/task_cli.dart](bin/task_cli.dart).
- Core types and logic live in [lib/class](lib/class) and [lib/helpers/parse.dart](lib/helpers/parse.dart).
- Format and lint: `dart format .` then `dart analyze`.
