String parseArgs(List<String> args) {
  final commandList = args.map((arg) => arg.replaceAll(' ', '\\ ')).toList();
  return commandList.join(' ');
}
