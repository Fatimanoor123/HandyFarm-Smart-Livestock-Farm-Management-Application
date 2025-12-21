import 'package:floor/floor.dart';
import 'package:handyfarm/entity/MilkProduction.dart';

@dao
abstract class MilkProductionDAO {
  @Query('SELECT * FROM MilkProduction')
  Future<List<MilkProduction>> getAllMilkProduction();

  @Query('SELECT * FROM MilkProduction WHERE id=:id')
  Future<MilkProduction> getAllMilkProductionById(int id);

  @Query('DELETE  FROM MilkProduction')
  Future<void> deleteAllMilkProduction();

  @insert
  Future<int> insertMilkProduction(MilkProduction MilkProduction);

  @update
  Future<void> updateMilkProduction(MilkProduction MilkProduction);

  @delete
  Future<void> deleteMilkProduction(MilkProduction MilkProduction);
}
