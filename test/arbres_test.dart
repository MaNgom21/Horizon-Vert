import 'package:flutter_test/flutter_test.dart';
import 'package:horizon_vert/models/arbre_plante.dart';

void main() {
  group('ArbrePlante', () {
    test('création avec valeurs par défaut', () {
      final arbre = ArbrePlante(
        id: '1',
        espece: 'Manguier',
        site: 'Guédiawaye',
        datePlantation: DateTime(2025, 6, 1),
        planteur: 'Adji',
      );
      expect(arbre.espece, 'Manguier');
      expect(arbre.vivant, true);
    });

    test('copyWith modifie uniquement les champs fournis', () {
      final arbre = ArbrePlante(
        id: '1',
        espece: 'Manguier',
        site: 'Guédiawaye',
        datePlantation: DateTime(2025, 6, 1),
        planteur: 'Adji',
      );
      final modifie = arbre.copyWith(vivant: false);
      expect(modifie.vivant, false);
      expect(modifie.espece, 'Manguier');
    });

    test('toMap / fromMap preserve les données', () {
      final arbre = ArbrePlante(
        id: '1',
        espece: 'Baobab',
        site: 'Pikine',
        datePlantation: DateTime(2025, 3, 15),
        planteur: 'Mariama',
        vivant: false,
      );
      final map = arbre.toMap();
      final restaure = ArbrePlante.fromMap(map);
      expect(restaure.id, arbre.id);
      expect(restaure.espece, arbre.espece);
      expect(restaure.datePlantation, arbre.datePlantation);
      expect(restaure.vivant, arbre.vivant);
    });

    test('equals basé sur id', () {
      final a1 = ArbrePlante(
        id: '1',
        espece: 'Manguier',
        site: 'Site A',
        datePlantation: DateTime(2025, 1, 1),
        planteur: 'X',
      );
      final a2 = ArbrePlante(
        id: '1',
        espece: 'Baobab',
        site: 'Site B',
        datePlantation: DateTime(2025, 2, 1),
        planteur: 'Y',
      );
      expect(a1 == a2, true);
      expect(a1.hashCode == a2.hashCode, true);
    });
  });
}
