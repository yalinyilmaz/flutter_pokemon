import 'package:flutter/material.dart';
import 'package:poke_dex_projesi/model/pokemon_model.dart';
import 'package:poke_dex_projesi/pages/details_page.dart';
import 'package:poke_dex_projesi/services/poke_api.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  Color? renk_ureten(List l,int index){

  switch(l[index].type[0]){

    case "Grass":
    return Colors.green;

    case "Fire":
    return Colors.red;

    case "Bug":
    return Colors.lightGreenAccent;

    case "Water":
    return Colors.blue;
  }
}

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late final Future<List<PokemonModely>?> pokelistt;

  @override
  void initState() {
    super.initState();
    pokelistt = PokeApi().pokemonlist();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Image.asset('images/pokeball.png',fit: BoxFit.cover,)],
        elevation: 0,
        centerTitle: false,
        title: const Text("Pokedex",style: TextStyle(color: Colors.white,fontSize: 38,fontWeight: FontWeight.bold,letterSpacing: 1),),
        backgroundColor: Colors.grey.shade800,
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.grey.shade800),
        child: FutureBuilder<List<PokemonModely>?>(
           future:pokelistt,
           builder:(context, snapshot) {
            if (snapshot.hasData){
              var pokemlist = snapshot.data!;
              print(pokemlist[0].type);
              return Padding(
                padding: const EdgeInsets.only(top:18.0),
                child: GridView.builder(
                          gridDelegate:const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent:220,
                          ),
                          itemCount: pokemlist.length,
                          itemBuilder: (BuildContext context, int index) {
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Container(
                        decoration: BoxDecoration(
                        color: widget.renk_ureten(pokemlist,index) ?? Colors.amber,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                        height:205, 
                        width: MediaQuery.of(context).size.width/2,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(pokemlist[index].name!,style: const TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.bold,)),
                            const SizedBox(height: 5,),
                            Container(
                              decoration: BoxDecoration(color:Colors.grey.shade700,borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: const EdgeInsets.only(left:10.0,right:10.0,top:4.0,bottom:4.0),

                                child: Text(pokemlist[index].type![0],style: TextStyle(color: Colors.white,fontSize: 18,)),
                              )
                            )
                          ],
                        ),
                      )
                    ),
                    ),
                  Positioned(
                    top: 100,
                    left:100,
                    child: Image.asset('images/pokeball.png',width: 75,height: 75,),
                    ),
                  Positioned(
                    top: 100,
                    left:100,
                    child:InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context)=> Details(pokemlist[index],index+1)));
                        
                      },
                      child:Hero(
                        tag: pokemlist[index].img!,
                        child: CachedNetworkImage(imageUrl:pokemlist[index].img!,width: 75,height: 75)))
                    )
                  ]
                );
                          },
                        ),
              );
            }else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else
             { return Center(child: const CircularProgressIndicator(backgroundColor: Colors.white,));}             
           },
        ),

      ),
    );
  }
}