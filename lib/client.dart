import 'dart:async' show Future;
import 'package:http/http.dart' as http;

String encodeMap(Map data) {
  return data.keys
      .map((key) =>
          "${Uri.encodeComponent(key)}=${Uri.encodeComponent(data[key])}")
      .join("&");
}

class ZillowClient {
  http.BaseClient _client;
  String _zwsid;
  String apiUrl = "http://www.zillow.com/webservice";

  /// [_client] should be an [http.Client] on the server side
  /// or [browser_client.BrowserClient] on the browser.
  ZillowClient(this._client, this._zwsid);

  Future<http.Response> getSearchResults(String address, String citystatezip,
      {bool rentzestimate: false}) {
    var data = encodeMap({
      "zws-id": _zwsid,
      "address": address,
      "citystatezip": citystatezip,
      "rentzestimate": rentzestimate.toString(),
    });

    var url = "$apiUrl/GetSearchResults.htm?$data";
    return _client.get(url);
  }

  Future<http.Response> getDeepSearchResults(
      String address, String citystatezip,
      {bool rentzestimate: false}) {
    var data = encodeMap({
      "zws-id": _zwsid,
      "address": address,
      "citystatezip": citystatezip,
      "rentzestimate": rentzestimate.toString(),
    });

    var url = "$apiUrl/GetDeepSearchResults.htm?$data";
    return _client.get(url);
  }

  Future<http.Response> getDeepComps(int zpid,
      {int count: 5, bool rentzestimate: false}) {
    assert(1 <= count && count <=25, "Comparable count must be between 1 and 25");
    var data = encodeMap({
      "zws-id": _zwsid,
      "zpid": zpid,
      "count": count,
      "rentzestimate": rentzestimate.toString(),
    });

    var url = "$apiUrl/GetDeepComps.htm?$data";
    return _client.get(url);
  }

  /// [zpid] is the Zillow Property Id
  /// https://www.zillow.com/howto/api/GetUpdatedPropertyDetails.htm
  Future<http.Response> getUpdatedPropertyDetails(int zpid) {
    var data = encodeMap({
      "zws-id": _zwsid,
      "zpid": zpid,
    });

    var url = "$apiUrl/GetUpdatedPropertyDetails.htm?$data";
    return _client.get(url);
  }

//  // fetchResponse executes the call and fetches the response
//  // for a GET request, data should be in the endpoint via the query string
//  // if data is present, it should be a string-ified payload at this point.
//  Future<http.Response> fetchResponse(String endpoint,
//      {String method: 'GET',
//        String contentType: "application/json",
//        String data: "",
//        Map headers,
//        bool closeConnection: true}) async {
//    var request = new http.Request(method, Uri.parse(endpoint));
//
//    var _headers = headers == null ? {} : headers;
//    _headers.putIfAbsent("content-type", () => contentType);
//    _headers.forEach((name, value) {
//      request.headers[name] = value;
//    });
//
//    request.bodyBytes = utf8.encode(data);
//
//    var response = await http.Response.fromStream(await _client.send(request));
//
//    if (closeConnection == true) {
//      closeHttpConnection();
//    }
//
//    return response;
//  }
//
//  void closeHttpConnection() {
//    _client.close();
//  }
}

bool isSuccess(http.Response response) => (response.statusCode ~/ 100 == 2);
