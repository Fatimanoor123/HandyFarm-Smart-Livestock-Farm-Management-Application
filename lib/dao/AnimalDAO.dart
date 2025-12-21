import 'package:floor/floor.dart';
import 'package:handyfarm/entity/Animal.dart';

@dao
abstract class AnimalDAO {
  @Query('SELECT * FROM Animal')
  Future<List<Animal>> getAllAnimal();

  @Query('SELECT * FROM Animal WHERE id=:id')
  Future<Animal> getAllAnimalById(int id);

  @Query('DELETE  FROM Animal')
  Future<void> deleteAllAnimal();

  @insert
  Future<int> insertAnimal(Animal Animal);

  @update
  Future<void> updateAnimal(Animal Animal);

  @delete
  Future<void> deleteAnimal(Animal Animal);
}
