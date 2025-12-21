import 'package:floor/floor.dart';

@entity
class Specie {
  @primaryKey
  int SpecieId;
  final String Name;
  Specie(this.Name);
}
