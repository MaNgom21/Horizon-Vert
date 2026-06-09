# Étape 6 : Logique métier

## Service (`lib/services/arbre_service.dart`)

**Patron Singleton** : Une seule instance partagée dans toute l'application.

### Méthodes principales

| Méthode | Description |
|---------|-------------|
| `ajouterArbre(ArbrePlante)` | Ajoute un arbre à la liste |
| `supprimerArbre(String id)` | Supprime par ID |
| `mettreAJourArbre(ArbrePlante)` | Remplace un arbre existant |
| `basculerVivant(String id)` | Inverse l'état `vivant` |
| `arbresDuSite(String site)` | Filtre les arbres d'un site donné |
| `sitesUniques` | Liste des noms de sites distincts |
| `tauxSurvie` | `totalVivants / totalArbres` (double) |

### `ValueNotifier` pour réactivité

Le service expose `arbresNotifier` qui notifie tous les écrans lors d'un changement :

```dart
// Dans le service
void _notifier() {
  arbresNotifier.value = List.from(_arbres);
}

// Dans les écrans
ValueListenableBuilder<List<ArbrePlante>>(
  valueListenable: _service.arbresNotifier,
  builder: (context, arbres, _) { ... },
)
```

## Statistiques (`lib/widgets/statistiques_widget.dart`)

| Affichage | Calcul |
|-----------|--------|
| Total | `arbres.length` |
| Vivants | `arbres.where((a) => a.vivant).length` |
| Morts | `total - vivants` |
| Taux de survie | `(vivants / total) * 100` |

## Filtres

### Filtre arbres morts (liste principale)
```dart
List<ArbrePlante> get _arbresFiltres {
  if (_afficherMortsSeulement) {
    return arbres.where((a) => !a.vivant).toList();
  }
  return arbres;
}
```

## Navigation avec arguments

**Site passé en argument** vers DetailSiteScreen :
```dart
Navigator.push(context, MaterialPageRoute(
  builder: (_) => DetailSiteScreen(site: nomDuSite),
));
```

## Points clés du live coding (5 min)

1. **Création avec validation** → `FormulaireArbreScreen` avec `FormKey` + validators
2. **Suppression avec confirmation** → `showDialog` + `AlertDialog`
3. **Taux de survie** → `StatistiquesWidget` avec `LinearProgressIndicator`
4. **Nombre d'arbres par site** → `DetailSiteScreen` avec compteurs
5. **Filtre arbres morts** → Bouton AppBar avec `_afficherMortsSeulement`
6. **Passage d'argument** → `Navigator.push` avec site en paramètre
