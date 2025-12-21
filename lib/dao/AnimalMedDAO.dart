import 'package:floor/floor.dart';

import 'package:handyfarm/entity/AnimalMedicine.dart';

@dao
abstract class AnimalMedicineDAO {
  @Query('SELECT * FROM AnimalMedicine')
  Future<List<AnimalMedicine>> getAllAnimalMedicine();

  @Query('SELECT * FROM AnimalMedicine WHERE id=:id')
  Future<AnimalMedicine> getAllAnimalMedicineById(int id);

  @Query('DELETE  FROM AnimalMedicine')
  Future<void> deleteAllAnimalMedicine();

  @insert
  Future<int> insertAnimalMedicine(AnimalMedicine AniMedicine);

  @update
  Future<void> updateAnimalMedicine(AnimalMedicine AniMedicine);

  @delete
  Future<void> deleteAnimalMedicine(AnimalMedicine AniMedicine);
}
