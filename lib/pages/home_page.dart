import 'package:advance_app/model/movie_model.dart';
import 'package:advance_app/pages/widgets/caraousal.dart';
import 'package:advance_app/pages/widgets/caraousal_horizontal.dart';
import 'package:advance_app/services/movieService.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40,),
            Row(children: [
              SizedBox(width: 20,),
              Text('Leen', style: GoogleFonts.bungeeSpice(fontSize: 32),),
                SizedBox(width: 5,),
              Icon(Icons.play_circle_sharp),
            ],),
            HorizontalCarousal(),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 20,),
                Text('Trending', style: GoogleFonts.quicksand(fontSize: 24),),
                SizedBox(width: 5,),
                Icon(Icons.local_fire_department, size: 24,)
              ],
            ),
          MyCarousel()
          ],
        ),
      ),
    );
  }
}
