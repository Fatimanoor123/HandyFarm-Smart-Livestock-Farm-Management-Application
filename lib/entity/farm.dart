import 'package:floor/floor.dart';
@entity
class Farm{
@PrimaryKey( autoGenerate: true)
   int FarmId;
  final String date;
  final String farmName, farmAddress;
  Farm( this.date, this.farmName, this.farmAddress);


}