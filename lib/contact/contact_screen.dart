import 'package:api_default_project/data/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User contact'),
      ),
      body: ReorderableListView(
        children: [
          ...List.generate(contact.length, (index) {
            ContactModel contactModel = contact[index];
            return Dismissible(
            background: Container(
              margin:const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey)
              ),
              child: Row(
                children: [
                 const Spacer(),
                 const Icon(Icons.restore_from_trash_outlined,color: Colors.white,),
                  SizedBox(width: 20.w,)
                ],
              ),
            ),
            key: ValueKey<int>(index),
            onDismissed: (DismissDirection direction) {
              setState(() {
                contact.removeAt(index);
              });
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey)
              ),
              child: ListTile(
                title: Text(contactModel.name),
                trailing: Text(contactModel.date),
                subtitle: Text(contactModel.phone,style: TextStyle(fontSize: 16.sp),),
              ),
            ),
          );
          }
          ),
          
        ],
        onReorder: (int oldIndex, int newIndex) {  
           setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final ContactModel item = contact.removeAt(oldIndex);
          contact.insert(newIndex, item);
        });
        },
      ),
    );
  }
}