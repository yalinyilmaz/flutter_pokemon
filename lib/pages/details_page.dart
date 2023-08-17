import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:poke_dex_projesi/model/pokemon_model.dart';

class Details extends StatelessWidget {
   Details(PokemonModely this.pokemon,int this.no);
  PokemonModely pokemon;
  int no;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          InkWell(
            child: Container(
            width: MediaQuery.of(context).size.width,  
            color: f(pokemon)?? Colors.amber, 
            child: Padding(
              padding: const EdgeInsets.only(top:18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                    },
                      icon: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
                  ),
                  const SizedBox(height: 8,),
                  Padding(
                    padding: const EdgeInsets.only(right:35.0,left:35,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(pokemon.name!,style: const TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold,)),
                        Text("#00$no",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold,))
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    children: [
                      const SizedBox(width:35),
                      Container(
                        decoration: BoxDecoration(color:Colors.grey.shade700,borderRadius: BorderRadius.circular(15)),
                        child: f2(pokemon.type!),
                        
                      )
                      ],)
                  ],),
            ),   
            ),
          ),
          Positioned(
            top: 250,
            left: 295,
            child: Image.asset("images/pokeball.png",height: 100,width: 100,)),
            Positioned(
              bottom:0,
              child: Container(
                decoration: BoxDecoration(color:Colors.white,borderRadius: BorderRadius.circular(15)),
                width: MediaQuery.of(context).size.width,
                height: 450,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text("Name",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold,)),Text(pokemon.name!)],),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text("Height",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold,)),Text(pokemon.height!)],),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text("Weight",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold,)),Text(pokemon.weight!)],),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text("Spawn Time",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold,)),Text(pokemon.spawnTime!)],),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text("Weakness",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold,)),f3(pokemon.weaknesses!)!],),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text("Pre Evalution",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold,)),Text("Not Available")],),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text("Next Evalution",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold,)),f3(pokemon.nextEvolution!)??Text("Not Available")],),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 120,
              top:260,
              child: Hero(
                tag: pokemon.img!,
                child: CachedNetworkImage(imageUrl:pokemon.img!,height: 150,width: 150,)))
        ]
      ),
    );
  }



  Widget? f3(List l){

    if(l.isNotEmpty){

      return Text(l.join(","));
    }
  }




  Widget? f2(List list){
    if(list.isNotEmpty){

    return Padding(
      padding: const EdgeInsets.only(top:4.0,bottom:4,right:10,left:10),
      child: Text(list.join(","),style: TextStyle(color: Colors.white,fontSize: 18)),
    );
    }
  }

  f(PokemonModely pokemon) { 
    switch(pokemon.type![0]){

    case "Grass":
    return Colors.green;

    case "Fire":
    return Colors.red;

    case "Bug":
    return Colors.lightGreenAccent;

    case "Water":
    return Colors.blue;
  };
     }
}