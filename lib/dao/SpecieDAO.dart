import 'package:floor/floor.dart';
import 'package:handyfarm/entity/Specie.dart';

@dao
abstract class SpecieDAO {
  @Query('SELECT * FROM Specie')
  Stream<List<Specie>> getAllSpecie();

  @Query('SELECT * FROM Specie WHERE id=:id')
  Future<Specie> getAllSpecieById(int id);

  @Query('DELETE  FROM Specie')
  Future<void> deleteAllSpecie();

  @insert
  Future<int> insertSpecie(Specie Specie);

  @update
  Future<void> updateSpecie(Specie Specie);

  @delete
  Future<void> deleteSpecie(Specie Specie);
}
