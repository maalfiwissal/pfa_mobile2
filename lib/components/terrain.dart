import 'package:pitch_project/components/club.dart';
import 'package:pitch_project/components/zone.dart';

class Terrain {
  String terrainId;
  String nom;
  String adresse;
  num attitude;
  num longitude;
  num type;
  bool etat;
  String description;
  num tarif;
  Zone zone;
  Club club;


  Terrain({required this.terrainId ,required this.nom, 
  required this.adresse ,required this.attitude ,required this.longitude,
  required this.type, this.etat=true,required this.description,
  required this.tarif, required this.zone, required this.club});
}

