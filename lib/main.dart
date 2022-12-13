import 'package:contents_buddy/allservices/contactService.dart';
import 'package:contents_buddy/pages/addContacts.dart';
import 'package:contents_buddy/pages/editContact.dart';
import 'package:contents_buddy/pages/viewContact.dart';
import 'package:flutter/material.dart';

import 'model/contact.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Contact> _contactList;
  final _contactService = ContactServices();

  getAllContactDetails() async {
    var contacts = await _contactService.readAllContacts();
    _contactList = <Contact>[];
    contacts.forEach((contact) {
      setState(() {
        var contactModel = Contact();
        contactModel.id = contact['id'];
        contactModel.name = contact['name'];
        contactModel.contact = contact['contact'];
        contactModel.email = contact['email'];
        _contactList.add(contactModel);
      });
    });
  }

  @override
  void initState() {
    getAllContactDetails();
    super.initState();
  }

  _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  deleteAlertBox(BuildContext context, userId){
    return showDialog(context: context, builder: (args){
      return AlertDialog(
        title: const Text("Click Delete or Cancel", style: TextStyle(
          color: Colors.deepOrange,
          fontSize: 20
        ),),
        actions: [
              TextButton(style:  TextButton.styleFrom(
                backgroundColor: Colors.deepOrange,
              ),
                  onPressed: () async {
                var val = await _contactService.deleteUser(userId);

                if (val != null)
                {
                  getAllContactDetails();
                    _showSuccessSnackBar('Contact Deleted Successfully');
                    Navigator.pop(context);
                  }
                  }, child:

                  const Text('Delete Contact', style: TextStyle(
                    color: Colors.white,
                  ) ,) ),
              IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.purple,
                  ),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close))
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contents Buddy"),
        actions: [
          IconButton(onPressed: (){
            showSearch(context: context,
                delegate: CustomSearchDelegate(),);
          },
              icon: const Icon(Icons.search))
        ],
      ),
      body: ListView.builder(
          itemCount: _contactList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewContact(
                                contact: _contactList[index],
                              )));
                },
                leading: CircleAvatar(
                  backgroundColor: Colors.red,
                ),
                title: Text(_contactList[index].name ?? ''),
                subtitle: Text(_contactList[index].contact ?? ''),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditContact(
                                      contact: _contactList[index],
                                    ))).then((data){
                                      if(data != null){
                                        getAllContactDetails();
                                        _showSuccessSnackBar('Contact Edited Successfully');
                                      }
                        });
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.purple,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        deleteAlertBox(context,_contactList[index].id);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddContact()))
              .then((data) => {
                    if (data != null)
                      {
                        getAllContactDetails(),
                        _showSuccessSnackBar('Contact Added Successfully'),
                      }
                  });
        },
        child: const Icon(Icons.supervised_user_circle),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {


  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
}



