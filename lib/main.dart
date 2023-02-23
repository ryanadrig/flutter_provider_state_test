import 'package:flutter/material.dart';
import 'package:provider_state_test/globs.dart';
import 'package:provider_state_test/glob_state.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Provider_Test_Root()
    );
  }
}



class Provider_Test_Root extends StatefulWidget {
  const Provider_Test_Root({Key? key}) : super(key: key);

  @override
  _Provider_Test_RootState createState() => _Provider_Test_RootState();
}

class _Provider_Test_RootState extends State<Provider_Test_Root> {


  @override
  Widget build(BuildContext context) {
    ss = MediaQuery.of(context).size;
    return SafeArea(child:Scaffold(
      body: Container(
        height: ss.height,
      child: Column(children: [

        GlobState_Child_1(),
        GlobState_Child_2(),
        GlobState_Child_3()

      ],),
      ),
    ));
  }
}


