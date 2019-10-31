import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final usersRef = Firestore.instance.collection("users");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _toolbar(),
      body: StreamBuilder<QuerySnapshot>(
        stream: usersRef.snapshots(),
        builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error.toString());
            return Text("Ha ocurrido un error");
          }

          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              return _loadListUser(snapshot.data.documents);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saveUser,
        child: Icon(Icons.add),
      ),
    );
  }

  void _saveUser() async {
    DocumentReference userCreated = await usersRef.add({
      "name": "Prueba",
      "email": "prueba@gmail",
      "phone": 3221568452
    });
    userCreated.updateData({"id": userCreated.documentID});
    userCreated.delete();
  }

  Widget _toolbar() {
    return AppBar(
      title: Text("Lista de usuarios"),
      centerTitle: true,
    );
  }

  Widget _loadListUser(List<DocumentSnapshot> userList) {
    return ListView(
      children: userList.map((item) {
        return ListTile(
          title: Text(item.data["name"] ?? "Undefined"),
          subtitle: Text(item.data["email"] ?? "Undefined"),
        );
      }).toList(),
    );
  }
}
