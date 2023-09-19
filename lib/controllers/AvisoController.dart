import 'package:discipulando_admin/models/aviso_model.dart';
import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  final List<Aviso> _rows = [];

  List<Aviso> get rows => _rows;

  void addData(Aviso aviso) {
    _rows.add(aviso);
    _rows.sort((a, b) => b.data.compareTo(a.data));
    notifyListeners();
  }

  void addAll(List<Aviso> avisos) {
    _rows.clear();
    _rows.addAll(avisos);
    notifyListeners();
  }

  void selecionar(Aviso aviso, bool value) {
    int index = _rows.indexOf(aviso);
    _rows[index].checked = value;
    notifyListeners();
  }

  List<Aviso> getAvisosSelecionados() =>
      _rows.where((element) => element.checked).toList();

  void remover(List<Aviso> avisos) {
    for (var item in avisos) {
      _rows.remove(item);
    }
    notifyListeners();
  }
}
