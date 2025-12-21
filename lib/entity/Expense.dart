import 'package:floor/floor.dart';

@entity
class Expense {
  @primaryKey
  int Id;
  final String name;
  final String Amount;
  final String date;
  Expense(this.Id, this.name, this.Amount, this.date);
}
