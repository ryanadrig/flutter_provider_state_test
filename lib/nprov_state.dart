import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_test/globs.dart';

class NProvState with ChangeNotifier, DiagnosticableTreeMixin {
  int _count1 = 0;
  int get count1 => _count1;

  int _count2 = 0;
  int get count2 => _count2;

  void increment_count1() {
    _count1++;
    notifyListeners();
  }

  void increment_count2() {
    _count2++;
    notifyListeners();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    // properties.add(IntProperty('count', count));
    // properties.add(IntProperty('count', count));
  }
}


class NProvState2 with ChangeNotifier, DiagnosticableTreeMixin {
  int _count = 0;
  int get count => _count;


  void increment_count() {
    _count++;
    notifyListeners();
  }


  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    // properties.add(IntProperty('count', count));
    // properties.add(IntProperty('count', count));
  }
}



class NProvState_Child_1 extends StatefulWidget {
  const NProvState_Child_1({Key? key}) : super(key: key);

  @override
  _NProvState_Child_1State createState() => _NProvState_Child_1State();
}

class _NProvState_Child_1State extends State<NProvState_Child_1> {


  @override
  Widget build(BuildContext context) {
    print("nprov child 1 build");
    nprov_watcher_state!.nprov_rebuilt += "child 1";
    Future.delayed(Duration.zero,(){
      nprov_watcher_state!.setState(() {});
    });


    return Container(
        child:Text('NProv count ( 1, 2 ) ~ ( ${context.watch<NProvState>().count1}, ${context.watch<NProvState>().count2})',));
  }
}

class NProvState_Child_2 extends StatefulWidget {
  const NProvState_Child_2({Key? key}) : super(key: key);

  @override
  _NProvState_Child_2State createState() => _NProvState_Child_2State();
}

class _NProvState_Child_2State extends State<NProvState_Child_2> {




  @override
  Widget build(BuildContext context) {
    print("nprov child 2 build");
    nprov_watcher_state!.nprov_rebuilt += "child 2";
    Future.delayed(Duration.zero,(){
      nprov_watcher_state!.setState(() {});
    });



    return Column(children:[Container(
        width: ss.width*.77,
        height: ss.width*.1,
        child: MaterialButton(
          color: Colors.blueAccent,
          onPressed: (){

            context.read<NProvState>().increment_count1();
          },
          child: Text("change count 1 val " + '${context.watch<NProvState>().count1}'),
        )
    ),

      // forces rebuild of children 1 and 2 even though no references to count2
      NProvState_Child_3(),

      // only rebuilds itself
      LocalState_Child_3(),

      NProvState_Child_4(),

      build_child_logger!


    ]);
  }
}


class NProvState_Child_3 extends StatefulWidget {
  const NProvState_Child_3({Key? key}) : super(key: key);

  @override
  _NProvState_Child_3State createState() => _NProvState_Child_3State();
}

class _NProvState_Child_3State extends State<NProvState_Child_3> {
  int local_count2 = 0;

  @override
  Widget build(BuildContext context) {
    print("nprov child 3 build");
    nprov_watcher_state!.nprov_rebuilt += "child 3";
    Future.delayed(Duration.zero,(){
      nprov_watcher_state!.setState(() {});
    });


    return Container(
        width: ss.width*.77,
        height: ss.width*.1,
        child: MaterialButton(
          color: Colors.blueAccent,
          onPressed: (){
            context.read<NProvState>().increment_count2();
          },
          child:
          Text("change count 2 val from child 3 ~ " + '${context.watch<NProvState>().count2}'),
        )
    );
  }
}

class LocalState_Child_3 extends StatefulWidget {
  const LocalState_Child_3({Key? key}) : super(key: key);

  @override
  LocalState_Child_3State createState() => LocalState_Child_3State();
}

class LocalState_Child_3State extends State<LocalState_Child_3> {
  int local_count2 = 0;

  @override
  Widget build(BuildContext context) {
    print("local child 3 build");
      nprov_watcher_state!.nprov_rebuilt += "locchild 3";
    Future.delayed(Duration.zero,(){
      nprov_watcher_state!.setState(() {});
    });


    return Container(
        width: ss.width*.77,
        height: ss.width*.1,
        child: MaterialButton(
          color: Colors.blueAccent,
          onPressed: (){
            // Again only one method
            // context.read<NProvState>().increment_count2();
            setState(() {
              local_count2 +=1;
            });
          },
          child:
          // Text("change count 2 val from child 3" + '${context.watch<NProvState>().count2}'),
          Text("change count 2 val from locchild 3 ~ " + '${local_count2}'),
        )
    );
  }
}


// Now we try sparate provider still nested, which only rebuilds itself
class NProvState_Child_4 extends StatefulWidget {
  const NProvState_Child_4({Key? key}) : super(key: key);

  @override
  _NProvState_Child_4State createState() => _NProvState_Child_4State();
}

class _NProvState_Child_4State extends State<NProvState_Child_4> {
  int local_count2 = 0;

  @override
  Widget build(BuildContext context) {
    print("nprov child 4 build");
    nprov_watcher_state!.nprov_rebuilt += "child 4";
    Future.delayed(Duration.zero,(){
      nprov_watcher_state!.setState(() {});
    });


    return Container(
        width: ss.width*.77,
        height: ss.width*.1,
        child: MaterialButton(
          color: Colors.blueAccent,
          onPressed: (){
            context.read<NProvState2>().increment_count();
          },
          child:
          Text("change count val from child 4 ~ " + '${context.watch<NProvState2>().count}'),
        )
    );
  }
}

NProv_Rebuild_Watcher? build_child_logger;
_NProv_Rebuild_WatcherState? nprov_watcher_state;

class NProv_Rebuild_Watcher extends StatefulWidget {
  const NProv_Rebuild_Watcher({Key? key}) : super(key: key);

  @override
  _NProv_Rebuild_WatcherState createState(){
  nprov_watcher_state =     _NProv_Rebuild_WatcherState();
  return nprov_watcher_state!;
  }
  }


class _NProv_Rebuild_WatcherState extends State<NProv_Rebuild_Watcher> {
  String nprov_rebuilt = "";


  @override
  Widget build(BuildContext context) {
    print("Watcher build");
    return
      Container(child:
      Column(children:[
      Container(child: Text(nprov_watcher_state!.nprov_rebuilt)),
    Container(
        width: ss.width*.77,
        height: ss.width*.1,
        child: MaterialButton(
          color: Colors.blueAccent,
          onPressed: (){
    setState(() {
    nprov_watcher_state!.nprov_rebuilt = "";
    });
          },
          child:
          Text("Reset child build watcher"),
        )
    )]));
  }
}

