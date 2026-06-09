# Étape 2 : Modèle de données

## Classe `ArbrePlante`

Conforme au cahier des charges :

| Champ | Type | Description |
|-------|------|-------------|
| `id` | `String` | Identifiant unique (UUID) |
| `espece` | `String` | Espèce de l'arbre |
| `site` | `String` | Lieu de plantation |
| `datePlantation` | `DateTime` | Date à laquelle l'arbre a été planté |
| `planteur` | `String` | Nom de la personne qui a planté |
| `vivant` | `bool` | True = vivant, False = mort |

### Validation (création)

- `espece` : requis, non vide
- `site` : requis, non vide
- `planteur` : requis, non vide
- `datePlantation` : requise, ne peut pas être dans le futur
- `vivant` : booléen par défaut `true`

### Méthodes

- `ArbrePlante.copyWith(...)` : pour l'édition
- `Map<String, dynamic> toMap()` / `factory ArbrePlante.fromMap(...)` : sérialisation
- Validation dans le formulaire via `FormState` + validators
