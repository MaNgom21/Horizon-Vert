import 'package:flutter/material.dart';
import '../models/arbre_plante.dart';
import '../services/arbre_service.dart';
import '../widgets/carte_arbre_widget.dart';
import 'formulaire_arbre_screen.dart';

class DetailSiteScreen extends StatefulWidget {
  final String site;

  const DetailSiteScreen({super.key, required this.site});

  @override
  State<DetailSiteScreen> createState() => _DetailSiteScreenState();
}

class _DetailSiteScreenState extends State<DetailSiteScreen> {
  final ArbreService _service = ArbreService.instance;

  List<ArbrePlante> get _arbresDuSite =>
      _service.arbresDuSite(widget.site);

  int get _nombreArbres => _arbresDuSite.length;
  int get _vivants => _arbresDuSite.where((a) => a.vivant).length;
  int get _morts => _nombreArbres - _vivants;
  double get _taux => _nombreArbres > 0 ? _vivants / _nombreArbres : 0.0;

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
              if (mounted) setState(() {});
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
              if (mounted) setState(() {});
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
        title: Text(widget.site),
      ),
      body: ValueListenableBuilder<List<ArbrePlante>>(
        valueListenable: _service.arbresNotifier,
        builder: (context, _, __) {
          final arbres = _arbresDuSite;

          if (arbres.isEmpty) {
            return const Center(
              child: Text(
                'Aucun arbre sur ce site',
                style: TextStyle(color: Color(0xFF757575)),
              ),
            );
          }

          return Column(
            children: [
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF2E7D32), Color(0xFF388E3C)],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _stat(_nombreArbres.toString(), 'Arbres', Icons.forest),
                    Container(
                      height: 40,
                      width: 1,
                      color: Colors.white.withOpacity(0.3),
                    ),
                    _stat(_vivants.toString(), 'Vivants', Icons.eco),
                    Container(
                      height: 40,
                      width: 1,
                      color: Colors.white.withOpacity(0.3),
                    ),
                    _stat(_morts.toString(), 'Morts', Icons.heart_broken),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: _taux,
                    minHeight: 8,
                    backgroundColor: const Color(0xFFFFEBEE),
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Color(0xFF43A047),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Text(
                  'Taux de survie : ${(_taux * 100).toStringAsFixed(1)}%',
                  style: const TextStyle(
                    color: Color(0xFF757575),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(bottom: 80),
                  itemCount: arbres.length,
                  itemBuilder: (context, index) {
                    final arbre = arbres[index];
                    return CarteArbreWidget(
                      arbre: arbre,
                      onBasculerVivant: () => _basculerVivant(arbre),
                      onSupprimer: () => _supprimerArbre(arbre),
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
              builder: (_) => FormulaireArbreScreen(siteInitial: widget.site),
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

  Widget _stat(String valeur, String label, IconData icone) {
    return Column(
      children: [
        Icon(icone, color: Colors.white.withOpacity(0.9), size: 22),
        const SizedBox(height: 4),
        Text(
          valeur,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
