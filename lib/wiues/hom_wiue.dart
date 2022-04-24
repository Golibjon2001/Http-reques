import 'package:flutter/material.dart';
import 'package:praktika/model/person_model.dart';
import 'package:praktika/server/http_server.dart';
class HomWiue extends StatelessWidget {
  HomWiue({Key? key,required this.index,required this.repository,required this.listperson}) : super(key: key);
  Repository repository=Repository();
  List<Person> listperson=[];
  int index;
  @override
  Widget build(BuildContext context,) {
    Person person=listperson[index];
    return InkWell(
      onTap:(){
        Navigator.popAndPushNamed(context, "update",arguments:[person.id,person.firstname,person.lastname,person.message]);
      },
      child: Dismissible(
        key:Key(person.id),
        direction:DismissDirection.endToStart,
        background:Container(
          alignment:Alignment.centerRight,
          padding:const EdgeInsets.symmetric(horizontal:30),
          child:const Icon(Icons.delete),
        ),
        confirmDismiss:(direction){
          return showDialog(
              context: context,
              builder:(context){
                return  AlertDialog(
                  title:const Text("Delete Data"),
                  content:const Text("Are you sure to delete data?"),
                  actions: [
                    TextButton(onPressed:()async{
                      bool response=await repository.deleteData(person.id);
                      if(response){
                        Navigator.pop(context,true);
                      }else{
                        Navigator.pop(context,false);
                      }
                    },
                      child:const Text("Yes"),
                    ),
                    TextButton(onPressed:(){
                      Navigator.pop(context,false);
                    },
                      child:const Text("No"),
                    ),
                  ],
                );
              });
        },
        child: Padding(
          padding: const EdgeInsets.only(left:10,right:10,top:10),
          child: Column(
            children: [
              Container(
                height:70,
                width:double.infinity,
                decoration:BoxDecoration(
                  color:Colors.grey.shade300,
                  borderRadius:BorderRadius.circular(20)
                ),
                child: ListTile(
                  leading:SizedBox(
                    height:60,
                    width:60,
                    child:Card(
                      child:Image.network(person.image,fit:BoxFit.cover,),
                    ),
                  ),
                  title:Text("${person.firstname}  ${person.lastname}"),
                  subtitle: Text(person.message,maxLines:1,),
                ),
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
