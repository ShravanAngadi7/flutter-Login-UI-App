import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:login_page/widgets/AppDrawer.dart';

import '../widgets/resumetile.dart';
import '../widgets/database.dart';
import '../widgets/dailog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference of the box
  final _mybox = Hive.box('mybox');
  CvDatbase db = CvDatbase();

  @override
  void initState() {
    //if this is opened first time
    if (_mybox.get('TODOLIST') == null) {
      db.createInitailData();
    } else {
      //already exists data
      db.loadData();
    }
    super.initState();
  }

  //text controller
  final _controller = TextEditingController();

  //---------------------------
  //List toDo tasks
  // List toDoList = [
  //   ['Make Tutorial', false],
  //   ['gotta gym', false],
  // ];

  // checck box changed
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.ResumeList[index][1] = !db.ResumeList[index][1];
    });
    db.updateDAtabse();
  }

  //delete a task
  void deleteTask(int index) {
    setState(() {
      db.ResumeList.removeAt(index);
    });
    db.updateDAtabse();
  }

  //save newtask/
  void saveNewTask() {
    setState(() {
      db.ResumeList.add([_controller.text.trim(), false]);
      // db.ResumeList.add(ImageIcon);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDAtabse();
  }

  // create a new task
  void createnewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DailogBox(
          controller: _controller,
          onSaved: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Resume List',
          style: TextStyle(
            fontSize: 20,
            //fontWeight: FontWeight.w500,
          ),
        ),
        elevation: 0,
      ),
      drawer: AppDrawer(),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add a Resume',
        onPressed: createnewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.ResumeList.length,
        itemBuilder: (context, index) {
          return ResumeTile(
            taskName: db.ResumeList[index][0],
            taskCompleted: db.ResumeList[index][1],
            Onchanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (value) => deleteTask(index),
          );
        },
      ),
    );
  }
}
