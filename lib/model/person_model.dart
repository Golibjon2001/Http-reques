class Person{
  String firstname;
  String lastname;
  String message;
  String id;
  String image;

  Person({required this.firstname,required this.lastname,required this.message,required this.id,required this.image});

  factory  Person.fromJson(Map<String,dynamic>json){
    return Person(
      firstname:json["firstname"],
      lastname:json["lastname"],
      message:json["message"],
      id:json["id"],
      image:json["image"],
    );
  }
}