import 'package:floor/floor.dart';

@entity
class Sale {
  @PrimaryKey(autoGenerate: true)
  int Id;
  final String date;
  final String name, itemName, Type;
  final String ItemPrice;
  final String purchasefrom;

  Sale(this.Id, this.date, this.name, this.ItemPrice, this.itemName, this.Type,
      this.purchasefrom);
}
