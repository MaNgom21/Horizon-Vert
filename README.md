# Horizon Vert 🌱

**Suivi des plantations d'arbres (Reboisement) — ODD 13**

Application mobile Flutter de suivi des arbres plantés dans le cadre des Journées de l'arbre au Sénégal.

## Fonctionnalités

- 🌳 Ajouter, modifier et supprimer des arbres plantés
- 📍 Regroupement par site de plantation
- 📊 Taux de survie global et par site
- 🎯 Filtre des arbres morts
- 📱 Interface verte et blanche avec accents jaunes

## Captures d'écran

> À venir

## Installation

```bash
flutter pub get
flutter run
```

## Structure

```
lib/
├── main.dart
├── models/        # Modèle ArbrePlante
├── screens/        # 4 écrans (Splash, Liste, Détail, Formulaire)
├── widgets/        # Composants réutilisables
└── services/       # Service CRUD (Singleton)
```

## Espèces réelles du Sénégal

| Espèce | Nom latin | Icône |
|--------|-----------|-------|
| Baobab | *Adansonia digitata* | 🪴 |
| Manguier | *Mangifera indica* | 🌿 |
| Fromager | *Ceiba pentandra* | 🌳 |
| Gmelina | *Gmelina arborea* | 🌲 |
| Eucalyptus | *Eucalyptus camaldulensis* | 🌱 |
| Acacia | *Acacia senegal* | 🌾 |
| Neem | *Azadirachta indica* | 🍃 |
| Palmier à huile | *Elaeis guineensis* | 🌴 |

**Source des données** : Direction des Parcs Nationaux du Sénégal & ASER  
**Date de collecte** : Juin 2026

## Auteur

**Adji Mariama Ngom** — ESMT DAR26
