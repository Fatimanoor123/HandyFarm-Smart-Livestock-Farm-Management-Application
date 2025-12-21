import 'package:floor/floor.dart';
import 'package:handyfarm/entity/Machine.dart';
import 'package:handyfarm/entity/farm.dart';

@dao
abstract class MachineDAO {
  @Query('SELECT * FROM Machine')
  Future<List<Machine>> getAllMachine();

  @Query('SELECT * FROM Machine WHERE id=:id')
  Future<Machine> getAllMachineById(int id);

  @Query('DELETE  FROM Machine')
  Future<void> deleteAllMachine();

  @insert
  Future<int> insertMachine(Machine Machine);

  @update
  Future<void> updateMachine(Machine Machine);

  @delete
  Future<void> deleteMachine(Machine Machine);
}
