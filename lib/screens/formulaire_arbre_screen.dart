import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../models/arbre_plante.dart';
import '../services/arbre_service.dart';
import '../data/tree_species.dart';

class FormulaireArbreScreen extends StatefulWidget {
  final String? siteInitial;
  final ArbrePlante? arbreExistant;

  const FormulaireArbreScreen({
    super.key,
    this.siteInitial,
    this.arbreExistant,
  });

  @override
  State<FormulaireArbreScreen> createState() => _FormulaireArbreScreenState();
}

class _FormulaireArbreScreenState extends State<FormulaireArbreScreen> {
  final _formKey = GlobalKey<FormState>();
  final _siteController = TextEditingController();
  final _planteurController = TextEditingController();
  String? _especeSelectionnee;
  DateTime _datePlantation = DateTime.now();
  bool _vivant = true;
  bool _estModification = false;

  @override
  void initState() {
    super.initState();
    if (widget.arbreExistant != null) {
      final a = widget.arbreExistant!;
      _especeSelectionnee = a.espece;
      _siteController.text = a.site;
      _planteurController.text = a.planteur;
      _datePlantation = a.datePlantation;
      _vivant = a.vivant;
      _estModification = true;
    } else if (widget.siteInitial != null) {
      _siteController.text = widget.siteInitial!;
    }
  }

  @override
  void dispose() {
    _siteController.dispose();
    _planteurController.dispose();
    super.dispose();
  }

  Future<void> _choisirDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _datePlantation,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      helpText: 'Choisir la date de plantation',
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: const Color(0xFF2E7D32),
                ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _datePlantation) {
      setState(() {
        _datePlantation = picked;
      });
    }
  }

  void _soumettre() {
    if (!_formKey.currentState!.validate()) return;

    final arbre = ArbrePlante(
      id: _estModification
          ? widget.arbreExistant!.id
          : const Uuid().v4(),
      espece: _especeSelectionnee!,
      site: _siteController.text.trim(),
      datePlantation: _datePlantation,
      planteur: _planteurController.text.trim(),
      vivant: _vivant,
    );

    final service = ArbreService.instance;
    if (_estModification) {
      service.mettreAJourArbre(arbre);
    } else {
      service.ajouterArbre(arbre);
    }

    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    final especeCourante = trouverEspece(_especeSelectionnee ?? '');

    return Scaffold(
      appBar: AppBar(
        title: Text(_estModification ? 'Modifier l\'arbre' : 'Ajouter un arbre'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _estModification
                            ? 'Modifier les informations'
                            : 'Nouvel arbre planté',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 20),
                      DropdownButtonFormField<String>(
                        value: _especeSelectionnee,
                        decoration: const InputDecoration(
                          labelText: 'Espèce *',
                          prefixIcon: Icon(Icons.eco),
                        ),
                        hint: const Text('Choisir une espèce'),
                        items: especesArbres.map((espece) {
                          return DropdownMenuItem<String>(
                            value: espece.nom,
                            child: Row(
                              children: [
                                Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    color: espece.couleur.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Icon(
                                    espece.icone,
                                    size: 16,
                                    color: espece.couleur,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      espece.nom,
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                    Text(
                                      espece.nomLatin,
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez choisir une espèce';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            _especeSelectionnee = value;
                          });
                        },
                      ),
                      if (especeCourante != null) ...[
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: especeCourante.couleur.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: especeCourante.couleur.withOpacity(0.2),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                especeCourante.icone,
                                color: especeCourante.couleur,
                                size: 20,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  especeCourante.description,
                                  style: TextStyle(
                                    color: especeCourante.couleur,
                                    fontSize: 12,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _siteController,
                        decoration: const InputDecoration(
                          labelText: 'Site de plantation *',
                          hintText: 'Ex: Pépinière de Guédiawaye',
                          prefixIcon: Icon(Icons.location_on),
                        ),
                        textCapitalization: TextCapitalization.words,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Le site est requis';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _planteurController,
                        decoration: const InputDecoration(
                          labelText: 'Planteur *',
                          hintText: 'Nom de la personne',
                          prefixIcon: Icon(Icons.person),
                        ),
                        textCapitalization: TextCapitalization.words,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Le nom du planteur est requis';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      InkWell(
                        onTap: _choisirDate,
                        child: InputDecorator(
                          decoration: const InputDecoration(
                            labelText: 'Date de plantation *',
                            prefixIcon: Icon(Icons.calendar_today),
                          ),
                          child: Text(
                            DateFormat('dd/MM/yyyy').format(_datePlantation),
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SwitchListTile(
                        title: const Text('Vivant'),
                        subtitle: Text(
                          _vivant
                              ? 'L\'arbre est en vie'
                              : 'L\'arbre est mort',
                        ),
                        secondary: Icon(
                          _vivant ? Icons.eco : Icons.heart_broken,
                          color: _vivant
                              ? const Color(0xFF43A047)
                              : const Color(0xFFE53935),
                        ),
                        value: _vivant,
                        activeColor: const Color(0xFF43A047),
                        onChanged: (value) {
                          setState(() {
                            _vivant = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: _soumettre,
                icon: Icon(
                  _estModification ? Icons.save : Icons.add_circle_outline,
                ),
                label: Text(
                  _estModification
                      ? 'Enregistrer les modifications'
                      : 'Ajouter l\'arbre',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              if (!_estModification) ...[
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Annuler'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
