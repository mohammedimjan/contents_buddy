import 'package:flutter/material.dart';

import '../model/contact.dart';

class ViewContact extends StatefulWidget {
  final Contact contact;
  const ViewContact({Key? key, required this.contact}) : super(key: key);

  @override
  State<ViewContact> createState() => _ViewContactState();
}

class _ViewContactState extends State<ViewContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Contacts"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Contact Details",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.purple,
                  fontSize: 30),
            ),
            const SizedBox(
              height: 40,
            ),
            CircleAvatar(
              backgroundColor: Colors.deepOrange,
              radius: 100,
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Name :",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 22),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  widget.contact.name ?? '',
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 22),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Contact :",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 22),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  widget.contact.contact ?? '',
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 22),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: const [
                    Text(
                      "Email :",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 22),
                    ),
                    SizedBox(
                      height: 10,
                    ),
              ],
            ),
            Column(
              children: [
                    Text(
                      widget.contact.email ?? '',
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 22),
                    ),
              ],
            )

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     const Text(
            //       "Email :",
            //       style: TextStyle(
            //           fontWeight: FontWeight.w500,
            //           color: Colors.black,
            //           fontSize: 22),
            //     ),
            //     const SizedBox(
            //       width: 20,
            //     ),
            //     Text(
            //       widget.contact.email ?? '',
            //       style: const TextStyle(
            //           fontWeight: FontWeight.w500,
            //           color: Colors.black,
            //           fontSize: 22),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
