import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart';
import 'package:xml2json/xml2json.dart';
import 'base_zillow_command.dart';
import 'package:zillow/client.dart';

class GetDeepComps extends BaseZillowCommand {
  final name = "get_deep_comps";
  final description =
      "The GetDeepComps API returns a list of comparable recent sales for a "
      "specified property. The result set returned contains the address, "
      "Zillow property identifier, and Zestimate for the comparable properties "
      "and the principal property for which the comparables are being retrieved."
      "This API call also returns rich property data for the comparables.\n\n"
      "https://www.zillow.com/howto/api/GetDeepComps.htm";

  GetDeepComps() {
    argParser.addOption("zpid", help: "Zillow Property Id");
    argParser.addOption("count", help: "Comparable Count", defaultsTo: "5");
    argParser.addFlag("rentzestimate",
        negatable: false, help: "Include Rent Zestimate");
  }

  @override
  Future<Null> run() async {
    final Xml2Json myTransformer = new Xml2Json();

    var _client = new Client();
    var zwsid = argResults['zwsid'];
    var zpid = argResults['zpid'];
    var count = argResults['count'];
    var rentzestimate = argResults['rentzestimate'];
    var zillowClient = new ZillowClient(_client, zwsid);

    var result = await zillowClient.getDeepComps(zpid,
        count: count, rentzestimate: rentzestimate);
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
