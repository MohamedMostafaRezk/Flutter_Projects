// ignore_for_file: camel_case_types

class img_txt {
  final String img;
  final String txt;
  final String? txt2;
  final String? type;

  const img_txt({
    required this.img,
    required this.txt,
    required this.type,
    this.txt2,
  });
}
