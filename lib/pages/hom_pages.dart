import 'package:flutter/material.dart';
import 'package:praktika/model/person_model.dart';
import 'package:praktika/server/http_server.dart';
import 'package:praktika/wiues/hom_wiue.dart';
import 'package:praktika/wiues/update_wiue_widjet.dart';
class HomPage extends StatefulWidget {
  const HomPage({Key? key}) : super(key: key);

  @override
  _HomPageState createState() => _HomPageState();

}

class _HomPageState extends State<HomPage> {

  Repository repository=Repository();
  List<Person> listperson=[];
  bool isLoaded=false;
  getData()async{
    listperson=await repository.getData();
    if(listperson!=null){
      setState(() {
        isLoaded=true;
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:appBar(
          true,
          const Text("Http Post Method",style:TextStyle(color:Colors.black)),
      ),
      body:Visibility(
        visible:isLoaded,
        child: ListView.builder(
          itemCount:listperson.length,
            itemBuilder:(context,index){
              return HomWiue(repository:repository, listperson:listperson, index:index,);
            }
        ),
        replacement:const Center(
          child:CircularProgressIndicator(),
        ),
      ),
      floatingActionButton:FloatingActionButton(
        onPressed:(){
          Navigator.popAndPushNamed(context, "create");
        },
        child:const Icon(Icons.add),
      ),
    );
  }
}
