import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoFormWidget extends StatelessWidget {
  const LogoFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 15.0),
      margin: const EdgeInsets.only(left: 15, top: 10, right: 15),
      child: Row(
        children: <Widget>[
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'FO',
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w800,
                      fontSize: 25,
                      color: Colors.black),
                ),
                TextSpan(
                  text: 'OD',
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w800,
                      fontSize: 25,
                      color: Colors.blue),
                ),
              ],
            ),
          ),
          const SizedBox(width: 5),
          SizedBox(
            width: MediaQuery.of(context).size.width - 100,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                filled: true,
                fillColor: Colors.black.withOpacity(0.03),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
