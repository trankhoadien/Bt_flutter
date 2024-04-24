import 'package:flutter/material.dart';

class Card_button extends StatelessWidget {
 Card_button({
    super.key,
    required this.addTask,
  });
  final Function addTask;
  TextEditingController controller = TextEditingController();
  void _Onclick (BuildContext context) {
      final name = controller.text;
      if(name.isEmpty) {
        return;
      } 
      addTask(name);
      Navigator.pop(context);
    }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            TextField (
              controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Your task',
            ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(onPressed: () => _Onclick(context),
              child: Text('And task', style: TextStyle(color: Colors.blue),),
              ),
              ),
          ],
        ),
      ),
    );
  }
}