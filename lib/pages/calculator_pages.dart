import 'package:floor_calculator/controllers/calculator_controller.dart';
import 'package:floor_calculator/helpers/validator_helper.dart';
import 'package:floor_calculator/widgets/result_dialog.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final _formKey = GlobalKey<FormState>();
  final _controller = CalculatorController();

  @override
  Widget build(BuildContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de Pisos'),
      ),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20),
                child: _buildForm(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Form _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeaderText('Dimensões do Cômodo'),
          _buildVerticalSpace(),
          _buildNumberInputField(
            'Largura (metros)',
            onSaved: _controller.setRoomWidth,
          ),
          _buildVerticalSpace(),
          _buildNumberInputField(
            'Comprimento (metros)',
            onSaved: _controller.setRoomLength,
          ),
          _buildVerticalSpace(),
          _buildHeaderText('Dimensões do Piso'),
          _buildVerticalSpace(),
          _buildNumberInputField(
            'Largura (centímetros)',
            onSaved: _controller.setFloorWidth,
          ),
          _buildVerticalSpace(),
          _buildNumberInputField(
            'Comprimento (centímetros)',
            onSaved: _controller.setFloorLength,
          ),
          _buildVerticalSpace(),
          _buildHeaderText('Preço unitário do piso'),
          _buildVerticalSpace(),
          _buildNumberInputField(
            'Preço (reais)',
            onSaved: _controller.setFloorPrice,
          ),
          _buildVerticalSpace(height: 20),
          _buildCalculateButton(),
          _buildVerticalSpace(height: 20),
          _buildClearButton()
        ],
      ),
    );
  }

  _buildVerticalSpace({double height = 10}) {
    return SizedBox(height: height);
  }

  _buildHeaderText(String title) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor.withOpacity(0.1),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  _buildNumberInputField(String label, {Function(String) onSaved}) {
    return TextFormField(
      onSaved: onSaved,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
      ),
      validator: ValidatorHelper.isValidNumber,
      keyboardType: TextInputType.number,
    );
  }

  _buildCalculateButton() {
    return RaisedButton(
      child: Text('CALCULAR'),
      onPressed: _calculate,
    );
  }

  _buildClearButton() {
    return RaisedButton(
      child: Text('LIMPAR CAMPOS'),
      onPressed: _clearButtons,
    );
  }

  void _clearButtons() {
    _formKey.currentState.reset();
  }

  _calculate() {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      final result = _controller.calculate();
      showDialog(
        context: context,
        builder: (context) => ResultDialog(result),
      );
    }
  }
}
