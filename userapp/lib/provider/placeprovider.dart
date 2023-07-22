import 'dart:io';

import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:userapp/models/place.dart';

//to store data in the device we need to install 3 packages path_provider,path,sqflite

Future<Database> _getDatabase() async {
  //creating a local sql database o the device
  final dbpath = await sql.getDatabasesPath();
  //places.db can be changed to anyname with .db extension
  //then creating a dtabase with table user_places and table components
  final db = await sql.openDatabase(path.join(dbpath, 'places.db'),
      onCreate: (db, version) => db.execute(
          'CREATE TABLE user_places(id TEXTPRIMARY KEY,title TEXT,image TEXT)'),
      version: 1);
  return db;
}

class Placeprovider extends StateNotifier<List<Place>> {
  Placeprovider() : super(const []);

  //loading the local database of the device where we stored the table
  Future<void> loadplaces() async {
    final db = await _getDatabase();
    final data = await db.query('user_places');
    final places = data
        .map(
          (e) => Place(
            id: e['id'] as String,
            title: e['title'] as String,
            image: File(e['image'] as String),
          ),
        )
        .toList();

    state = places;
  }

  void addplace(String title, File image) async {
    //creating a path for the image that to be stored in the app
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final filename = path.basename(image.path);
    final copiedimage = await image.copy('${appDir.path}/$filename');

    final newplace = Place(title: title, image: copiedimage);

    final db = await _getDatabase();

    //inserting the value that we got from addscreen to the database
    db.insert('user_places', {
      'id': newplace.id,
      'title': newplace.title,
      'image': newplace.image.path
    });
    state = [newplace, ...state];
  }
}

// final userPlacesProvider =
//     StateNotifierProvider<UserPlacesNotifier, List<Place>>(
//         (ref) => UserPlacesNotifier());

final newplaceProvider =
    StateNotifierProvider<Placeprovider, List<Place>>((ref) => Placeprovider());
