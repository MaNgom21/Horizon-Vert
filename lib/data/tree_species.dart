import 'package:flutter/material.dart';

class EspeceArbre {
  final String nom;
  final String nomLatin;
  final Color couleur;
  final IconData icone;
  final String description;

  const EspeceArbre({
    required this.nom,
    required this.nomLatin,
    required this.couleur,
    required this.icone,
    required this.description,
  });
}

const especesArbres = [
  EspeceArbre(
    nom: 'Baobab',
    nomLatin: 'Adansonia digitata',
    couleur: Color(0xFF795548),
    icone: Icons.eco,
    description: 'Arbre emblématique du Sénégal, pouvant vivre plus de 1000 ans',
  ),
  EspeceArbre(
    nom: 'Manguier',
    nomLatin: 'Mangifera indica',
    couleur: Color(0xFFFF8F00),
    icone: Icons.emoji_nature,
    description: 'Arbre fruitier très répandu, ombrage et production de mangues',
  ),
  EspeceArbre(
    nom: 'Fromager',
    nomLatin: 'Ceiba pentandra',
    couleur: Color(0xFF4E342E),
    icone: Icons.forest,
    description: 'Arbre géant sacré, peut atteindre 70 m de haut',
  ),
  EspeceArbre(
    nom: 'Gmelina',
    nomLatin: 'Gmelina arborea',
    couleur: Color(0xFF558B2F),
    icone: Icons.park,
    description: 'Essence à croissance rapide pour le reboisement et le bois d\'œuvre',
  ),
  EspeceArbre(
    nom: 'Eucalyptus',
    nomLatin: 'Eucalyptus camaldulensis',
    couleur: Color(0xFF78909C),
    icone: Icons.nature,
    description: 'Arbre résistant à la sécheresse, utilisé en foresterie',
  ),
  EspeceArbre(
    nom: 'Acacia',
    nomLatin: 'Acacia senegal',
    couleur: Color(0xFFA1887F),
    icone: Icons.grass,
    description: 'Produit la gomme arabique, ressource économique majeure',
  ),
  EspeceArbre(
    nom: 'Neem',
    nomLatin: 'Azadirachta indica',
    couleur: Color(0xFF33691E),
    icone: Icons.healing,
    description: 'Arbre médicinal aux propriétés antiseptiques reconnues',
  ),
  EspeceArbre(
    nom: 'Palmier à huile',
    nomLatin: 'Elaeis guineensis',
    couleur: Color(0xFFBF360C),
    icone: Icons.flutter_dash,
    description: 'Culture oléagineuse traditionnelle en Casamance',
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
