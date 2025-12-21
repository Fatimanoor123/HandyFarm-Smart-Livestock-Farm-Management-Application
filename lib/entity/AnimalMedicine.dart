import 'package:floor/floor.dart';

@entity
class AnimalMedicine {
  @PrimaryKey(autoGenerate: true)
  int Id;

  final String Name, Type, Reasons, Symptoms;

  AnimalMedicine(this.Id, this.Symptoms, this.Reasons, this.Name, this.Type);
}
