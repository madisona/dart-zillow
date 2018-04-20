#!/usr/bin/env dart
// A command line application for working with Zillow Web Services

import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:zillow_api/commands.dart';

main(List<String> arguments) {
  new CommandRunner(
      "zillow", "A Command Line Interface for accessing Zillow Web Services.")
    ..addCommand(new GetSearchResultsCommand())
    ..run(arguments).catchError((error) {
      if (error is FileSystemException) {
        print(error);
        exit(1);
      } else if (error is! UsageException) throw error;
      print(error);
      exit(64); // Exit code 64 indicates a usage error.
    });
}
