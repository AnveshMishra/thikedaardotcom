import 'package:flutter/material.dart';
import 'package:thikedaardotcom/config/size/size_config.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  const SearchBar(
      {required this.textController, required this.hintText, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: const Offset(12, 26),
            blurRadius: 50,
            spreadRadius: 0,
            color: Colors.grey.withOpacity(.1)),
      ]),
      child: TextField(
        controller: textController,
        onChanged: (value) {
          //Do something wi
        },
        decoration: InputDecoration(
          prefixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                width: 8,
              ),
              const Icon(
                Icons.camera_alt,
                color: Colors.amber,
              ),
              const SizedBox(
                width: 8,
              ),
              Container(
                color: Colors.black,
                width: (SizeConfig.blackSizeHorizontal ?? 1) * 0.2,
                height: (SizeConfig.blackSizeVertical ?? 1) * 2,
              ),
            ],
          ),
          suffixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle:
              const TextStyle(color: Colors.grey, fontWeight: FontWeight.w300),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[300]!, width: 1.0),
            borderRadius: const BorderRadius.all(Radius.circular(6.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[400]!, width: 1.5),
            borderRadius: const BorderRadius.all(Radius.circular(6.0)),
          ),
        ),
      ),
    );
  }
}
