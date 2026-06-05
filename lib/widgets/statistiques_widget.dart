import 'package:flutter/material.dart';
import '../models/arbre_plante.dart';

class StatistiquesWidget extends StatelessWidget {
  final List<ArbrePlante> arbres;

  const StatistiquesWidget({super.key, required this.arbres});

  @override
  Widget build(BuildContext context) {
    final total = arbres.length;
    final vivants = arbres.where((a) => a.vivant).length;
    final morts = total - vivants;
    final taux = total > 0 ? (vivants / total) * 100 : 0.0;

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2E7D32), Color(0xFF388E3C)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF2E7D32).withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _statChiffre(context, total.toString(), 'Total', Icons.forest),
              _statChiffre(
                  context, vivants.toString(), 'Vivants', Icons.eco),
              _statChiffre(context, morts.toString(), 'Morts', Icons.heart_broken),
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: taux / 100,
              minHeight: 10,
              backgroundColor: Colors.white.withOpacity(0.3),
              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFFC107)),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Taux de survie : ${taux.toStringAsFixed(1)}%',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _statChiffre(BuildContext context, String valeur, String label, IconData icone) {
    return Column(
      children: [
        Icon(icone, color: Colors.white.withOpacity(0.9), size: 22),
        const SizedBox(height: 4),
        Text(
          valeur,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
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
