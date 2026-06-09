# Étape 4 : Écran Détail Site (`DetailSiteScreen`)

## Structure

- **Fichier** : `lib/screens/detail_site_screen.dart`
- **Type** : `StatefulWidget`

## Passage d'argument

Le **site** (String) est passé en argument via le constructeur :

```dart
Navigator.push(context, MaterialPageRoute(
  builder: (_) => DetailSiteScreen(site: "NomDuSite"),
));
```

## Contenu

| Élément | Description |
|---------|-------------|
| **AppBar** | Nom du site passé en argument |
| **Bandeau statistiques** | Total arbres, vivants, morts sur ce site |
| **Barre de progression** | Taux de survie du site |
| **ListView** | Arbres de ce site uniquement (via `ArbreService.arbresDuSite(site)`) |
| **FAB** | "+" → ouvre FormulaireArbreScreen avec `siteInitial` pré-rempli |

## Interactions dynamiques

1. **Taux de survie** : Calculé en temps réel via setState
2. **Nombre d'arbres par site** : Affiché dans le bandeau
3. **Basculer vivant/mort** : Confirmation dialog puis mise à jour
4. **Suppression** : Confirmation dialog avec `_supprimerArbre()`
