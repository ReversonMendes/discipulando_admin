import 'package:discipulando_admin/constants.dart';
import 'package:discipulando_admin/controllers/AvisoController.dart';
import 'package:discipulando_admin/main/components/header.dart';
import 'package:discipulando_admin/models/failure_model.dart';
import 'package:discipulando_admin/services/aviso_service.dart';
import 'package:discipulando_admin/styles/color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../models/aviso_model.dart';

class AvisosScreen extends StatefulWidget {
  const AvisosScreen({Key? key}) : super(key: key);

  @override
  _AvisosScreenState createState() => _AvisosScreenState();
}

class _AvisosScreenState extends State<AvisosScreen> {
  late Future<List<Aviso>> _futureItems;
  final AvisoService _avisoService = AvisoService();

  @override
  void initState() {
    super.initState();
    _futureItems = _avisoService.getAvisos();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<DataProvider>(context, listen: false);

    _futureItems.then((itens) => controller.addAll(itens));

    return SafeArea(
        child: Column(
      children: [
        const Header(),
        const SizedBox(
            height: defaultPadding * 6,
            child: Center(
              child: Text(
                "AVISOS",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(
                    bottom: defaultPadding / 2, top: defaultPadding, left: 8),
                child: ElevatedButton.icon(
                  onPressed: () {
                    _addDialog(context);
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("Novo Aviso"),
                )),
            Padding(
                padding: const EdgeInsets.only(
                    bottom: defaultPadding / 2, top: defaultPadding, left: 8),
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (controller.getAvisosSelecionados().isNotEmpty) {
                      _removeDialog(context);
                    }
                  },
                  icon: const Icon(Icons.remove),
                  label: const Text("Excluir"),
                )),
          ],
        ),
        const Padding(padding: EdgeInsets.all(defaultPadding / 2)),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(8),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Consumer<DataProvider>(
                builder: (context, dataProvider, child) {
                  List<Aviso> avisos = dataProvider.rows;
                  final DateFormat formatter = DateFormat('dd/MM/yyyy');

                  return Container(
                    padding: const EdgeInsets.all(defaultPadding),
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: DataTable(
                      dataRowMaxHeight: double.infinity,
                      sortColumnIndex: 0,
                      columns: const [
                        DataColumn(
                          label: Text("Data"),
                        ),
                        DataColumn(
                          label: Text("Titulo"),
                        ),
                        DataColumn(
                          label: Expanded(
                              child: Text(
                            "Descrição",
                            softWrap: true,
                          )),
                        ),
                      ],
                      rows: List.generate(avisos.length, (index) {
                        final item = avisos[index];
                        return DataRow(
                            cells: [
                              DataCell(Text(formatter.format(item.data))),
                              DataCell(Text(item.titulo)),
                              DataCell(Text(item.descricao)),
                            ],
                            selected: item.checked,
                            onSelectChanged: (bool? value) {
                              controller.selecionar(item, value!);
                            });
                      }),
                    ),
                  );
                },
              ),
            ),
          ),
        )
      ],
    ));
  }
}

_addDialog(BuildContext context) {
  TextEditingController tituloController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  final AvisoService avisoService = AvisoService();

  final controller = Provider.of<DataProvider>(context, listen: false);

  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          title: const Text('Adicionar Aviso'),
          content: SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width / 2,
            child: Expanded(
              child: Column(children: [
                TextField(
                  controller: tituloController,
                  onChanged: (String value) {
                    //model.setTitle('$value (visitante)');
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Título',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: TextField(
                    controller: descricaoController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Descrição',
                    ),
                    keyboardType: TextInputType.multiline,
                    textAlignVertical: TextAlignVertical.top,
                    expands: true,
                    maxLines: null,
                  ),
                )
              ]),
            ),
          ),
          actions: <Widget>[
            ElevatedButton.icon(
              onPressed: () {
                Aviso aviso = Aviso(
                    data: DateTime.now(),
                    titulo: tituloController.text,
                    descricao: descricaoController.text,
                    checked: false);

                controller.addData(aviso);
                avisoService.addAviso(aviso);
                tituloController.clear();
                descricaoController.clear();

                Navigator.of(context).pop();
              },
              label: const Text('Salvar'),
              icon: const Icon(Icons.save),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancelar'))
          ],
        );
      });
}

_removeDialog(BuildContext context) {
  final AvisoService avisoService = AvisoService();

  final controller = Provider.of<DataProvider>(context, listen: false);

  List<Aviso> avisosSelecionados = controller.getAvisosSelecionados();

  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          title: const Text('Atenção'),
          content: Text(
              "Deseja realmente remover os itens selecionados ? (${avisosSelecionados.length})"),
          actions: <Widget>[
            ElevatedButton(
                onPressed: () {
                  avisoService.removerAviso(avisosSelecionados);
                  controller.remover(avisosSelecionados);
                  Navigator.of(context).pop();
                },
                child: const Text('Sim')),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(
                      Theme.of(context).colorScheme.inversePrimary)),
            )
          ],
        );
      });
}
