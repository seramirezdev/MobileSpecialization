import 'package:flutter/material.dart';
import 'package:http_test/src/models/photo_model.dart';
import 'package:http_test/src/repositories/photos_repository.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PhotosRepository _photosRepository = PhotosRepository();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de fotos'),
      ),
      body: Center(
        child: Container(
            child: FutureBuilder<List<PhotoModel>>(
          future: _photosRepository.getList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return createList(snapshot.data);
            } else {
              return CircularProgressIndicator();
            }
          },
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _photosRepository.addPhoto(null);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget createList(List<PhotoModel> photos) {
    return ListView.builder(
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(photos[index].title),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(photos[index].thumbnailUrl),
          ),
        );
      },
    );
  }
}
