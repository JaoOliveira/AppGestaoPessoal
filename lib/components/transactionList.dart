import 'package:expenses/models/transactions.dart';
import 'package:flutter/material.dart';
import '../models/transactions.dart';

class transactionList extends StatelessWidget {
  List<Transactions> transaction;
  transactionList(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemCount: transaction.length,
        itemBuilder: (ctx, index) {
          final tr = transaction[index];
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    tr.date.toString(),
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ));
        },
      ),
    );
  }
}
