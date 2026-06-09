# Étape 5 : Écran Formulaire (`FormulaireArbreScreen`)

## Structure

- **Fichier** : `lib/screens/formulaire_arbre_screen.dart`
- **Type** : `StatefulWidget`

## Validation (création)

Tous les champs sont validés avant soumission :

| Champ | Validation |
|-------|-----------|
| **Espèce** | Requis, non vide |
| **Site** | Requis, non vide |
| **Planteur** | Requis, non vide |
| **Date** | Requise, ne peut pas dépasser aujourd'hui (via `DatePicker`) |
| **Vivant** | Booléen par défaut `true` |

## Utilisation

```dart
// Navigation vers le formulaire (création)
Navigator.push(context, MaterialPageRoute(
  builder: (_) => const FormulaireArbreScreen(),
));

// Navigation avec site pré-rempli (depuis DetailSiteScreen)
Navigator.push(context, MaterialPageRoute(
  builder: (_) => FormulaireArbreScreen(siteInitial: "SiteName"),
));

// Navigation pour modification
Navigator.push(context, MaterialPageRoute(
  builder: (_) => FormulaireArbreScreen(arbreExistant: monArbre),
));
```

## Comportement

1. L'utilisateur remplit le formulaire
2. Les validateurs s'exécutent au `validate()`
3. L'arbre est créé via `ArbreService.ajouterArbre()`
4. `Navigator.pop(context, true)` retourne `true` pour rafraîchir la liste
