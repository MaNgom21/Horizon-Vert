import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/arbre_plante.dart';

class CarteArbreWidget extends StatelessWidget {
  final ArbrePlante arbre;
  final VoidCallback onBasculerVivant;
  final VoidCallback onSupprimer;
  final VoidCallback? onTapSite;

  const CarteArbreWidget({
    super.key,
    required this.arbre,
    required this.onBasculerVivant,
    required this.onSupprimer,
    this.onTapSite,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: arbre.vivant
                        ? const Color(0xFFE8F5E9)
                        : const Color(0xFFFFEBEE),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    arbre.vivant ? Icons.eco : Icons.eco_outlined,
                    color: arbre.vivant
                        ? const Color(0xFF43A047)
                        : const Color(0xFFE53935),
                    size: 28,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        arbre.espece,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Planté par ${arbre.planteur}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: arbre.vivant
                        ? const Color(0xFF43A047)
                        : const Color(0xFFE53935),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    arbre.vivant ? 'VIVANT' : 'MORT',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                GestureDetector(
                  onTap: onTapSite,
                  child: _infoChip(
                    Icons.location_on,
                    arbre.site,
                    const Color(0xFF2E7D32),
                  ),
                ),
                const SizedBox(width: 8),
                _infoChip(
                  Icons.calendar_today,
                  DateFormat('dd/MM/yyyy').format(arbre.datePlantation),
                  const Color(0xFFFFC107),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: onBasculerVivant,
                  icon: Icon(
                    arbre.vivant
                        ? Icons.remove_circle_outline
                        : Icons.check_circle_outline,
                    size: 18,
                    color: arbre.vivant
                        ? const Color(0xFFE53935)
                        : const Color(0xFF43A047),
                  ),
                  label: Text(
                    arbre.vivant ? 'Marquer mort' : 'Marquer vivant',
                    style: TextStyle(
                      color: arbre.vivant
                          ? const Color(0xFFE53935)
                          : const Color(0xFF43A047),
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: onSupprimer,
                  icon: const Icon(Icons.delete_outline),
                  color: const Color(0xFF757575),
                  iconSize: 20,
                  tooltip: 'Supprimer',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoChip(IconData icon, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(fontSize: 12, color: color),
          ),
        ],
      ),
    );
  }
}
