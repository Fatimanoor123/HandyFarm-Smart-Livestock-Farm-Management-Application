import 'package:floor/floor.dart';

import 'package:handyfarm/entity/ExpenseType.dart';

@dao
abstract class ExpenseTypeDAO {
  @Query('SELECT * FROM ExpenseType')
  Future<List<ExpenseType>> getAllExpense();

  @Query('SELECT * FROM ExpenseType WHERE id=:id')
  Future<ExpenseType> getAllExpenseTypeById(int id);

  @Query('DELETE  FROM ExpenseType')
  Future<void> deleteAllExpenseType();

  @insert
  Future<int> insertExpenseType(ExpenseType ExpenseType);

  @update
  Future<void> updateExpenseType(ExpenseType ExpenseType);

  @delete
  Future<void> deleteExpenseType(ExpenseType ExpenseType);
}
