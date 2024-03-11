import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridKontenList extends StatelessWidget {
  const GridKontenList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.8),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset('assets/images/konten/Pizza.jpg'),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                  child: Text(
                    'Pizza Triangle',
                    style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.bodySmall,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3),
                      child: Icon(Icons.access_time_sharp),
                    ),
                    const Text('90 Menit'),
                    const SizedBox(width: 25),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        margin: const EdgeInsets.only(right: 5, left: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.green,
                        ),
                        child: Text(
                          'Deskripsi',
                          style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.bodySmall,
                              fontSize: 10,
                              fontWeight: FontWeight.w300,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
