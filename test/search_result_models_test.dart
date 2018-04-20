import 'dart:convert';
import 'package:test/test.dart';

import 'package:zillow/src/models.dart';
import 'search_result_sample.dart' show resultData;

SearchResults getSearchResult() {
  return new SearchResults.fromJson(json.decode(resultData)['SearchResults:searchresults']);
}

main() {
  group("SearchResult tests", () {
    test('turns json to object', () {
      var result = getSearchResult();
      var initialData = json.decode(resultData)['SearchResults:searchresults'];
      print(new JsonEncoder.withIndent("  ").convert(result));
      // request data
      expect(result.request.address, equals(initialData['request']['address']));
      expect(result.request.citystatezip,
          equals(initialData['request']['citystatezip']));

      // message data
      expect(result.message.text, equals(initialData['message']['text']));
      expect(result.message.code, equals(initialData['message']['code']));

      // response data
      var resultLevel = initialData['response']['results']['result'];
      expect(result.result.zpid, equals(resultLevel['zpid']));

      expect(result.result.links.homeDetails, equals(resultLevel['links']['homedetails']));
      expect(result.result.links.graphsAndData, equals(resultLevel['links']['graphsanddata']));
      expect(result.result.links.mapThisHome, equals(resultLevel['links']['mapthishome']));
      expect(result.result.links.comparables, equals(resultLevel['links']['comparables']));

      expect(result.result.address.street, equals(resultLevel['address']['street']));
      expect(result.result.address.zipCode, equals(resultLevel['address']['zipcode']));
      expect(result.result.address.city, equals(resultLevel['address']['city']));
      expect(result.result.address.state, equals(resultLevel['address']['state']));
      expect(result.result.address.latitude, equals(num.parse(resultLevel['address']['latitude'])));
      expect(result.result.address.longitude, equals(num.parse(resultLevel['address']['longitude'])));

      expect(result.result.zestimate.amount, equals(num.parse(resultLevel['zestimate']['amount'])));
      expect(result.result.zestimate.lastUpdated, equals(resultLevel['zestimate']['last-updated']));
      expect(result.result.zestimate.valueChange, equals(resultLevel['zestimate']['valueChange']));
      expect(result.result.zestimate.valuationRange, equals(resultLevel['zestimate']['valuationRange']));
      expect(result.result.zestimate.percentile, equals(resultLevel['zestimate']['percentile']));

      expect(result.result.rentZestimate.amount, equals(num.parse(resultLevel['rentzestimate']['amount'])));
      expect(result.result.rentZestimate.lastUpdated, equals(resultLevel['rentzestimate']['last-updated']));
      expect(result.result.rentZestimate.valueChange, equals(resultLevel['rentzestimate']['valueChange']));
      expect(result.result.rentZestimate.valuationRange, equals(resultLevel['rentzestimate']['valuationRange']));
      expect(result.result.rentZestimate.percentile, equals(null));
    });

    test('uses rational to string', () {
      var result = getSearchResult();
      expect(result.toString(), equals(result.request.address));
    });
  });
}
