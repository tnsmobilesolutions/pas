import 'dart:convert';
import 'dart:core';

class CompleteProfileModel {
  final String? bloodgroup;
  final String? sangha;
  final String? city;
  final String? proffesion;
  final String? uid;
  CompleteProfileModel({
    this.bloodgroup,
    this.sangha,
    this.city,
    this.proffesion,
    this.uid,
  });

  CompleteProfileModel copyWith({
    String? bloodgroup,
    String? sangha,
    String? city,
    String? proffesion,
    String? uid,
  }) {
    return CompleteProfileModel(
      bloodgroup: bloodgroup ?? this.bloodgroup,
      sangha: sangha ?? this.sangha,
      city: city ?? this.city,
      proffesion: proffesion ?? this.proffesion,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (bloodgroup != null) {
      result.addAll({'bloodgroup': bloodgroup});
    }
    if (sangha != null) {
      result.addAll({'sangha': sangha});
    }
    if (city != null) {
      result.addAll({'city': city});
    }
    if (proffesion != null) {
      result.addAll({'proffesion': proffesion});
    }
    if (uid != null) {
      result.addAll({'uid': uid});
    }

    return result;
  }

  factory CompleteProfileModel.fromMap(Map<String, dynamic> map) {
    return CompleteProfileModel(
      bloodgroup: map['bloodgroup'],
      sangha: map['sangha'],
      city: map['city'],
      proffesion: map['proffesion'],
      uid: map['uid'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CompleteProfileModel.fromJson(String source) =>
      CompleteProfileModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CompleteProfileModel(bloodgroup: $bloodgroup, sangha: $sangha, city: $city, proffesion: $proffesion, uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CompleteProfileModel &&
        other.bloodgroup == bloodgroup &&
        other.sangha == sangha &&
        other.city == city &&
        other.proffesion == proffesion &&
        other.uid == uid;
  }

  @override
  int get hashCode {
    return bloodgroup.hashCode ^
        sangha.hashCode ^
        city.hashCode ^
        proffesion.hashCode ^
        uid.hashCode;
  }
}
