import 'dart:convert';

class EventModel {
  String? eventName;
  String? date;
  EventModel({
    this.eventName,
    this.date,
  });

  EventModel copyWith({
    String? eventName,
    String? date,
  }) {
    return EventModel(
      eventName: eventName ?? this.eventName,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (eventName != null) {
      result.addAll({'eventName': eventName});
    }
    if (date != null) {
      result.addAll({'date': date});
    }

    return result;
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      eventName: map['eventName'],
      date: map['date'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EventModel.fromJson(String source) =>
      EventModel.fromMap(json.decode(source));

  @override
  String toString() => 'FetchDataModel(eventName: $eventName, date: $date)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EventModel &&
        other.eventName == eventName &&
        other.date == date;
  }

  @override
  int get hashCode => eventName.hashCode ^ date.hashCode;
}
