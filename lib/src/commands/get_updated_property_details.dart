import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart';
import 'package:xml2json/xml2json.dart';
import 'base_zillow_command.dart';
import 'package:zillow/client.dart';

class GetUpdatedPropertyDetails extends BaseZillowCommand {
  final name = "get_updated_property_details";
  final description = "For a specified property, the GetUpdatedPropertyDetails API returns all of the home facts that have been edited by the home's owner or agent.\n"
      "https://www.zillow.com/howto/api/GetUpdatedPropertyDetails.htm";

  GetUpdatedPropertyDetails() {
    argParser.addOption("zpid", help: "Zillow Property Id");
  }

  @override
  Future<Null> run() async {
    final Xml2Json myTransformer = new Xml2Json();

    var _client = new Client();
    var zwsid = argResults['zwsid'];
    var zpid = argResults['zpid'];
    var zillowClient = new ZillowClient(_client, zwsid);

    var result = await zillowClient.getUpdatedPropertyDetails(zpid);
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
