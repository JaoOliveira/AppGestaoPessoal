import 'package:flutter/material.dart';

class Transactions {
  final String titulo;
  final String id;
  final double value;
  final DateTime date;

  Transactions({
    required this.id,
    required this.titulo,
    required this.value,
    required this.date,
  });
}
