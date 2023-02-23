# provider_state_test

A test of provider package and concrete example of why it's better than
using global state instances

In order to update multiple widgets in different parts of the app,

Instead of
```
child_1_state.my_glob;

child_2_state.my_glob;

   onChange(){
                my_glob = new_my_glob_val;

                child_1_state!.setState(() {
                });

                child_2_state!.setState(() {
                });
            }
```


We can much more succinctly for larger cases, use


```

${context.watch<ProvState>().count}
${context.watch<ProvState>().count}

context.read<ProvState>().increment();

```