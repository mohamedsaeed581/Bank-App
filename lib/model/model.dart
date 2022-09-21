class ModelItem {
  int? id;
  String? name;
  int? balance;
  ModelItem(
  {
   required int id,
   required String name,
   required int balance
})
  {
    this.id = id;
    this.balance = balance;
    this.name = name;
  }
}