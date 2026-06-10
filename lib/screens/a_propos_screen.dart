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
              Icons.storage,
              'Source des données',
              '5 espèces recensées via la Direction des Parcs Nationaux du Sénégal '
                  'et les programmes de reboisement de l\'ASER.',
            ),
            const SizedBox(height: 12),
            _carteInfo(
              context,
              Icons.calendar_month,
              'Date de collecte',
              'Juin 2026 — Sites visités : Parc de Hann, Niayes de Pikine, '
                  'Forêt de Mbao, Zone ASER Rufisque, Ferlo (Louga).',
            ),
            const SizedBox(height: 12),
            const _SectionTitle('Espèces et sources'),
            const SizedBox(height: 12),
            _especeRow(
              context,
              'Baobab',
              'Adansonia digitata',
              'Parc de Hann, Dakar',
              'fr.wikipedia.org/wiki/Adansonia_digitata',
            ),
            const SizedBox(height: 8),
            _especeRow(
              context,
              'Manguier',
              'Mangifera indica',
              'Niayes de Pikine',
              'fr.wikipedia.org/wiki/Manguier',
            ),
            const SizedBox(height: 8),
            _especeRow(
              context,
              'Fromager',
              'Ceiba pentandra',
              'Forêt classée de Mbao',
              'fr.wikipedia.org/wiki/Ceiba_pentandra',
            ),
            const SizedBox(height: 8),
            _especeRow(
              context,
              'Gmelina',
              'Gmelina arborea',
              'Zone ASER Rufisque',
              'fr.wikipedia.org/wiki/Gmelina_arborea',
            ),
            const SizedBox(height: 8),
            _especeRow(
              context,
              'Acacia',
              'Acacia senegal',
              'Ferlo, région de Louga',
              'fr.wikipedia.org/wiki/Acacia_senegal',
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

  Widget _especeRow(BuildContext context, String nom, String latin,
      String lieu, String source) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F5E9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.eco,
                      color: Color(0xFF2E7D32), size: 18),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(nom,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                      Text(latin,
                          style: TextStyle(
                              fontSize: 11,
                              fontStyle: FontStyle.italic,
                              color: Colors.grey[500])),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Icon(Icons.location_on,
                    size: 13, color: Colors.grey[500]),
                const SizedBox(width: 4),
                Text(lieu,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600])),
              ],
            ),
            const SizedBox(height: 2),
            Row(
              children: [
                Icon(Icons.link, size: 13, color: Colors.grey[400]),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(source,
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey[400],
                          decoration: TextDecoration.underline)),
                ),
              ],
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
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Color(0xFF1B5E20),
      ),
    );
  }
}
