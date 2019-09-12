import 'package:flutter/material.dart';
import 'package:users_list/src/models/user_model.dart';

class AlertDialogUser extends StatefulWidget {
  final Function callback;
  final UserModel user;
  final int index;

  const AlertDialogUser({
    Key key,
    this.callback,
    this.user,
    this.index,
  }) : super(key: key);

  @override
  _AlertDialogUserState createState() => _AlertDialogUserState();
}

class _AlertDialogUserState extends State<AlertDialogUser> {
  final _keyForm = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      _nameController.text = widget.user.name;
      _occupationController.text = widget.user.occupation;
      _yearController.text = widget.user.years.toString();
      _dateController.text = widget.user.date.toString().split(" ")[0];
    }
  }

  @override
  void dispose() {
    _occupationController.dispose();
    _nameController.dispose();
    _yearController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Form(
          key: _keyForm,
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Text(
                widget.user == null ? 'Agregar usuario' : 'Actualizar ususario',
                style: TextStyle(fontSize: 24.0),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15.0),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  if (value.length == 0) {
                    return "Debe ingresar un nombre";
                  }

                  return null;
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _occupationController,
                decoration: InputDecoration(labelText: 'Ocupación'),
                validator: (value) {
                  if (value.length == 0) {
                    return "Debe ingresar una ocupación";
                  }

                  return null;
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _yearController,
                decoration: InputDecoration(labelText: 'Año'),
                validator: (value) {
                  if (value.length == 0) {
                    return "Debe ingresar un año";
                  }

                  if (int.tryParse(value) == null) {
                    return "Debe ingresar un número válido";
                  }

                  return null;
                },
              ),
              SizedBox(height: 10.0),
              GestureDetector(
                onTap: () {
                  _showDatePicker(context);
                },
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: _dateController,
                    decoration: InputDecoration(labelText: 'Fecha'),
                    validator: (value) {
                      if (value.length == 0) {
                        return "Debe ingresar una fecha";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                width: double.infinity,
                height: 60.0,
                child: RaisedButton(
                  color: Colors.greenAccent[400],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  textColor: Colors.white,
                  onPressed: _save,
                  child: Text(
                    widget.user == null ? 'Agregar' : 'Actualizar',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _save() {
    if (_keyForm.currentState.validate()) {
      final user = UserModel(
        name: _nameController.text,
        date: DateTime.parse(_dateController.text),
        occupation: _occupationController.text,
        years: int.parse(_yearController.text),
      );

      if (widget.user == null) {
        widget.callback(user);
      } else {
        widget.callback(user, widget.index);
      }

      Navigator.pop(context);
    }
  }

  void _showDatePicker(context) async {
    var currentDate = _dateController.text.isEmpty
        ? DateTime.now()
        : DateTime.parse(_dateController.text);

    final DateTime date = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(1995, 1, 20),
      lastDate: DateTime.now(),
    );

    if (date != null) {
      _dateController.text = date.toString().split(" ")[0];
    }
  }
}
