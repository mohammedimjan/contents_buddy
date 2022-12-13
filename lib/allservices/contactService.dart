import 'package:contents_buddy/database/repo.dart';
import 'package:contents_buddy/model/contact.dart';



class ContactServices {
  late Repository _repository;
  ContactServices() {
    _repository = Repository();
  }
  //save
  SaveContact(Contact contact) async {
    return await _repository.insertData("contacts", contact.contactMap());
  }
  //Read

  readAllContacts() async {
    return await _repository.readData("contacts");
  }

  updateContact(Contact contact) async {
    return await _repository.updateContact("contacts", contact.contactMap());
  }

  deleteUser(contactId) async {
    return await _repository.deletContact('contacts', contactId);
  }

}


