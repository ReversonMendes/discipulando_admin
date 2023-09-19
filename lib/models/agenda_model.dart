import 'package:cloud_firestore/cloud_firestore.dart';

class Agenda {
  final DocumentReference? id;
  final String titulo;
  final DateTime data;
  final String descricao;
  final String imagem;
  bool checked;

  Agenda(
      {this.id,
      required this.titulo,
      required this.data,
      required this.descricao,
      required this.imagem,
      required this.checked});


  factory Agenda.fromSnapshot(DocumentSnapshot snapshot) {
    final dateStr = snapshot.get('data') as Timestamp;
    return Agenda(
        id: snapshot.get('id'),
        titulo: snapshot.get('titulo'),
        descricao: snapshot.get('descricao'),
        imagem: snapshot.get('image'),
        data: dateStr.toDate(),
        checked: false);
  }
}
