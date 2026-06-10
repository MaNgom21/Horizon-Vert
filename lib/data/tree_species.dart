import 'package:flutter/material.dart';

class EspeceArbre {
  final String nom;
  final String nomLatin;
  final Color couleur;
  final IconData icone;
  final String description;
  final String lieuxPlantation;
  final String source;

  const EspeceArbre({
    required this.nom,
    required this.nomLatin,
    required this.couleur,
    required this.icone,
    required this.description,
    required this.lieuxPlantation,
    required this.source,
  });
}

const especesArbres = [
  EspeceArbre(
    nom: 'Baobab',
    nomLatin: 'Adansonia digitata',
    couleur: Color(0xFF795548),
    icone: Icons.eco,
    description: 'Arbre emblématique du Sénégal, peut vivre plus de 1000 ans',
    lieuxPlantation: 'Parc de Hann (Dakar), Réserve de Bandia, Forêt de Téïssé',
    source: 'https://fr.wikipedia.org/wiki/Adansonia_digitata',
  ),
  EspeceArbre(
    nom: 'Manguier',
    nomLatin: 'Mangifera indica',
    couleur: Color(0xFFFF8F00),
    icone: Icons.emoji_nature,
    description: 'Arbre fruitier très répandu dans les Niayes, production de mangues',
    lieuxPlantation: 'Niayes de Pikine, Zone des Niayes (Thiès), Malika',
    source: 'https://fr.wikipedia.org/wiki/Manguier',
  ),
  EspeceArbre(
    nom: 'Fromager',
    nomLatin: 'Ceiba pentandra',
    couleur: Color(0xFF4E342E),
    icone: Icons.forest,
    description: 'Arbre géant sacré en Casamance, peut atteindre 70 m de haut',
    lieuxPlantation: 'Basse-Casamance, Parc national de Niokolo-Koba, Forêt classée de Mbao',
    source: 'https://fr.wikipedia.org/wiki/Ceiba_pentandra',
  ),
  EspeceArbre(
    nom: 'Gmelina',
    nomLatin: 'Gmelina arborea',
    couleur: Color(0xFF558B2F),
    icone: Icons.park,
    description: 'Essence à croissance rapide utilisée par l\'ASER pour le reboisement',
    lieuxPlantation: 'Zones ASER (Rufisque, Sangalkam, Dagoudane)',
    source: 'https://fr.wikipedia.org/wiki/Gmelina_arborea',
  ),
  EspeceArbre(
    nom: 'Acacia',
    nomLatin: 'Acacia senegal',
    couleur: Color(0xFFA1887F),
    icone: Icons.grass,
    description: 'Produit la gomme arabique, 2e produit d\'exportation du Sénégal',
    lieuxPlantation: 'Ferlo, Région de Louga, Zone sylvo-pastorale du Sahel',
    source: 'https://fr.wikipedia.org/wiki/Acacia_senegal',
  ),
];

EspeceArbre? trouverEspece(String nom) {
  try {
    return especesArbres.firstWhere(
      (e) => e.nom.toLowerCase() == nom.toLowerCase(),
    );
  } catch (_) {
    return null;
  }
}
