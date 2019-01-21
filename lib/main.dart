import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:untitled/bloc.dart';
import 'package:untitled/pagetwo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Body(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  submit(BuildContext context){
    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
      return new PageTwo();
    }));
  }
  final bloc = Bloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new SingleChildScrollView(
        child: new Container(
          padding: EdgeInsets.symmetric(vertical: 300, horizontal: 20),
          child: Center(
            child: new Column(
              children: <Widget>[
                StreamBuilder<String>(
stream:bloc.email
                  ,builder: (BuildContext context,AsyncSnapshot snapshot){
                    return new TextField(
onChanged: bloc.emailChanged,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "enter your email",
                          errorText: snapshot.error
                      ),
                    );
                  },
                ),
                new SizedBox(height: 20),
              StreamBuilder<String>(
                stream: bloc.password,
                  builder: (context, snapshot)=>
                  new TextField(
onChanged: bloc.passwordChanged,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "enter your pasword",
                      errorText: snapshot.error
                    ),
                  ),
                ),
                new SizedBox(height: 20),
                StreamBuilder<bool>(
                  stream: bloc.submitCheck,
                  builder: (context, AsyncSnapshot snapshot){
                    return new RaisedButton(
                      child: new Text("submit"),
                      onPressed: snapshot.hasData ?()=>submit(context) : null,
                      color: Colors.blue,
                      textColor: Colors.white,
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
