import 'package:discipulando_admin/models/agenda_model.dart';
import 'package:flutter/material.dart';

class AgendaProvider extends ChangeNotifier {
  final List<Agenda> _rows = [];

  List<Agenda> get rows => _rows;

  void addData(Agenda agenda) {
    _rows.add(agenda);
    _rows.sort((a, b) => b.data.compareTo(a.data));
    notifyListeners();
  }

  void addAll(List<Agenda> agendas) {
    _rows.clear();
    _rows.addAll(agendas);
    notifyListeners();
  }

  void selecionar(Agenda agenda, bool value) {
    int index = _rows.indexOf(agenda);
    _rows[index].checked = value;
    notifyListeners();
  }

  List<Agenda> getAgendasSelecionados() =>
      _rows.where((element) => element.checked).toList();

  void remover(List<Agenda> agendas) {
    for (var item in agendas) {
      _rows.remove(item);
    }
    notifyListeners();
  }
}
