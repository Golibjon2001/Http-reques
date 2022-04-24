import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:praktika/model/person_model.dart';
class Repository{
  String uri="https://6263ce2c005a66e1e3b73cac.mockapi.io/person";

  Future getData()async{
    try {
      final response =await http.get(Uri.parse(uri));
      if(response.statusCode==200){
        Iterable it=jsonDecode(response.body);
        List<Person> person=it.map((e) => Person.fromJson(e)).toList();
        return person;
        }else{
          throw Exception("Failed to load data");
        }
    }catch(e){
       return e.toString();
    }
  }
  Future create(String firstname,String lastname,String message,)async{
    try{
      final respons=await http.post(Uri.parse(uri),body:{
        "firstname":firstname,
        "lastname":lastname,
        "message":message,
      });
      if(respons.statusCode==201){
        return true;
      }else{
        return false;
      }
    }catch(e){
      return e.toString();
    }
  }
  Future updatePage(String id,String firstname,String lastname,String message,)async{
    try{
      final response=await http.put(Uri.parse('$uri/$id'),body:{
        "firstname":firstname,
        "lastname":lastname,
        "message":message,
      });
      if(response.statusCode==200){
        return true;
      }else{
        return false;
      }
    }catch(e){
      return e.toString();
    }
  }
  Future deleteData(String id)async{
    try{
      final response=await http.delete(Uri.parse('$uri/$id'));
      if(response.statusCode==200){
        return true;
      }else{
        return false;
      }
    }catch(e){
      return e.toString();
    }
  }
}