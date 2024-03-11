import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KategoriListTab extends StatefulWidget {
  const KategoriListTab({super.key});

  @override
  State<KategoriListTab> createState() => _KategoriListTabState();
}

class _KategoriListTabState extends State<KategoriListTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: 4,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: selectedIndex == index ? Colors.red : Colors.white,
                    border: Border.all(
                      color: selectedIndex == index ? Colors.red : Colors.black,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        offset: const Offset(0, 2),
                        blurRadius: 1.5,
                        spreadRadius: 1.5,
                      )
                    ]),
                child: Row(
                  children: <Widget>[
                    index == 0
                        ? const Icon(Icons.all_inbox_outlined,
                            color: Colors.black)
                        : index == 1
                            ? const Icon(Icons.local_cafe_outlined,
                                color: Colors.black)
                            : index == 2
                                ? const Icon(Icons.fastfood_outlined,
                                    color: Colors.black)
                                : const Icon(Icons.local_dining_outlined,
                                    color: Colors.black),
                    const SizedBox(width: 5),
                    Text(
                      index == 0
                          ? 'All'
                          : index == 1
                              ? 'Minuman'
                              : index == 2
                                  ? 'Makanan'
                                  : 'Snack',
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.bodySmall,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
