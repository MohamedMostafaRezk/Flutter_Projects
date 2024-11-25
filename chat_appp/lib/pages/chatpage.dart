// ignore_for_file: unused_import, prefer_const_constructors_in_immutables, camel_case_types, must_be_immutable, non_constant_identifier_names, unused_local_variable, prefer_final_fields, unused_field, use_key_in_widget_constructors
import 'package:chat_app/model/messagemodel.dart';
import 'package:chat_app/widgets/Teaxtfield.dart';
import 'package:chat_app/widgets/chatbubble_left.dart';
import 'package:chat_app/widgets/chatbubble_right.dart';
import 'package:chat_app/widgets/constants_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Chatpage extends StatelessWidget {
  static String id = 'chatpage';
  CollectionReference UsersMessages =
      FirebaseFirestore.instance.collection('message');

  TextEditingController conttroller = TextEditingController();
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    dynamic email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: UsersMessages.orderBy('TimeSend', descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Messagemodel> mm = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            mm.add(Messagemodel.fromJson(snapshot.data!.docs[i]));
          }
          return Scaffold(
            appBar: AppBar(
              //automaticallyImplyLeading: false,
              backgroundColor: Colors.indigo[900],
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Klogo,
                    height: 75,
                  ),
                  const Text(
                    'Chat',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: _scrollController,
                    itemCount: mm.length,
                    itemBuilder: (context, index) {
                      return mm[index].id == email
                          ? ChatbubbleLeft(
                              mess: mm[index],
                            )
                          : chatbubble_right(
                              mess: mm[index],
                            );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: conttroller,
                    onSubmitted: (value) {
                      UsersMessages.add(
                        {
                          'text': value,
                          'TimeSend': DateTime.now(),
                          'id': email,
                        },
                      );
                      conttroller.clear();
                      _scrollController.animateTo(0,
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeIn);
                    },
                    decoration: InputDecoration(
                      hintText: 'Send Message',
                      suffix: const Icon(
                        Icons.send,
                        color: Colors.indigo,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        } else {
          return const Text('Loading....');
        }
      },
    );
  }
}
