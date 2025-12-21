import 'package:floor/floor.dart';
import 'package:handyfarm/entity/Gallery.dart';

@dao
abstract class GalleryDAO {
  @Query('SELECT * FROM Gallery')
  Stream<List<Gallery>> getAllGallery();

  @Query('SELECT * FROM Gallery WHERE id=:id')
  Stream<Gallery> getAllGalleryById(int id);

  @Query('DELETE  FROM Gallery')
  Stream<void> deleteAllGallery();

  @insert
  Future<void> insertGallery(Gallery Gallery);

  @update
  Future<void> updateGallery(Gallery Gallery);

  @delete
  Future<void> deleteGallery(Gallery Gallery);
}
