import 'package:hive/hive.dart';

class CvDatbase {
  List ResumeList = [];
  //refrence the box
  final _myBox = Hive.box('mybox');
  //first open app
  void createInitailData() {
    ResumeList = [];
  }

  // loading data from databse
  void loadData() {
    ResumeList = _myBox.get("TODOLIST");
  }

  //update the data

  void updateDAtabse() {
    _myBox.put('TODOLIST', ResumeList);
  }
}
