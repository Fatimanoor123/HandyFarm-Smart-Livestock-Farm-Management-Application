import 'package:floor/floor.dart';
@entity
class Gallery{
  @primaryKey
  final int ImageId;

  final String date;
  Gallery(this.ImageId, this.date);


}