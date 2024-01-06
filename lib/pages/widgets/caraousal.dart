
import 'package:advance_app/model/movie_model.dart';
import 'package:advance_app/services/movieService.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCarousel extends StatefulWidget {
  const MyCarousel({super.key});

  @override
  _MyCarouselState createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
  late Future<List<Movie>> _moviesFuture;
 // Replace with your placeholder image path

  @override
  void initState() {
    super.initState();
    _moviesFuture = MovieService().fetchTrendingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Movie>>(
      future: _moviesFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final imageUrls =
              snapshot.data!.map((movie) => movie.posterPath).toList();
          return CarouselSlider.builder(
            itemCount: imageUrls.length,
            options: CarouselOptions(
              height: 430.0,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              pageSnapping: false,
              autoPlay: false,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              // ... your carousel options
            ),
            itemBuilder: (context, index, realIndex) {
             final imageUrl = "https://image.tmdb.org/t/p/original/"+imageUrls[index];
              print(imageUrl);
              return Stack(
                children: [
                  // Background Image
                  Container(
                    height: 380,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      image: DecorationImage(
                        image: imageUrl.isNotEmpty && Uri.parse(imageUrl).isAbsolute
                            ? NetworkImage(imageUrl)
                            : NetworkImage(
                                'https://capeoffice.co.za/site/wp-content/uploads/2017/06/video-placeholder.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    margin: EdgeInsets.all(8.0),
                  ),

                  // ... (rest of your carousel item content)
                ],
              );
            },
          );
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error fetching movies'));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
