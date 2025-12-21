import 'package:floor/floor.dart';

@entity
abstract class Medicine {
  @PrimaryKey(autoGenerate: true)
  int MedicineId;
  final String Name;
  final String Type;
  Medicine(this.MedicineId, this.Type, this.Name);
}
