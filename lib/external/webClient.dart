import 'dart:convert';

import 'package:http/http.dart';
import 'package:versiculos_app/models/reference.dart';
import 'package:versiculos_app/utils/RandowBible.dart' as random;

const baseUrl = 'https://bible-api.com/';
const baseVersion = '?translation=almeida';
var ref = random.RandowBible();

Future<Reference> findReference() async {
  Uri url = _mountUrl();
  var response = await get(url);

  for (var i = 0; i <= 10; i++) {
    if (response.statusCode == 200) {
      i = 10;
    } else {
      Uri url = _mountUrl();
      response = await get(url);
      i++;
    }
  }
  var json = jsonDecode(response.body);
  var reference =
      Reference(referenceBible: json["reference"], text: json["text"]);

  return reference;
}

Uri _mountUrl() {
  var book = ref.randomBook();
  var chapter = ref.randomChapter();
  var verse = ref.randomVersicule();

  var uri = Uri.parse(baseUrl + book + chapter + ':' + verse + baseVersion);

  return uri;
}
