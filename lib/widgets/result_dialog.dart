import 'package:floor_calculator/models/result_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ResultDialog extends StatelessWidget {
  final ResultModel result;

  const ResultDialog(this.result);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Resultado'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text('${result.amountPieces} pisos'),
            subtitle: Text('Quantidade de pisos'),
          ),
          ListTile(
            title: Text('${result.amountFooter} pisos'),
            subtitle: Text('Quantidade de pisos para o rodapé'),
          ),
          ListTile(
            title: Text('${result.amountPiecesAndFooter} pisos'),
            subtitle: Text('Total de pisos'),
          ),
          Divider(),
          ListTile(
            title: Text('${result.areaWithoutFooter.toStringAsFixed(2)} m²'),
            subtitle: Text('Metragem quadrada sem rodapé'),
          ),
          ListTile(
            title: Text('${result.areaWithFooter.toStringAsFixed(2)} m²'),
            subtitle: Text('Metragem quadrada com rodapé'),
          ),
          ListTile(
            title: Text(
                '${result.totalPricePieces.toStringAsFixed(2).replaceFirst(".", ",")} Reais'),
            subtitle: Text('Preço total dos pisos'),
          ),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          textColor: Theme.of(context).primaryColor,
          child: const Text('CONTINUAR'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
