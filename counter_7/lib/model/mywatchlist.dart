// To parse this JSON data, do
//
//     final myWatchList = myWatchListFromJson(jsonString);

import 'dart:convert';

List<MyWatchList> myWatchListFromJson(String str) => List<MyWatchList>.from(json.decode(str).map((x) => MyWatchList.fromJson(x)));

String myWatchListToJson(List<MyWatchList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyWatchList {
    MyWatchList({
        this.model,
        this.pk,
        this.fields,
    });

    String? model;
    int? pk;
    Fields? fields;

    factory MyWatchList.fromJson(Map<String, dynamic> json) => MyWatchList(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields?.toJson(),
    };
}

class Fields {
    Fields({
        this.watched,
        this.title,
        this.rating,
        this.releaseDate,
        this.review,
    });

    Watched? watched;
    String? title;
    double? rating;
    String? releaseDate;
    String? review;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        watched: watchedValues.map[json["watched"]],
        title: json["title"],
        rating: json["rating"].toDouble(),
        releaseDate: json["release_date"],
        review: json["review"],
    );

    Map<String, dynamic> toJson() => {
        "watched": watchedValues.reverse[watched],
        "title": title,
        "rating": rating,
        "release_date": releaseDate,
        "review": review,
    };
}

enum Watched { TIDAK, IYA }

final watchedValues = EnumValues({
    "Iya": Watched.IYA,
    "Tidak": Watched.TIDAK
});

enum Model { MYWATCHLIST_MYWATCHLIST_ITEM }

final modelValues = EnumValues({
    "mywatchlist.MywatchlistItem": Model.MYWATCHLIST_MYWATCHLIST_ITEM
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}


