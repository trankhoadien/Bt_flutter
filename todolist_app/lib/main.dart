import 'package:flutter/material.dart';
import 'Modal/item.dart';
import 'widget/card_body_wiget.dart';
import 'widget/card_button.dart';

void main(List<String> args) {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Myapp(),
  ));
}
class Myapp extends StatefulWidget {
     Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  final List<DataItems> items = [
    
  ];

    void _handleAddtask (String name) {
      final newItems = DataItems(id: DateTime.now().toString(), name: name);
      setState(() {
        items.add(newItems);
      });
      
    }
    
    void _handleDeleteTask(String id) {
      
      setState(() {
         items.removeWhere((item) => item.id == id);
      });
    }

  @override
  Widget build(BuildContext context) {
    print('requied');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ToDoList', style: TextStyle(fontSize: 40),),
        backgroundColor: Color.fromARGB(255, 83, 212, 229),
      ),
      
      body:  SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        
        child: Column(
          children: items.map((item) => CardBody(
            index: items.indexOf(item),
            item : item, 
            handleDelete: _handleDeleteTask)).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.amber,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          context: context,
          builder: (BuildContext content) {
          return Card_button(addTask: _handleAddtask);
        });
      },
      child: Icon(Icons.add, size: 40,),
      ),
    );
  }
}


