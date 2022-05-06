import 'package:expenses/models/transactions.dart';
import 'package:flutter/material.dart';

main() => runApp(Expenses());

class Expenses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  final _Trasactions = [
    Transactions(
        id: 'D1', titulo: 'carro', value: 70.000, date: DateTime.now()),
    Transactions(
        id: 'D2', titulo: 'casa', value: 150.000, date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
      ),
      body: Column(
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
          Column(
              children: _Trasactions.map((tr) {
            return Card(
                child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.purple,
                    width: 2,
                  )),
                  padding: EdgeInsets.all(10),
                  child: Text('R\$ ${tr.value.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                          fontSize: 20)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tr.titulo,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      tr.date.toString(),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ));
          }).toList()),
          Card(
            elevation: 5,
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Titulo'),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Valor '),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
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
          ),
        ],
      ),
    );
  }
}
