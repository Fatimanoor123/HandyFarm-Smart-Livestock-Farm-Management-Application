import 'package:floor/floor.dart';
import 'package:handyfarm/entity/employe.dart';

@dao
abstract class EmployeeDAO {
  @Query('SELECT * FROM Employee')
  Future<List<Employee>> getAllEmployee();

  @Query('SELECT * FROM Employee WHERE id=:id')
  Future<Employee> getAllEmployeeById(int id);

  @Query('DELETE FROM Employee')
  Future<void> deleteAllEmployee();

  @insert
  Future<int> insertEmployee(Employee Employee);

  @update
  Future<void> updateEmployee(Employee Employee);

  @delete
  Future<void> deleteEmployee(Employee Employee);
}
