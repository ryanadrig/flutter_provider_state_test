import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:provider_state_test/globs.dart';
import 'package:provider_state_test/glob_state.dart';
import 'package:provider_state_test/prov_state.dart';
import 'package:provider_state_test/nprov_state.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProvState()),
        ChangeNotifierProvider(create: (_) => NProvState()),
      ],
      child:MyApp()));
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
      body:
          Container(height:ss.height,
      child:ListView(children:[
      Padding(
        padding: EdgeInsets.symmetric(vertical: ss.height*.01),
    child:Container(
      padding: EdgeInsets.symmetric(vertical: ss.height*.01),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width:2.0, color: Colors.blue),
              bottom: BorderSide(width:2.0, color: Colors.blue)
          )
        ),
        // height: ss.height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [


        Text("Global State Method Lifts state but cumbersome"),
        GlobState_Child_1(),
        GlobState_Child_2(),
        GlobState_Child_3(),

      ],),
      )),
      Padding(
          padding: EdgeInsets.symmetric(vertical: ss.height*.01),
          child:Container(
            padding: EdgeInsets.symmetric(vertical: ss.height*.01),
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(width:2.0, color: Colors.blue),
                    bottom: BorderSide(width:2.0, color: Colors.blue)
                )
            ),
            // height: ss.height,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [


                Text("Provider lifts state with less code sprawl"),
                ProvState_Child_1(),
                ProvState_Child_2(),
                ProvState_Child_3(),

              ],),
          )),

        Padding(
            padding: EdgeInsets.symmetric(vertical: ss.height*.01),
            child:Container(
              padding: EdgeInsets.symmetric(vertical: ss.height*.01),
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(width:2.0, color: Colors.blue),
                      bottom: BorderSide(width:2.0, color: Colors.blue)
                  )
              ),
              // height: ss.height,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [


                  Text("Looking at rebuild behavior of nested provider"),
                  NProvState_Child_1(),
                  NProvState_Child_2(),

                ],),
            )),

    ])

    )));
  }
}


