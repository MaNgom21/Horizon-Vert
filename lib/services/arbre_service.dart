import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';
import '../models/arbre_plante.dart';

class ArbreService {
  ArbreService._();
  static final ArbreService _instance = ArbreService._();
  static ArbreService get instance => _instance;

  final List<ArbrePlante> _arbres = [];
  final ValueNotifier<List<ArbrePlante>> arbresNotifier =
      ValueNotifier<List<ArbrePlante>>([]);

  void initialiserDonnees() {
    if (_arbres.isNotEmpty) return;
    final uuid = const Uuid();
    _arbres.addAll([
      ArbrePlante(
        id: uuid.v4(),
        espece: 'Baobab',
        site: 'Parc de Hann, Dakar',
        datePlantation: DateTime(2024, 7, 15),
        planteur: 'Adji Mariama',
        vivant: true,
      ),
      ArbrePlante(
        id: uuid.v4(),
        espece: 'Manguier',
        site: 'Niayes de Pikine',
        datePlantation: DateTime(2024, 8, 20),
        planteur: 'Mamadou Diallo',
        vivant: true,
      ),
      ArbrePlante(
        id: uuid.v4(),
        espece: 'Fromager',
        site: 'Forêt classée de Mbao',
        datePlantation: DateTime(2024, 6, 5),
        planteur: 'Aïssatou Ndiaye',
        vivant: true,
      ),
      ArbrePlante(
        id: uuid.v4(),
        espece: 'Gmelina',
        site: 'Zone ASER Rufisque',
        datePlantation: DateTime(2025, 1, 12),
        planteur: 'Ousmane Sène',
        vivant: false,
      ),
      ArbrePlante(
        id: uuid.v4(),
        espece: 'Acacia',
        site: 'Ferlo, région de Louga',
        datePlantation: DateTime(2024, 10, 3),
        planteur: 'Fatou Diop',
        vivant: true,
      ),
    ]);
    _notifier();
  }

  List<ArbrePlante> get tousLesArbres => List.unmodifiable(_arbres);

  List<ArbrePlante> get arbresVivants =>
      _arbres.where((a) => a.vivant).toList();

  List<ArbrePlante> get arbresMorts =>
      _arbres.where((a) => !a.vivant).toList();

  List<String> get sitesUniques =>
      _arbres.map((a) => a.site).toSet().toList()..sort();

  int get totalArbres => _arbres.length;

  int get totalVivants => arbresVivants.length;

  int get totalMorts => arbresMorts.length;

  double get tauxSurvie =>
      totalArbres > 0 ? totalVivants / totalArbres : 0.0;

  int nombreArbresParSite(String site) =>
      _arbres.where((a) => a.site == site).length;

  List<ArbrePlante> arbresDuSite(String site) =>
      _arbres.where((a) => a.site == site).toList();

  void ajouterArbre(ArbrePlante arbre) {
    _arbres.add(arbre);
    _notifier();
  }

  void supprimerArbre(String id) {
    _arbres.removeWhere((a) => a.id == id);
    _notifier();
  }

  void mettreAJourArbre(ArbrePlante arbreMisAJour) {
    final index = _arbres.indexWhere((a) => a.id == arbreMisAJour.id);
    if (index != -1) {
      _arbres[index] = arbreMisAJour;
      _notifier();
    }
  }

  void basculerVivant(String id) {
    final index = _arbres.indexWhere((a) => a.id == id);
    if (index != -1) {
      _arbres[index].vivant = !_arbres[index].vivant;
      _notifier();
    }
  }

  void _notifier() {
    arbresNotifier.value = List.from(_arbres);
  }
}
