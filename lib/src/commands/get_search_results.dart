import 'dart:async';

import 'base_zillow_command.dart';

class GetSearchResultsCommand extends BaseZillowCommand {
  final name = "get_search_results";
  final description = "Gets Search Results\n"
      "https://www.zillow.com/howto/api/GetSearchResults.htm";

  @override
  Future<Null> run() async {
    print("search it");
  }
}
