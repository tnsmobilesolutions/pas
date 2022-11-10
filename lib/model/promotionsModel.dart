import 'dart:convert';

class PromotionsModel {
  int? id;
  String? title;
  String? weburl;
  PromotionsModel({
    this.id,
    this.title,
    this.weburl,
  });

  PromotionsModel copyWith({
    int? id,
    String? title,
    String? weburl,
  }) {
    return PromotionsModel(
      id: id ?? this.id,
      title: title ?? this.title,
      weburl: weburl ?? this.weburl,
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
    if (weburl != null) {
      result.addAll({'weburl': weburl});
    }

    return result;
  }

  factory PromotionsModel.fromMap(Map<String, dynamic> map) {
    return PromotionsModel(
      id: map['id']?.toInt(),
      title: map['title'],
      weburl: map['weburl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PromotionsModel.fromJson(String source) =>
      PromotionsModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'PromotionsModel(id: $id, title: $title, weburl: $weburl)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PromotionsModel &&
        other.id == id &&
        other.title == title &&
        other.weburl == weburl;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ weburl.hashCode;
}
