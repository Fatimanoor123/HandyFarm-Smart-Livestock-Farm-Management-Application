import 'package:floor/floor.dart';

@entity
class ExpenseType {
  @primaryKey
  int ETypeId;

  final String name;
  ExpenseType(this.name);
}
