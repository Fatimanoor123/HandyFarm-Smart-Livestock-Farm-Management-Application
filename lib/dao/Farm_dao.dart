import 'package:floor/floor.dart';
import 'package:handyfarm/entity/farm.dart';

@dao
abstract class Farmdao{
  @Query
    ('Select * From farm')
  Future<List<Farm>> findAllFarm();
  @Query('SELECT * FROM farm WHERE id = :id')
  Future<Farm> findFarmById(int id);

  @insert
  Future<int> insertFarm(Farm farm);
}