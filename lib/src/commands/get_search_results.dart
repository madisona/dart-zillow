import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart';
import 'package:xml2json/xml2json.dart';
import 'base_zillow_command.dart';
import 'package:zillow/client.dart';

class GetSearchResultsCommand extends BaseZillowCommand {
  final name = "get_search_results";
  final description = "Gets Search Results\n"
      "https://www.zillow.com/howto/api/GetSearchResults.htm";

  GetSearchResultsCommand() {
    argParser.addOption("address", help: "Address");
    argParser.addOption("citystatezip", help: "City, State Zip");
    argParser.addFlag("rentzestimate",
        negatable: false, help: "Include Rent Zestimate");
  }

  @override
  Future<Null> run() async {
    final Xml2Json myTransformer = new Xml2Json();

    var _client = new Client();
    var zwsid = argResults['zwsid'];
    var address = argResults['address'];
    var citystatezip = argResults['citystatezip'];
    var rentzestimate = argResults['rentzestimate'];
    var zillowClient = new ZillowClient(_client, zwsid);

    var result = await zillowClient.getSearchResults(address, citystatezip,
        rentzestimate: rentzestimate);
    _client.close();
    var j = new JsonEncoder.withIndent("  ");

    print(result.statusCode);
    myTransformer.parse(result.body);
    print("--Badgerfish--");
    print(j.convert(json.decode(myTransformer.toBadgerfish())));
    print("--Gdata--");
    print(j.convert(json.decode(myTransformer.toGData())));
    print("--Parker--");
    print(j.convert(json.decode(myTransformer.toParker())));
//    print(xml.parse(result.body).toXmlString(pretty: true, indent: "  "));
  }
}
