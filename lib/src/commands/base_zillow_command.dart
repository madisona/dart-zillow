
import 'package:args/command_runner.dart';

abstract class BaseZillowCommand extends Command {
  BaseZillowCommand() {
    argParser.addOption("zwsid", help: "Zillow Web Services Id");
  }
}
