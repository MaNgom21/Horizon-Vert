import 'package:flutter/foundation.dart';

class ArbrePlante {
  final String id;
  final String espece;
  final String site;
  final DateTime datePlantation;
  final String planteur;
  bool vivant;

  ArbrePlante({
    required this.id,
    required this.espece,
    required this.site,
    required this.datePlantation,
    required this.planteur,
    this.vivant = true,
  });

  ArbrePlante copyWith({
    String? id,
    String? espece,
    String? site,
    DateTime? datePlantation,
    String? planteur,
    bool? vivant,
  }) {
    return ArbrePlante(
      id: id ?? this.id,
      espece: espece ?? this.espece,
      site: site ?? this.site,
      datePlantation: datePlantation ?? this.datePlantation,
      planteur: planteur ?? this.planteur,
      vivant: vivant ?? this.vivant,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'espece': espece,
      'site': site,
      'datePlantation': datePlantation.toIso8601String(),
      'planteur': planteur,
      'vivant': vivant,
    };
  }

  factory ArbrePlante.fromMap(Map<String, dynamic> map) {
    return ArbrePlante(
      id: map['id'] as String,
      espece: map['espece'] as String,
      site: map['site'] as String,
      datePlantation: DateTime.parse(map['datePlantation'] as String),
      planteur: map['planteur'] as String,
      vivant: map['vivant'] as bool,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArbrePlante &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'ArbrePlante(id: $id, espece: $espece, site: $site, vivant: $vivant)';
  }
}
