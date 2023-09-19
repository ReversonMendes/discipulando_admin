import 'package:cloud_firestore/cloud_firestore.dart';

class Aviso {
  final DocumentReference? id;
  final String titulo;
  final DateTime data;
  final String descricao;
  bool checked;

  Aviso(
      {this.id,
      required this.titulo,
      required this.data,
      required this.descricao,
      required this.checked});

  factory Aviso.fromSnapshot(DocumentSnapshot snapshot) {
    final dateStr = snapshot.get('data') as Timestamp;
    return Aviso(
        id: snapshot.reference,
        titulo: snapshot.get('titulo'),
        descricao: snapshot.get('descricao'),
        data: dateStr.toDate(),
        checked: false);
  }
}
