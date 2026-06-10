# Horizon Vert 🌱

**Suivi des plantations d'arbres (Reboisement) — ODD 13**

Application mobile Flutter de suivi des arbres plantés dans le cadre des Journées de l'arbre au Sénégal.

## Fonctionnalités

- 🌳 Ajouter, modifier et supprimer des arbres plantés
- 📍 Regroupement par site de plantation
- 📊 Taux de survie global et par site
- 🎯 Filtre des arbres morts
- 📱 Interface verte et blanche avec accents jaunes

## Les 5 espèces réelles du Sénégal

| Espèce | Nom latin | Lieu de plantation | Source |
|--------|-----------|-------------------|--------|
| Baobab | *Adansonia digitata* | Parc de Hann, Dakar | [Wikipédia](https://fr.wikipedia.org/wiki/Adansonia_digitata) |
| Manguier | *Mangifera indica* | Niayes de Pikine | [Wikipédia](https://fr.wikipedia.org/wiki/Manguier) |
| Fromager | *Ceiba pentandra* | Forêt classée de Mbao | [Wikipédia](https://fr.wikipedia.org/wiki/Ceiba_pentandra) |
| Gmelina | *Gmelina arborea* | Zone ASER Rufisque | [Wikipédia](https://fr.wikipedia.org/wiki/Gmelina_arborea) |
| Acacia | *Acacia senegal* | Ferlo, région de Louga | [Wikipédia](https://fr.wikipedia.org/wiki/Acacia_senegal) |

**Source** : Direction des Parcs Nationaux du Sénégal & programmes ASER  
**Date de collecte** : Juin 2026

## Installation

```bash
flutter pub get
flutter run
```

## Structure

```
lib/
├── main.dart
├── data/tree_species.dart   # 5 espèces + sources
├── models/                  # Modèle ArbrePlante
├── screens/                 # Splash, Liste, Détail, Formulaire, À propos
├── widgets/                 # Composants réutilisables
└── services/                # Service CRUD (Singleton)
```

## Auteur

**Adji Mariama Ngom** — ESMT DAR26
