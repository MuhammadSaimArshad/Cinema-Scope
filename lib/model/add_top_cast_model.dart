// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class AddTopCastModel {
  String? id;
  String? name;
  List<dynamic>? imageUrls;
  AddTopCastModel({
    this.id,
    this.name,
    this.imageUrls,
  });

  AddTopCastModel copyWith({
    String? id,
    String? name,
    List<dynamic>? imageUrls,
  }) {
    return AddTopCastModel(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrls: imageUrls ?? this.imageUrls,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'imageUrls': imageUrls,
    };
  }

  factory AddTopCastModel.fromMap(Map<String, dynamic> map) {
    return AddTopCastModel(
        id: map['id'] != null ? map['id'] as String : null,
        name: map['name'] != null ? map['name'] as String : null,
        imageUrls: List<dynamic>.from(map['imageUrls']));
  }

  String toJson() => json.encode(toMap());

  factory AddTopCastModel.fromJson(String source) =>
      AddTopCastModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'AddTopCastModel(id: $id, name: $name, imageUrls: $imageUrls)';

  @override
  bool operator ==(covariant AddTopCastModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        listEquals(other.imageUrls, imageUrls);
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ imageUrls.hashCode;
}
