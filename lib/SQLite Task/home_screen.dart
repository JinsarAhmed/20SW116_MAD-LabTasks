// tasks done by 20sw116
import 'package:flutter/material.dart';
import 'package:madlabtasks_20sw116/SQLite%20Task/student.dart';
import 'db_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Database Application',
      home: StudentList(),
    );
  }
}

class StudentList extends StatefulWidget {
  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  final nameController = TextEditingController();
  final gradeController = TextEditingController();

  final studentmethods = DatabaseHelper();
  List<Student> students = [];

  void showEditStudentDialog(BuildContext context, Student student) {
    nameController.text = student.name;
    gradeController.text = student.grade;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Update Info"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                    labelText: 'Enter updated name of the student'),
              ),
              TextField(
                controller: gradeController,
                decoration: const InputDecoration(labelText: 'Updated Grade'),
              ),
              ElevatedButton(
                onPressed: () {
                  final name = nameController.text;
                  final grade = gradeController.text;

                  if (name.isNotEmpty && grade.isNotEmpty) {
                    final updatedStudent = Student(
                      id: student.id,
                      name: name,
                      grade: grade,
                    );

                    // Update the student in the database
                    studentmethods.updateStudent(updatedStudent);

                    // Clear the text fields
                    nameController.clear();
                    gradeController.clear();

                    fetchStudents();
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Update'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    fetchStudents();
  }

  void fetchStudents() async {
    students = await studentmethods.getStudents();
    setState(() {});
  }

  onSave(Student student) async {
    await studentmethods.insertStudent(student);
    fetchStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Students List'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return Card(
            elevation: 20.0,
            color: Colors.red[300],
            child: ListTile(
              onTap: () {
                showEditStudentDialog(context, student);
              },
              leading: CircleAvatar(backgroundColor: Colors.black),
              title: Text(student.name),
              subtitle: Text(student.grade),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  studentmethods.deleteStudent(student.id!);
                  fetchStudents();
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          nameController.clear();
          gradeController.clear();

          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Add Student Info"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                          labelText: 'Enter name of the student'),
                    ),
                    TextField(
                      controller: gradeController,
                      decoration: const InputDecoration(labelText: 'Grade'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        final name = nameController.text;
                        final grade = gradeController.text;

                        if (name.isNotEmpty && grade.isNotEmpty) {
                          onSave(Student(name: name, grade: grade));
                          Navigator.of(context).pop();
                        }
                      },
                      child: const Text('Save'),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
