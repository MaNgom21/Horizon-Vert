import 'package:flutter/material.dart';
import '../models/arbre_plante.dart';
import '../services/arbre_service.dart';
import '../widgets/statistiques_widget.dart';
import '../widgets/carte_arbre_widget.dart';
import 'detail_site_screen.dart';
import 'formulaire_arbre_screen.dart';

class ListeArbresScreen extends StatefulWidget {
  const ListeArbresScreen({super.key});

  @override
  State<ListeArbresScreen> createState() => _ListeArbresScreenState();
}

class _ListeArbresScreenState extends State<ListeArbresScreen> {
  final ArbreService _service = ArbreService.instance;
  bool _afficherMortsSeulement = false;

  List<ArbrePlante> get _arbresFiltres {
    final arbres = _service.tousLesArbres;
    if (_afficherMortsSeulement) {
      return arbres.where((a) => !a.vivant).toList();
    }
    return arbres;
  }

  void _supprimerArbre(ArbrePlante arbre) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Confirmer la suppression'),
        content: Text(
          'Supprimer ${arbre.espece} planté par ${arbre.planteur} ?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              _service.supprimerArbre(arbre.id);
              Navigator.pop(ctx);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE53935),
            ),
            child: const Text('Supprimer'),
          ),
        ],
      ),
    );
  }

  void _naviguerVersSite(String site) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DetailSiteScreen(site: site),
      ),
    );
  }

  void _basculerVivant(ArbrePlante arbre) {
    final action = arbre.vivant ? 'mort' : 'vivant';
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Marquer $action'),
        content: Text(
          'Confirmer que ${arbre.espece} est $action ?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              _service.basculerVivant(arbre.id);
              Navigator.pop(ctx);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: arbre.vivant
                  ? const Color(0xFFE53935)
                  : const Color(0xFF43A047),
            ),
            child: Text(arbre.vivant ? 'Marquer mort' : 'Marquer vivant'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Horizon Vert'),
        actions: [
          IconButton(
            icon: _afficherMortsSeulement
                ? const Icon(Icons.filter_list_off)
                : const Icon(Icons.filter_list),
            tooltip: _afficherMortsSeulement
                ? 'Voir tous les arbres'
                : 'Filtrer arbres morts',
            onPressed: () {
              setState(() {
                _afficherMortsSeulement = !_afficherMortsSeulement;
              });
            },
          ),
        ],
      ),
      body: ValueListenableBuilder<List<ArbrePlante>>(
        valueListenable: _service.arbresNotifier,
        builder: (context, arbres, _) {
          if (arbres.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.forest,
                    size: 80,
                    color: const Color(0xFFA5D6A7),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Aucun arbre planté',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF757575),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Appuyez sur + pour ajouter un arbre',
                    style: TextStyle(color: Color(0xFF9E9E9E)),
                  ),
                ],
              ),
            );
          }

          final arbresFiltres = _arbresFiltres;

          return Column(
            children: [
              StatistiquesWidget(arbres: arbres),
              if (_afficherMortsSeulement)
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFEBEE),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFFE53935)),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.filter_list,
                        size: 18,
                        color: Color(0xFFE53935),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Filtre actif : arbres morts (${arbresFiltres.length})',
                        style: const TextStyle(
                          color: Color(0xFFE53935),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              Expanded(
                child: _afficherMortsSeulement && arbresFiltres.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.check_circle,
                              size: 60,
                              color: Color(0xFF43A047),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              'Aucun arbre mort !',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF757575),
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.only(top: 8, bottom: 80),
                        itemCount: arbresFiltres.length,
                        itemBuilder: (context, index) {
                          final arbre = arbresFiltres[index];
                          return CarteArbreWidget(
                            arbre: arbre,
                            onBasculerVivant: () =>
                                _basculerVivant(arbre),
                            onSupprimer: () => _supprimerArbre(arbre),
                            onTapSite: () =>
                                _naviguerVersSite(arbre.site),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final result = await Navigator.push<bool>(
            context,
            MaterialPageRoute(
              builder: (_) => const FormulaireArbreScreen(),
            ),
          );
          if (result == true && mounted) {
            setState(() {});
          }
        },
        icon: const Icon(Icons.add),
        label: const Text('Ajouter un arbre'),
      ),
    );
  }
}
