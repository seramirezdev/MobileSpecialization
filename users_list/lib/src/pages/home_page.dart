import 'package:flutter/material.dart';
import 'package:users_list/src/models/user_model.dart';
import 'package:users_list/src/pages/widgets/alert_dialog_user.dart';
import 'package:users_list/src/pages/widgets/button_rounded.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var con;

  @override
  Widget build(BuildContext context) {
    con = context;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            _toolbar(),
            Expanded(
              child: _userList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _toolbar() => Material(
        elevation: 8.0,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      'List Users',
                      style: TextStyle(
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                  ButtonRounded(
                    background: Colors.greenAccent[400],
                    icon: Icons.add,
                    onTap: _showAlertAddUser,
                  )
                ],
              ),
              SizedBox(height: 15.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Search user',
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ],
          ),
        ),
      );

  Widget _userList() {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return _userItem(users[index], index);
      },
    );
  }

  Widget _userItem(UserModel user, int index) {
    final date = '${user.date.year}-${user.date.month}-${user.date.day}';

    final title = Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(user.name),
        Container(
          decoration: BoxDecoration(
              color: Colors.greenAccent[400], shape: BoxShape.circle),
          padding: EdgeInsets.all(8.0),
          margin: EdgeInsets.only(left: 10.0),
          child: Text(user.years.toString(),
              style: TextStyle(color: Colors.white)),
        ),
      ],
    );

    final actions = Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(date),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            InkWell(
              onTap: () {
                _showAlertUpdateUser(user, index);
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(
                  Icons.update,
                  color: Colors.orange,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _deleteUser(index);
              },
              splashColor: Colors.red[400],
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ],
    );

    return ListTile(
      title: title,
      subtitle: Text(user.occupation),
      trailing: actions,
      leading: CircleAvatar(
        backgroundColor: Colors.blue,
        child: Text(user.name.substring(0, 1)),
      ),
    );
  }

  void _showAlertAddUser() {
    showDialog(
      context: con,
      builder: (context) {
        return AlertDialogUser(callback: _addUserToList);
      },
    );
  }

  void _addUserToList(UserModel user) {
    setState(() {
      users.add(user);
    });
  }

  void _updateUser(user, index) {
    setState(() {
      users[index] = user;
    });
  }

  void _deleteUser(int index) {
    setState(() {
      users.removeAt(index);
    });
  }

  void _showAlertUpdateUser(user, index) {
    showDialog(
      context: con,
      builder: (context) {
        return AlertDialogUser(
          callback: _updateUser,
          user: user,
          index: index,
        );
      },
    );
  }
}
