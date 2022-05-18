import 'package:expenses/components/trasactionsForm.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import '/components/trasactionsForm.dart';
import '/components/transactionList.dart';
import '/models/transactions.dart';

main() => runApp(Expenses());

class Expenses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _Trasactions = [
    Transactions(
        id: 'D1', titulo: 'carro', value: 70.000, date: DateTime.now()),
    Transactions(
        id: 'D2', titulo: 'casa', value: 150.000, date: DateTime.now()),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transactions(
        id: Random().nextDouble().toString(),
        titulo: title,
        value: value,
        date: DateTime.now());
    setState(() {
      _Trasactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => transactionForm(_addTransaction),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
        actions: [
          IconButton(
            onPressed: () => _openTransactionFormModal(context),
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Card(
                color: Colors.blue,
                child: Text('GRAFICO'),
                elevation: 5,
              ),
            ),
            transactionList(_Trasactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
