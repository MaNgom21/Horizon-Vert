# Étape 1 : Planification & Architecture

## Structure du projet

```
reboisement_app/
├── lib/
│   ├── main.dart                  # Point d'entrée + thème
│   ├── models/
│   │   └── arbre_plante.dart      # Modèle de données
│   ├── screens/
│   │   ├── liste_arbres_screen.dart
│   │   ├── detail_site_screen.dart
│   │   └── formulaire_arbre_screen.dart
│   ├── widgets/
│   │   ├── carte_arbre_widget.dart
│   │   └── statistiques_widget.dart
│   └── services/
│       └── arbre_service.dart     # Gestionnaire des données (CRUD)
├── docs/
│   ├── 01-planification.md        ← Vous êtes ici
│   ├── 02-modele.md
│   ├── 03-liste-ecran.md
│   ├── 04-detail-ecran.md
│   ├── 05-formulaire-ecran.md
│   └── 06-logique-metier.md
├── assets/                        # (images, icônes si besoin)
├── test/
├── pubspec.yaml
```

## Architecture choisie

- **Sans package externe** (pas de provider, pas de go_router)
- **State management** : `StatefulWidget` avec `setState` (conforme au sujet)
- **Navigation** : `Navigator.push` avec passage d'arguments
- **Stockage** : Liste en mémoire (service singleton)
- **Validation** : Champs obligatoires, dates valides

## Palette de couleurs

| Rôle | Couleur | Code Hex |
|------|---------|----------|
| Primaire | Vert forêt | `#2E7D32` |
| Secondaire | Vert clair | `#A5D6A7` |
| Fond | Blanc cassé | `#F5F5F5` |
| Surface | Blanc pur | `#FFFFFF` |
| Accent | Jaune doré | `#FFC107` |
| Texte principal | Vert foncé | `#1B5E20` |
| Texte secondaire | Gris | `#757575` |
| Erreur / Mort | Rouge | `#E53935` |
| Succès / Vivant | Vert | `#43A047` |

## Arborescence de navigation

```
ListeArbresScreen
    │
    ├── [Appui sur +] → FormulaireArbreScreen (création)
    ├── [Appui long ou icône poubelle] → Suppression (confirmation Dialog)
    └── [Appui sur un site dans le regroupement] → DetailSiteScreen (site passé en argument)
                              │
                              └── [Appui +] → FormulaireArbreScreen (avec site pré-rempli)
```

## Fonctionnalités clés (cahier des charges)

1. CRUD complet (création avec validation, suppression avec confirmation)
2. Taux de survie = arbres vivants / total
3. Nombre d'arbres par site (affiché dans DetailSiteScreen)
4. Filtre : arbres morts
5. Navigation avec passage d'argument : le site est passé à l'écran de détail
