import 'package:flutter/material.dart';
import 'package:praktika/server/http_server.dart';
import 'package:praktika/wiues/update_wiue_widjet.dart';
class UpdatePage extends StatefulWidget {
  const UpdatePage({Key? key}) : super(key: key);

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  Repository repository=Repository();
  final firstnameControler=TextEditingController();
  final lastnameControler=TextEditingController();
  final messagenameControler=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final args=ModalRoute.of(context)!.settings.arguments as List<String>;
    if(args[1].isNotEmpty){
      firstnameControler.text=args[1];
    }if(args[2].isNotEmpty){
      lastnameControler.text=args[2];
    }if(args[3].isNotEmpty){
      messagenameControler.text=args[3];
    }
    return Scaffold(
      appBar:appBar(
        true,
        const Text("Update",style:TextStyle(color:Colors.black),),
      ),
      body:Container(
        padding:const EdgeInsets.all(10),
        child:Column(
          children:[
            textField(firstnameControler,"First Name"),
            const SizedBox(height:20,),
            textField(lastnameControler,"Last Name"),
            const SizedBox(height:20,),
            textField(messagenameControler,"Message"),
            const SizedBox(height:20,),
            ElevatedButton(
                onPressed:()async{
                  bool response=await repository.updatePage(args[0],
                    firstnameControler.text,
                    lastnameControler.text,
                    messagenameControler.text,);
                  if(response){
                    Navigator.popAndPushNamed(context, "home");
                  }else{
                    throw Exception('Failed to update data.');
                  }
                },
                child:const Text("Update")
            ),
          ],
        ),
      ),
    );
  }
}
