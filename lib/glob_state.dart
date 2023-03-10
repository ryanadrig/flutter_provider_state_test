import 'package:flutter/material.dart';
import 'package:provider_state_test/globs.dart';


// Widgets' global states
_GlobState_Child_1State? child_1_state;
_GlobState_Child_3State? child_3_state;

class GlobState_Child_1 extends StatefulWidget {
  const GlobState_Child_1({Key? key}) : super(key: key);

  @override
  _GlobState_Child_1State createState() {
    child_1_state = _GlobState_Child_1State();
    return child_1_state!;
  }
}


class _GlobState_Child_1State extends State<GlobState_Child_1> {

  @override
  Widget build(BuildContext context) {
    print("glob child 1 build");
    return Container(child:
    Text("Glob val ~ " + my_glob.toString())
    );
  }
}

class GlobState_Child_2 extends StatefulWidget {
  const GlobState_Child_2({Key? key}) : super(key: key);

  @override
  _GlobState_Child_2State createState() => _GlobState_Child_2State();
}

class _GlobState_Child_2State extends State<GlobState_Child_2> {

  @override
  Widget build(BuildContext context) {
    print("glob child 2 build");
    return Container(
        width: ss.width*.77,
        height: ss.width*.1,
        child: MaterialButton(
          color: Colors.blueAccent,
          onPressed: (){

            // We end up having to call setstate on each instance of global state everywhere
            my_glob = my_glob +1;
            child_1_state!.setState(() {
            });
            child_3_state!.setState(() {
            });
          },
          child: Text("change glob"),
        )
    );
  }
}

class GlobState_Child_3 extends StatefulWidget {
  const GlobState_Child_3({Key? key}) : super(key: key);

  @override
  _GlobState_Child_3State createState() {
    child_3_state = _GlobState_Child_3State();
    return child_3_state!;
  }
}

class _GlobState_Child_3State extends State<GlobState_Child_3> {
  @override
  Widget build(BuildContext context) {
    print("glob child 3 build");
    return Container(
        width: ss.width*.77,
        height: ss.width*.1,
        child: MaterialButton(
          color: Colors.blueAccent,
          onPressed: (){

            // calling setstate multiple times is cumbersome
            my_glob = my_glob +1;
            child_1_state!.setState(() {
            });
            child_3_state!.setState(() {
            });
          },
          child: Text("change glob from child 3 ~ " + my_glob.toString()),
        )
    );
  }
}