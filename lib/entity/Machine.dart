import 'package:floor/floor.dart';

@entity
class Machine {
  @PrimaryKey(autoGenerate: true)
  int Id;

  final String Machinename, MachineType, PurchaseDate;
  final String MachinePrice;

  Machine(this.Id, this.Machinename, this.MachineType, this.PurchaseDate,
      this.MachinePrice);
}
