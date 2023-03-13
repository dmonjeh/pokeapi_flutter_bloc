// To parse this JSON data, do
//
//     final pokeapiResponse = pokeapiResponseFromMap(jsonString);

import 'dart:convert';

class PokeapiResponse {
    PokeapiResponse({
        required this.count,
        this.next,
        this.previous,
        required this.results,
    });

    int count;
    dynamic next;
    dynamic previous;
    List<Result> results;

    factory PokeapiResponse.fromJson(String str) => PokeapiResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PokeapiResponse.fromMap(Map<String, dynamic> json) => PokeapiResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
    };
}

class Result {
    Result({
        required this.name,
        required this.url,
    });

    String name;
    String url;

    factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Result.fromMap(Map<String, dynamic> json) => Result(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
    };
}
