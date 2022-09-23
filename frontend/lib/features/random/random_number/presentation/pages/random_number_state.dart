import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RandomNumberState extends ChangeNotifier {
  late ValueListenable<List<String>> stringslistenable;

  RandomNumberState() {
    lista = [];
    initState();
  }

  List<String> get lista => stringslistenable.value;

  set lista(List<String> novaLista) {
    stringslistenable = ValueNotifier(novaLista);
  }

  void initState() async {
    final response = await Dio().get<Map<String, dynamic>>('http://');
    lista = (response.data as Iterable).map((e) => e.toString()).toList();
  }
}
