import 'package:flutter/foundation.dart';
import '../models/arbre_plante.dart';

class ArbreService {
  ArbreService._();
  static final ArbreService _instance = ArbreService._();
  static ArbreService get instance => _instance;

  final List<ArbrePlante> _arbres = [];
  final ValueNotifier<List<ArbrePlante>> arbresNotifier =
      ValueNotifier<List<ArbrePlante>>([]);

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
