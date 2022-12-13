import 'package:contents_buddy/model/contact.dart';
import 'package:flutter/material.dart';

import '../allservices/contactService.dart';

class EditContact extends StatefulWidget {
  final Contact contact;
  const EditContact({Key? key, required this.contact}) : super(key: key);

  @override
  State<EditContact> createState() => _EditContactState();
}

class _EditContactState extends State<EditContact> {
  var _contactNameController = TextEditingController();
  var _contactNumberController = TextEditingController();
  var _contactEmailController = TextEditingController();
  bool _verifyName = false;
  bool _verifyNumber = false;
  bool _verifyEmail = false;
  var _contactServices = ContactServices();

  @override
  void initState() {
    setState(() {
      _contactNameController.text = widget.contact.name ?? '';
      _contactNumberController.text = widget.contact.contact ?? '';
      _contactEmailController.text = widget.contact.email ?? '';
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Contact"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(17.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Edit Contact Details",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.purple,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const CircleAvatar(
                radius: 70,
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add_a_photo,
                      color: Colors.purple,
                      size: 35,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.deepOrange,
                      size: 35,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 28,
              ),
              TextField(
                controller: _contactNameController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "Name",
                  icon: const Icon(Icons.people),
                  labelText: 'Contact Name',
                  errorText: _verifyName ? 'Value can\'t be empty' : null,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextField(
                controller: _contactNumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "Number",
                  icon: const Icon(Icons.phone),
                  labelText: 'Contact Number',
                  errorText: _verifyNumber ? 'Value can\'t be empty' : null,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextField(
                controller: _contactEmailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "Email",
                  icon: const Icon(Icons.mail),
                  labelText: 'Contact Email',

                  errorText: _verifyEmail ? 'Value can\'t be empty' : null,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      _contactNameController.text = "";
                      _contactNumberController.text = "";
                      _contactEmailController.text = "";
                    },
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.deepOrange,
                        textStyle: const TextStyle(fontSize: 18)),
                    child: const Text("Clear Details"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            _contactNameController.text.isEmpty
                ? _verifyName = true
                : _verifyName = false;
            _contactNumberController.text.isEmpty
                ? _verifyNumber = true
                : _verifyNumber = false;
            _contactEmailController.text.isEmpty
                ? _verifyEmail = true
                : _verifyEmail = false;
          });
          if (_verifyName == false &&
              _verifyNumber == false &&
              _verifyEmail == false) {
            var _contact = Contact();

            _contact.id = widget.contact.id;
            _contact.name = _contactNameController.text;
            _contact.contact = _contactNumberController.text;
            _contact.email = _contactEmailController.text;
            var result = await _contactServices.updateContact(_contact);
            Navigator.pop(context, result);
          }
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
