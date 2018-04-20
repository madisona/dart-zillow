// Copyright (c) 2017, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// ignore_for_file: annotate_overrides, hash_and_equals
import 'package:json_annotation/json_annotation.dart';

part 'search_result.g.dart';

/// Highest level object of returned search results.
/// everything below the `SearchResults:searchresults` element
@JsonSerializable()
class SearchResults extends Object with _$SearchResultsSerializerMixin {
  final SearchResultRequest request;
  final Message message;

  final Map<String, dynamic> response;

  ResultItem get result =>
      new ResultItem.fromJson(response['results']['result']);

  SearchResults({this.request, this.message, this.response});

  String toString() => request.address;
  factory SearchResults.fromJson(Map<String, dynamic> json) =>
      _$SearchResultsFromJson(json);
}

/// Represents specific request as passed to Zillow.
@JsonSerializable()
class SearchResultRequest extends Object
    with _$SearchResultRequestSerializerMixin {
  final String address;
  final String citystatezip;

  SearchResultRequest({this.address, this.citystatezip});

  factory SearchResultRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchResultRequestFromJson(json);
}

@JsonSerializable()
class ResultItem extends Object with _$ResultItemSerializerMixin {
  final String zpid;
  final ResultLinks links;
  final Address address;
  final Zestimate zestimate;

  @JsonKey(name: "rentzestimate")
  final Zestimate rentZestimate;

  ResultItem(
      {this.zpid,
      this.links,
      this.address,
      this.zestimate,
      this.rentZestimate});

  factory ResultItem.fromJson(Map<String, dynamic> json) =>
      _$ResultItemFromJson(json);
}

@JsonSerializable()
class ResultLinks extends Object with _$ResultLinksSerializerMixin {
  @JsonKey(name: "homedetails")
  final String homeDetails;
  @JsonKey(name: "graphsanddata")
  final String graphsAndData;
  @JsonKey(name: "mapthishome")
  final String mapThisHome;

  final String comparables;

  ResultLinks(
      {this.homeDetails,
      this.graphsAndData,
      this.mapThisHome,
      this.comparables});

  factory ResultLinks.fromJson(Map<String, dynamic> json) =>
      _$ResultLinksFromJson(json);
}

@JsonSerializable()
class Message extends Object with _$MessageSerializerMixin {
  final String text;
  final String code;

  Message({this.text, this.code});

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}

@JsonSerializable()
class Address extends Object with _$AddressSerializerMixin {
  final String street;

  @JsonKey(name: 'zipcode')
  final String zipCode;
  final String city;
  final String state;

  @JsonKey(name: 'latitude')
  String _latitude;

  @JsonKey(name: 'longitude')
  String _longitude;

  num get latitude => num?.parse(_latitude);
  num get longitude => num?.parse(_longitude);

  Address(
      {this.street, this.zipCode, this.city, this.state, latitude, longitude}) {
    this._latitude = latitude;
    this._longitude = longitude;
  }

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}

@JsonSerializable()
class Zestimate extends Object with _$ZestimateSerializerMixin {
  @JsonKey(name: "amount")
  String _amount;
  num get amount => num?.parse(_amount);

  @JsonKey(name: 'last-updated')
  final String lastUpdated;
  final String valueChange;

  final Map<String, String> valuationRange;
  final String percentile;

  Zestimate(
      {amount,
      this.lastUpdated,
      this.valueChange,
      this.valuationRange,
      this.percentile}) {
    _amount = amount;
  }

  factory Zestimate.fromJson(Map<String, dynamic> json) =>
      _$ZestimateFromJson(json);
}
