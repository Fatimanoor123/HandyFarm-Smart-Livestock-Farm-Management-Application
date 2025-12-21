import 'package:floor/floor.dart';
import 'package:handyfarm/entity/Expense.dart';

@dao
abstract class ExpenseDAO {
  @Query('SELECT * FROM Expense')
  Future<List<Expense>> getAllExpense();

  @Query('SELECT * FROM Expense WHERE id=:id')
  Future<Expense> getAllExpenseById(int id);

  @Query('DELETE  FROM Expense')
  Future<void> deleteAllExpense();

  @insert
  Future<int> insertExpense(Expense Expense);

  @update
  Future<void> updateExpense(Expense Expense);

  @delete
  Future<void> deleteExpense(Expense Expense);
}
