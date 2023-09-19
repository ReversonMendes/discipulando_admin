import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/aviso_model.dart';
import '../models/failure_model.dart';

class AvisoService {
  //FirebaseDatabase database = FirebaseDatabase.instance;
  final CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('avisos');

  Future<List<Aviso>> getAvisos() async {
    try {
      // Referência para a coleção no Firestore
// Get docs from collection reference
      QuerySnapshot querySnapshot = await _collectionRef.get();

      // Get data from docs and convert map to List
      final allDatas = querySnapshot.docs;

      return (allDatas).map((e) => Aviso.fromSnapshot(e)).toList()
        ..sort((a, b) => b.data.compareTo(a.data));
    } catch (_) {
      throw const Failure(
          message:
              'Algo deu errado,\n verifique a sua conexão com a Internet!');
    }
  }

  Future<DocumentReference?> addAviso(Aviso item) async {
    try {
      final data = <String, dynamic>{
        "data": FieldValue.serverTimestamp(),
        "titulo": item.titulo,
        "descricao": item.descricao,
      };

      var docRef = await _collectionRef.add(data);
      return docRef;
    } catch (_) {
      throw const Failure(
          message:
              'Algo deu errado,\n verifique a sua conexão com a Internet!');
    }
  }

  Future<void> removerAviso(List<Aviso> itens) async {
    try {
      for (var item in itens) {
        print(item.id!.id);
        await _collectionRef.doc(item.id!.id).delete();
      }
    } catch (_) {
      print(_);
      throw const Failure(
          message:
              'Algo deu errado,\n verifique a sua conexão com a Internet!');
    }
  }
}
