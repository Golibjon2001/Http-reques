import 'package:flutter/material.dart';
import 'package:praktika/server/http_server.dart';
import 'package:praktika/wiues/update_wiue_widjet.dart';
class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  Repository repository=Repository();
  final firstnameControler=TextEditingController();
  final lastnameControler=TextEditingController();
  final messagenameControler=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size=const SizedBox(height:20,);
    return Scaffold(
      appBar:appBar(
          true,
          const Text("Create",style:TextStyle(color:Colors.black)),
      ),
      body:Container(
        padding:const EdgeInsets.all(10),
        child:Column(
          children:[
            textField(firstnameControler,"First Name"),
            size,
            textField(lastnameControler,"Last Name"),
            size,
            textField(messagenameControler,"Message"),
            size,
            ElevatedButton(
                onPressed:()async{
                  bool response=await repository.create(
                    firstnameControler.text,
                    lastnameControler.text,
                    messagenameControler.text,);
                  if(response){
                    Navigator.popAndPushNamed(context, "home");
                  }else{
                    throw Exception('Failed to create data.');
                  }
                },
                child:const Text("Submit")
            ),
          ],
        ),
      ),
    );
  }
}
