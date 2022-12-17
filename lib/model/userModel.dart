import 'dart:convert';

class userModel {
  String? name;
  String? email;
  String? phoneNumber;
  String? userId;
  String? bloodgroup;
  String? sangha;
  String? city;
  String? proffesion;
  String? uid;
  String? profilepicURL;
  String? birthPlace;

  userModel({
    this.name,
    this.email,
    this.phoneNumber,
    this.userId,
    this.bloodgroup,
    this.sangha,
    this.city,
    this.proffesion,
    this.uid,
    this.profilepicURL,
    this.birthPlace,
  });

  userModel copyWith({
    String? name,
    String? email,
    String? phoneNumber,
    String? userId,
    String? bloodgroup,
    String? sangha,
    String? city,
    String? proffesion,
    String? uid,
    String? profilepicURL,
    String? birthPlace,
  }) {
    return userModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      userId: userId ?? this.userId,
      bloodgroup: bloodgroup ?? this.bloodgroup,
      sangha: sangha ?? this.sangha,
      city: city ?? this.city,
      proffesion: proffesion ?? this.proffesion,
      uid: uid ?? this.uid,
      profilepicURL: profilepicURL ?? this.profilepicURL,
      birthPlace: birthPlace ?? this.birthPlace,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (name != null) {
      result.addAll({'name': name});
    }
    if (email != null) {
      result.addAll({'email': email});
    }
    if (phoneNumber != null) {
      result.addAll({'phoneNumber': phoneNumber});
    }
    if (userId != null) {
      result.addAll({'userId': userId});
    }
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
    if (profilepicURL != null) {
      result.addAll({'profilepicURL': profilepicURL});
    }
    if (birthPlace != null) {
      result.addAll({'birthPlace': birthPlace});
    }

    return result;
  }

  factory userModel.fromMap(Map<String, dynamic> map) {
    return userModel(
      name: map['name'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      userId: map['userId'],
      bloodgroup: map['bloodgroup'],
      sangha: map['sangha'],
      city: map['city'],
      proffesion: map['proffesion'],
      uid: map['uid'],
      profilepicURL: map['profilepicURL'],
      birthPlace: map['birthPlace'],
    );
  }

  String toJson() => json.encode(toMap());

  factory userModel.fromJson(String source) =>
      userModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'userModel(name: $name, email: $email, phoneNumber: $phoneNumber, userId: $userId, bloodgroup: $bloodgroup, sangha: $sangha, city: $city, proffesion: $proffesion, uid: $uid, profilepicURL: $profilepicURL, birthPlace: $birthPlace)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is userModel &&
        other.name == name &&
        other.email == email &&
        other.phoneNumber == phoneNumber &&
        other.userId == userId &&
        other.bloodgroup == bloodgroup &&
        other.sangha == sangha &&
        other.city == city &&
        other.proffesion == proffesion &&
        other.uid == uid &&
        other.profilepicURL == profilepicURL &&
        other.birthPlace == birthPlace;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        phoneNumber.hashCode ^
        userId.hashCode ^
        bloodgroup.hashCode ^
        sangha.hashCode ^
        city.hashCode ^
        proffesion.hashCode ^
        uid.hashCode ^
        profilepicURL.hashCode ^
        birthPlace.hashCode;
  }
}
