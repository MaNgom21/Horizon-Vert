# Étape 3 : Écran Liste (`ListeArbresScreen`)

## Structure

- **Fichier** : `lib/screens/liste_arbres_screen.dart`
- **Type** : `StatefulWidget` (conforme au cahier des charges)

## Contenu

| Élément | Description |
|---------|-------------|
| **AppBar** | Titre "Suivi Reboisement" + icône de filtre |
| **StatistiquesWidget** | Total, vivants, morts, barre de survie |
| **Filtre actif** | Bannière rouge si le filtre "arbres morts" est actif |
| **ListView** | Liste des `CarteArbreWidget` |
| **État vide** | Icône forêt + message si aucun arbre |
| **FAB** | Bouton "+" → ouvre FormulaireArbreScreen |

## Fonctionnalités clés

### Bouton filtre (AppBar)
```dart
_afficherMortsSeulement = !_afficherMortsSeulement;
setState(() {});
```
### Suppression avec confirmation
```dart
showDialog(context: ..., builder: (ctx) => AlertDialog(...));
```
### Navigation vers formulaire
```dart
Navigator.push(context, MaterialPageRoute(
  builder: (_) => const FormulaireArbreScreen(),
));
```
