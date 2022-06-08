import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class transactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;
  transactionForm(this.onSubmit);

  @override
  State<transactionForm> createState() => _transactionFormState();
}

class _transactionFormState extends State<transactionForm> {
  final _textController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime? _SelectedDate = DateTime.now();

  _Submit() {
    final title = _textController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;
    if (title.isEmpty || value <= 0 || _SelectedDate == '') {
      return;
    }
    widget.onSubmit(title, value, _SelectedDate!);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == 0) {
        return;
      }
      setState(() {
        _SelectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(labelText: 'Titulo'),
              onSubmitted: (_) => _Submit(),
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              controller: _valueController,
              decoration: InputDecoration(labelText: 'Valor R\$'),
              onSubmitted: (_) => _Submit(),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _SelectedDate == 0
                          ? 'Nenhuma data selecionada'
                          : DateFormat('d/MM/y').format(_SelectedDate!),
                    ),
                  ),
                  TextButton(
                    onPressed: _showDatePicker,
                    child: Text('Selecionar data'),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    final title = _textController.text;
                    final value = double.tryParse(_valueController.text) ?? 0.0;
                    widget.onSubmit(title, value, _SelectedDate!);
                  },
                  child: Text('Nova transação'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.purple)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
