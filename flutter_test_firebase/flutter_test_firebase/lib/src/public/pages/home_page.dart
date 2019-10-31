import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection("users").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) return Text("Error obteniendo los datos");

              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Text("Esperando la información");
                default:
                  return ListView(
                    children: snapshot.data.documents
                        .map((DocumentSnapshot document) {
                      return ListTile(
                        title: Text(document["name"]),
                        subtitle: Text(document["email"]),
                      );
                    }).toList(),
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
