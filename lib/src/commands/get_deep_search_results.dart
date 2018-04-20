import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart';
import 'package:xml2json/xml2json.dart';
import 'base_zillow_command.dart';
import 'package:zillow/client.dart';

class GetDeepSearchResultsCommand extends BaseZillowCommand {
  final name = "get_deep_search_results";
  final description =
      "The GetDeepSearchResults API finds a property for a specified address. "
      "The result set returned contains the full address(s), zpid and "
      "Zestimate data that is provided by the GetSearchResults API. Moreover, "
      "this API call also gives rich property data like lot size, year built, "
      "bath/beds, last sale details etc. \n\n"
      "https://www.zillow.com/howto/api/GetDeepSearchResults.htm";

  GetDeepSearchResultsCommand() {
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

    var result = await zillowClient.getDeepSearchResults(address, citystatezip,
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
