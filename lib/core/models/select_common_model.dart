import 'dart:convert';

String lstSelectCommonToJson(List<SelectCommonModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SelectCommonModel {
  int id;
  String title;

  SelectCommonModel({
    required this.id,
    required this.title,
  });

  factory SelectCommonModel.fromJson(Map<String, dynamic> json) =>
      SelectCommonModel(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
      };
}
