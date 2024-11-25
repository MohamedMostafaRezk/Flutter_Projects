class Messagemodel {
  final String text;
  final String id;
  Messagemodel(this.text, this.id);

  factory Messagemodel.fromJson(jsoondata) {
    return Messagemodel(jsoondata['text'], jsoondata['id'][0]);
  }
}
