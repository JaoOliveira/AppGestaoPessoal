import 'package:flutter/material.dart';

class transactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;
  transactionForm(this.onSubmit);

  @override
  State<transactionForm> createState() => _transactionFormState();
}

class _transactionFormState extends State<transactionForm> {
  final textController = TextEditingController();

  final valueController = TextEditingController();

  _Submit() {
    final title = textController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;
    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit(title, value);
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
              controller: textController,
              decoration: InputDecoration(labelText: 'Titulo'),
              onSubmitted: (_) => _Submit(),
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              controller: valueController,
              decoration: InputDecoration(labelText: 'Valor R\$'),
              onSubmitted: (_) => _Submit(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    final title = textController.text;
                    final value = double.tryParse(valueController.text) ?? 0.0;
                    widget.onSubmit(title, value);
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
