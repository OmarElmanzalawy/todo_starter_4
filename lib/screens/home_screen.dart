import 'package:flutter/material.dart';
import 'package:todo_starter/main.dart';
import 'package:todo_starter/models/task_model.dart';
import 'package:todo_starter/widgets/add_task_sheet.dart';
import 'package:todo_starter/widgets/custom_textfield.dart';
import 'package:todo_starter/widgets/task_item.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  final String geag = "";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

   final TextEditingController _titleController = TextEditingController();
   final TextEditingController _descriptionController = TextEditingController();

   @override
  void initState(){
    
    print(vm.tasks);
    WidgetsBinding.instance.addPostFrameCallback((_)async{
      await vm.getTasks();
      setState(() {
        
      });
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{


          //Show bottom sheet

          final TaskModel? model = await showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            isDismissible: false,
            builder:(context) {

            return AddTaskSheet();
              
            },
          );
            if(model == null){
              return;
            }
            
          vm.addTask(model);
          setState(() {
            
          });

        },
        child: Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
        ),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Todo Screen"),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: (){

              showDialog(
                context: context,
                builder:(context) {
                  return AlertDialog(
                    icon: Icon(Icons.warning),
                    title: Text("Delete All?"),
                    content: Text("Are you sure you want to delete all tasks"),
                    actions: [
                      TextButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        child: Text("Cancel")),
                      TextButton(onPressed: ()async{
                        await vm.deleteAllTasks();
                        setState(() {
                          
                        });
                        Navigator.pop(context);
                      }, child: Text("Delete",style: TextStyle(color: Colors.red),)),
                    ],
                  );
                },
              );

            },
             icon: Icon(Icons.delete)
             ),
          IconButton(onPressed: (){}, icon: Icon(Icons.logout))
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(top: 20),
        itemCount: vm.tasks.length,
        itemBuilder: (context, index) {
          final model = vm.tasks[index];
          return TaskItem(
            model: model,
            onRemove: ()async{

                // 
                final index = vm.tasks.indexWhere(
                  (task) => task.id == model.id
                );

                await vm.deleteTask(index);

                setState(() {
                  
                });


},
          );
        },
      )
    );
  }
}