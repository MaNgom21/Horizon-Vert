import 'package:flutter/material.dart';

class AProposScreen extends StatelessWidget {
  const AProposScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('À propos'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/logo.jpeg',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Horizon Vert',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1B5E20),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Reboisement & Suivi',
              style: TextStyle(
                fontSize: 16,
                color: const Color(0xFF2E7D32).withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E9),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'ODD 13 — Lutte contre les changements climatiques',
                style: TextStyle(
                  color: Color(0xFF2E7D32),
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(height: 32),
            _carteInfo(
              context,
              Icons.school,
              'Établissement',
              'ESMT — École Supérieure Multinationale des Télécommunications',
            ),
            const SizedBox(height: 12),
            _carteInfo(
              context,
              Icons.person,
              'Étudiant',
              'Adji Mariama Ngom',
            ),
            const SizedBox(height: 12),
            _carteInfo(
              context,
              Icons.code,
              'Matière',
              'Développement multiplateforme — Projet Flutter DAR26',
            ),
            const SizedBox(height: 12),
            _carteInfo(
              context,
              Icons.eco,
              'Contexte',
              'Suivi des arbres plantés lors de la Journée de l\'arbre. '
                  'Taux de survie, filtrage par état et regroupement par site de plantation.',
            ),
            const SizedBox(height: 12),
            _carteInfo(
              context,
              Icons.info_outline,
              'Version',
              '1.0.0 — Juin 2026',
            ),
            const SizedBox(height: 32),
            Text(
              '© 2026 — Tous droits réservés',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _carteInfo(
      BuildContext context, IconData icone, String titre, String contenu) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E9),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icone, color: const Color(0xFF2E7D32), size: 22),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titre,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B5E20),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    contenu,
                    style: const TextStyle(
                      color: Color(0xFF757575),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
