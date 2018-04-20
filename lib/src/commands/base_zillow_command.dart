import 'dart:async';

import 'package:args/command_runner.dart';

abstract class BaseZillowCommand extends Command {
  BaseZillowCommand() {
    argParser.addOption("zws-id", help: "Zillow Web Services Id");
  }
}
