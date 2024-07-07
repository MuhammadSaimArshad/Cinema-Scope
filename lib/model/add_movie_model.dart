// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class AddMovieModel {
  String? release;
  String? description;
  String? id;
  String? name;
  List<dynamic>? imageUrls;
  AddMovieModel({
    this.release,
    this.description,
    this.id,
    this.name,
    this.imageUrls,
  });

  AddMovieModel copyWith({
    String? release,
    String? description,
    String? id,
    String? name,
    List<dynamic>? imageUrls,
  }) {
    return AddMovieModel(
      release: release ?? this.release,
      description: description ?? this.description,
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrls: imageUrls ?? this.imageUrls,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'release': release,
      'description': description,
      'id': id,
      'name': name,
      'imageUrls': imageUrls,
    };
  }

  factory AddMovieModel.fromMap(Map<String, dynamic> map) {
    return AddMovieModel(
      release: map['release'] != null ? map['release'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      imageUrls: List<dynamic>.from(map['imageUrls']),
    );
  }

  String toJson() => json.encode(toMap());

  factory AddMovieModel.fromJson(String source) =>
      AddMovieModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddMovieModel(release: $release, description: $description, id: $id, name: $name, imageUrls: $imageUrls)';
  }

  @override
  bool operator ==(covariant AddMovieModel other) {
    if (identical(this, other)) return true;

    return other.release == release &&
        other.description == description &&
        other.id == id &&
        other.name == name &&
        listEquals(other.imageUrls, imageUrls);
  }

  @override
  int get hashCode {
    return release.hashCode ^
        description.hashCode ^
        id.hashCode ^
        name.hashCode ^
        imageUrls.hashCode;
  }
}
