import 'dart:convert';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:versiculos_app/data/database.dart' as database;
import 'package:versiculos_app/external/webClient.dart' as webClient;
import 'package:versiculos_app/models/reference.dart';
import 'package:flutter/services.dart';

class ReferenceCubit extends Cubit<Reference> {
  ReferenceCubit()
      : super(Reference(referenceBible: '', text: 'Busque um versiculo!'));

  Future getVersicule() async {
    Reference reference = null;
    emit(reference);

    Future.delayed(const Duration(milliseconds: 500), () async {
      reference = await webClient.findReference();

      if (reference.text == null) {
        reference =
            Reference(text: 'Desculpe! Busque novamente!', referenceBible: '');
        emit(reference);
      } else {
        emit(reference);
      }
    });
  }

  Future getVersiculeDatabase() async {
    Reference reference = null;
    emit(reference);

    Future.delayed(const Duration(milliseconds: 500), () async {
      reference = await _getReferenceDatabase();
      emit(reference);
    });
  }

  Future<Reference> _getReferenceDatabase() async {
    List books;
    var jsonText = await rootBundle.loadString('assets/nvi.json');
    books = jsonDecode(jsonText);

    //get book
    int bookNumber = _randomInt(66);
    var book = books[bookNumber];

    List chapters = book["chapters"];
    int chapterNumber = _randomInt(chapters.length);
    var chapter = chapters[chapterNumber];

    List versicules = chapter;
    int versiculeNumber = _randomInt(versicules.length);
    var versicule = versicules[versiculeNumber];

    var newReference = Reference();

    newReference.text = versicule;
    newReference.referenceBible = book["name"] +
        ' ' +
        (chapterNumber + 1).toString() +
        '.' +
        (versiculeNumber + 1).toString();

    return newReference;
  }

  int _randomInt(int limit) {
    final _random = new Random();
    return _random.nextInt(limit);
  }
}
