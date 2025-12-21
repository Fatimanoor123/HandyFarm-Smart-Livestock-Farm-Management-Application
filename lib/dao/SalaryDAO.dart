import 'package:floor/floor.dart';
import 'package:handyfarm/entity/Salary.dart';
import 'package:floor/floor.dart';

@dao
abstract class SalaryDAO {
  @Query('SELECT * FROM Salary')
  Future<List<Salary>> getAllSalary();

  @Query('SELECT * FROM Salary WHERE id=:id')
  Future<Salary> getAllSalaryById(int id);

  @Query('DELETE  FROM Salary')
  Future<void> deleteAllSalary();

  @insert
  Future<int> insertSalary(Salary Salary);

  @update
  Future<void> updateSalary(Salary Salary);

  @delete
  Future<void> deleteSalary(Salary Salary);
}
