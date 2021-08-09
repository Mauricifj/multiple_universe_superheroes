import 'dart:convert';

import 'package:multiple_universe_superheroes/app/modules/search/domain/entities/super_hero.dart';

class SuperHeroModel extends SuperHero {
  final int id;
  final String codeName;
  final String name;
  final String gender;
  final String occupation;
  final String image;
  final String thumbnail;

  const SuperHeroModel({
    required this.id,
    required this.codeName,
    required this.name,
    required this.gender,
    required this.occupation,
    required this.image,
    required this.thumbnail,
  }) : super(
          codeName: codeName,
          name: name,
          gender: gender,
          occupation: occupation,
          image: image,
          thumbnail: thumbnail,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id.toString(),
      'codeName': codeName,
      'name': name,
      'gender': gender,
      'occupation': occupation,
      'image': image,
      'thumbnail': thumbnail,
    };
  }

  factory SuperHeroModel.fromMap(Map<String, dynamic> map) {
    return SuperHeroModel(
      id: map['id'],
      codeName: map['name'],
      name: map['biography']['fullName'],
      gender: map['appearance']['gender'],
      occupation: map['work']['occupation'],
      image: map['images']['lg'],
      thumbnail: map['images']['xs'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SuperHeroModel.fromJson(String source) => SuperHeroModel.fromMap(json.decode(source));
}
