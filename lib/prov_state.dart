import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_test/globs.dart';

class ProvState with ChangeNotifier, DiagnosticableTreeMixin {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', count));
  }
}

class ProvState_Child_1 extends StatefulWidget {
  const ProvState_Child_1({Key? key}) : super(key: key);

  @override
  _ProvState_Child_1State createState() => _ProvState_Child_1State();
}

class _ProvState_Child_1State extends State<ProvState_Child_1> {
  @override
  Widget build(BuildContext context) {
    print("prov child 1 build");
    return Container(
      child:Text('Prov val ~ ${context.watch<ProvState>().count}',));
  }
}

class ProvState_Child_2 extends StatefulWidget {
  const ProvState_Child_2({Key? key}) : super(key: key);

  @override
  _ProvState_Child_2State createState() => _ProvState_Child_2State();
}

class _ProvState_Child_2State extends State<ProvState_Child_2> {
  @override
  Widget build(BuildContext context) {
    print("prov child 2 build");
    return Container(
        width: ss.width*.77,
        height: ss.width*.1,
        child: MaterialButton(
          color: Colors.blueAccent,
          onPressed: (){

            // With Provider all we need to do is access a BuildContext with the state instance
            context.read<ProvState>().increment();
          },
          child: Text("change prov val"),
        )
    );
  }
}


class ProvState_Child_3 extends StatefulWidget {
  const ProvState_Child_3({Key? key}) : super(key: key);

  @override
  _ProvState_Child_3State createState() => _ProvState_Child_3State();
}

class _ProvState_Child_3State extends State<ProvState_Child_3> {
  @override
  Widget build(BuildContext context) {
    print("prov child 3 build");
    return Container(
        width: ss.width*.77,
        height: ss.width*.1,
        child: MaterialButton(
          color: Colors.blueAccent,
          onPressed: (){
            // Again only one method
            context.read<ProvState>().increment();
          },
          child: Text("change prov val from child 3 ~ " + '${context.watch<ProvState>().count}'),
        )
    );
  }
}
