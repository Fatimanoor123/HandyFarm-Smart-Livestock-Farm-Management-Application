import 'package:handyfarm/entity/Expense.dart';
import 'package:handyfarm/entity/Sale.dart';
import 'package:floor/floor.dart';

@dao
abstract class SaleDAO {
  @Query('SELECT * FROM Sale')
  Future<List<Sale>> getAllSale();

  @Query('SELECT * FROM Sale WHERE id=:id')
  Future<Sale> getAllSaleById(int id);

  @Query('DELETE  FROM Sale')
  Future<void> deleteAllSale();

  @insert
  Future<int> insertSale(Sale Sale);

  @update
  Future<void> updateSale(Sale Sale);

  @delete
  Future<void> deleteSale(Sale Sale);
}
