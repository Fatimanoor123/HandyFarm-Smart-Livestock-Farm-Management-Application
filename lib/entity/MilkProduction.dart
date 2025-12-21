import 'package:floor/floor.dart';

@entity
class MilkProduction {
  @PrimaryKey(autoGenerate: true)
  int Id;

  final String MilkType;
  final String TotalMilkProduce, TotalMilkSale;
  final String cattle;
  final String date;
  MilkProduction(this.Id, this.MilkType, this.TotalMilkProduce,
      this.TotalMilkSale, this.cattle, this.date);
}
