// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

SearchResults _$SearchResultsFromJson(Map<String, dynamic> json) =>
    new SearchResults(
        request: json['request'] == null
            ? null
            : new SearchResultRequest.fromJson(
                json['request'] as Map<String, dynamic>),
        message: json['message'] == null
            ? null
            : new Message.fromJson(json['message'] as Map<String, dynamic>),
        response: json['response'] as Map<String, dynamic>);

abstract class _$SearchResultsSerializerMixin {
  SearchResultRequest get request;
  Message get message;
  Map<String, dynamic> get response;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'request': request,
        'message': message,
        'response': response
      };
}

SearchResultRequest _$SearchResultRequestFromJson(Map<String, dynamic> json) =>
    new SearchResultRequest(
        address: json['address'] as String,
        citystatezip: json['citystatezip'] as String);

abstract class _$SearchResultRequestSerializerMixin {
  String get address;
  String get citystatezip;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'address': address, 'citystatezip': citystatezip};
}

ResultItem _$ResultItemFromJson(Map<String, dynamic> json) => new ResultItem(
    zpid: json['zpid'] as String,
    links: json['links'] == null
        ? null
        : new ResultLinks.fromJson(json['links'] as Map<String, dynamic>),
    address: json['address'] == null
        ? null
        : new Address.fromJson(json['address'] as Map<String, dynamic>),
    zestimate: json['zestimate'] == null
        ? null
        : new Zestimate.fromJson(json['zestimate'] as Map<String, dynamic>),
    rentZestimate: json['rentzestimate'] == null
        ? null
        : new Zestimate.fromJson(
            json['rentzestimate'] as Map<String, dynamic>));

abstract class _$ResultItemSerializerMixin {
  String get zpid;
  ResultLinks get links;
  Address get address;
  Zestimate get zestimate;
  Zestimate get rentZestimate;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'zpid': zpid,
        'links': links,
        'address': address,
        'zestimate': zestimate,
        'rentzestimate': rentZestimate
      };
}

ResultLinks _$ResultLinksFromJson(Map<String, dynamic> json) => new ResultLinks(
    homeDetails: json['homedetails'] as String,
    graphsAndData: json['graphsanddata'] as String,
    mapThisHome: json['mapthishome'] as String,
    comparables: json['comparables'] as String);

abstract class _$ResultLinksSerializerMixin {
  String get homeDetails;
  String get graphsAndData;
  String get mapThisHome;
  String get comparables;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'homedetails': homeDetails,
        'graphsanddata': graphsAndData,
        'mapthishome': mapThisHome,
        'comparables': comparables
      };
}

Message _$MessageFromJson(Map<String, dynamic> json) =>
    new Message(text: json['text'] as String, code: json['code'] as String);

abstract class _$MessageSerializerMixin {
  String get text;
  String get code;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'text': text, 'code': code};
}

Address _$AddressFromJson(Map<String, dynamic> json) => new Address(
    street: json['street'] as String,
    zipCode: json['zipcode'] as String,
    city: json['city'] as String,
    state: json['state'] as String,
    latitude: json['latitude'],
    longitude: json['longitude']);

abstract class _$AddressSerializerMixin {
  String get street;
  String get zipCode;
  String get city;
  String get state;
  num get latitude;
  num get longitude;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'street': street,
        'zipcode': zipCode,
        'city': city,
        'state': state,
        'latitude': latitude,
        'longitude': longitude
      };
}

Zestimate _$ZestimateFromJson(Map<String, dynamic> json) => new Zestimate(
    amount: json['amount'],
    lastUpdated: json['last-updated'] as String,
    valueChange: json['valueChange'] as String,
    valuationRange: json['valuationRange'] == null
        ? null
        : new Map<String, String>.from(json['valuationRange'] as Map),
    percentile: json['percentile'] as String);

abstract class _$ZestimateSerializerMixin {
  num get amount;
  String get lastUpdated;
  String get valueChange;
  Map<String, String> get valuationRange;
  String get percentile;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'amount': amount,
        'last-updated': lastUpdated,
        'valueChange': valueChange,
        'valuationRange': valuationRange,
        'percentile': percentile
      };
}
