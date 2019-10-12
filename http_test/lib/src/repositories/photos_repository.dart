import 'package:http_test/src/models/photo_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String BASE_URL = "https://jsonplaceholder.typicode.com/";
const String ENDPOINT_PHOTOS = "photos";
const HEADERS = {'Content-Type': 'application/json'};

class PhotosRepository {
  Future<List<PhotoModel>> getList() async {
    final url = BASE_URL + ENDPOINT_PHOTOS;
    List<PhotoModel> photos = [];
    var client = http.Client();
    try {
      final response = await client.get(url, headers: HEADERS);

      if (response.statusCode == 200) {
        photos = decodeJson(response.body);
      }
    } catch (e) {
      print(e.toString());
    } finally {
      client.close();
    }

    return photos;
  }

  Future<PhotoModel> addPhoto(PhotoModel ph) async {
    final url = BASE_URL + ENDPOINT_PHOTOS;
    var client = http.Client();

    var photo = PhotoModel(
        albumId: 1,
        thumbnailUrl: "https://via.placeholder.com/150/56a8c2",
        title: "Imagen creada",
        url: "https://via.placeholder.com/600/56a8c2");

    PhotoModel pho;
    try {
      final response =
          await client.post(url, body: photo.toJson(), headers: HEADERS);
      print(response.body);

      /*if (response.statusCode == 201) {
        Map<String, dynamic> data = json.decode(response.body);
        pho = PhotoModel.fromJson(data);
      }*/
    } catch (e) {
      print(e.toString());
    } finally {
      client.close();
    }

    return pho;
  }

  List<PhotoModel> decodeJson(String data) {
    List photos = json.decode(data);
    return photos.map((item) => PhotoModel.fromMap(item)).toList();
  }
}
