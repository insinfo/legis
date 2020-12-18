import 'package:mongo_dart/mongo_dart.dart';
import 'package:legis_server/db_config.dart';

Db db;
//DbCollection legisCollection;

void dbConnect() async {
  if (db == null) {
    db = Db("mongodb://${mongodbConInfo.host}:${mongodbConInfo.port}/${mongodbConInfo.database}");
    await db.open();
    //legisCollection = db.collection('leis');
    print('db_connect.dart mongodbConInfo ${mongodbConInfo.host}');
  }
}
