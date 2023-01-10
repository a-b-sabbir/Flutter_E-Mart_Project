import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/services/firestore_services.dart';
import 'package:emart_app/widgets_common/loading_indication.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
          title:
              'Messages'.text.color(darkFontGrey).fontFamily(semibold).make()),
      body: StreamBuilder(
        stream: FirestoreServices.getAllMessages(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: loadingIndicator());
          } else if (snapshot.data!.docs.isEmpty) {
            return Center(
                child:
                    'No messages yet'.text.color(darkFontGrey).makeCentered());
          } else {
            var data = snapshot.data!.docs;
            return ListView.builder(itemCount: data.length, itemBuilder: (BuildContext context, index){
              return ListTile(
                title: '${data[index]['friend_name']}'.text.fontFamily(semibold).size(25).color(darkFontGrey).make(),
                subtitle: '${data[index]['last_msg']}'.text.size(17).make(),
              );
            });
          }
        },
      ),
    );
  }
}
