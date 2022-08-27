import 'qs.dart';

class QsList {
  List<Qs> _qsGroupe = [
    Qs('radio cassette ?', 'images/image-1.png', true),
    Qs('TV remote ?', 'images/image-2.png', false),
    Qs('TV ?', 'images/image-3.png', true),
    Qs('play station 5 ?', 'images/image-4.png', false),
  ];
  String getQstext(int qsNumber) {
    return _qsGroupe[qsNumber].qsText;
  }

  String getQsImage(int qsNumber) {
    return _qsGroupe[qsNumber].qsImage;
  }

  bool getQsAnswer(int qsNumber) {
    return _qsGroupe[qsNumber].qsanswers;
  }

  int getLength() {
    return _qsGroupe.length;
  }
}
