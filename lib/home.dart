import 'package:api_calsses1/Model.dart';
import 'package:flutter/material.dart';

import 'allrepo.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int counter=0;
 Future<void> _incrementCounter()async{

    setState(() {


    counter++;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _incrementCounter();
  }
  @override
  Widget build(BuildContext context) {
    GetUserRepo _getUserRepo=GetUserRepo();

     return Scaffold(
      appBar: AppBar(title: Text("Home")),
floatingActionButton: FloatingActionButton(onPressed: () {
  _incrementCounter();
},),
body: FutureBuilder<UserModel>(
  future:_getUserRepo.getUser(add_number: counter),
  builder: (context, snapshot) {
  if(snapshot.hasData){
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: snapshot.data?.results?.length,
      itemBuilder: (BuildContext context, int index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          child: Card(
            child: SingleChildScrollView(
              child: Column(
                children: [

                  Row(
                    children: [
                      Text("Name : ",style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: 2,),
                      Text(snapshot.data!.results?[index].name?.first??"" ),
                      SizedBox(height: 2,),
                      Text(snapshot.data!.results?[index].name?.last??"" ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text("Gender : ",style: TextStyle(fontWeight: FontWeight.bold),),

                      Text(snapshot.data!.results?[index].gender??""),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Align(
                      alignment: Alignment.topCenter,
                      child: Text("Location : ",style: TextStyle(fontWeight: FontWeight.bold),)),
                  Text("Street : ",style: TextStyle(fontWeight: FontWeight.normal),),
                  Text("Name:${snapshot.data!.results?[index].location?.street?.name??""}"),
                  Text("Number:${snapshot.data!.results?[index].location?.street?.number??""}"),

                  Text("City:${snapshot.data!.results?[index].location?.city??""}"),
                  Text("State:${snapshot.data!.results?[index].location?.state??""}"),

                  Text("Country:${snapshot.data!.results?[index].location?.country??""}"),
                  Text("PostCode:${snapshot.data!.results?[index].location?.postcode??""}"),

                  Text("Cordinates : ",style: TextStyle(fontWeight: FontWeight.normal),),
                  Text("Longitude:${snapshot.data!.results?[index].location?.coordinates?.longitude??""}"),
                  Text("Latitude:${snapshot.data!.results?[index].location?.coordinates?.latitude??""}"),

                  Text("Timezone : ",style: TextStyle(fontWeight: FontWeight.normal),),
                  Text("Offset:${snapshot.data!.results?[index].location?.timezone?.offset??""}"),
                  Text("Description:${snapshot.data!.results?[index].location?.timezone?.description??""}"),

                  Text("E-mails:${snapshot.data!.results?[index].email??""}"),

                  Image.network("${snapshot.data!.results?[index].picture?.thumbnail??""}",
                    height: 150,
                    width: double.infinity,
                  ),
                  // SizedBox(height: 10,),
                ],
              ),
            ),
          ),
        ),
      );
    },
    );
  }else{
    return Center(child: CircularProgressIndicator());
  }
},),
    );
  }
}
