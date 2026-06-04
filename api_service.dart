import 'package:http/http.dart' as http;
import 'package:learn_api/album_model.dart';

Future<List<Album>> fetchAlbumList() async {
  http.Response response = await http.get(
    Uri.parse("https://jsonplaceholder.typicode.com/albums/"),
  );

  if (response.statusCode == 200) {
    return albumFromJson(response.body);
  } else {
    throw Exception('');
  }
}
