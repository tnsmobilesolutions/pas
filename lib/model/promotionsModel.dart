import 'dart:convert';

class PromotionsModel {
  int? id;
  String? title;
  String? webURL;
  PromotionsModel({
    this.id,
    this.title,
    this.webURL,
  });

  PromotionsModel copyWith({
    int? id,
    String? title,
    String? webURL,
  }) {
    return PromotionsModel(
      id: id ?? this.id,
      title: title ?? this.title,
      webURL: webURL ?? this.webURL,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (title != null) {
      result.addAll({'title': title});
    }
    if (webURL != null) {
      result.addAll({'webURL': webURL});
    }

    return result;
  }

  factory PromotionsModel.fromMap(Map<String, dynamic> map) {
    return PromotionsModel(
      id: map['id']?.toInt(),
      title: map['title'],
      webURL: map['webURL'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PromotionsModel.fromJson(String source) =>
      PromotionsModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'PromotionsModel(id: $id, title: $title, webURL: $webURL)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PromotionsModel &&
        other.id == id &&
        other.title == title &&
        other.webURL == webURL;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ webURL.hashCode;
}
