import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  ButtonWidget({super.key, required this.cardIcon, required this.count, required this.isShareButton });
  IconData cardIcon;
  String count;
  bool isShareButton;
  // void Function onPresse();

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Icon(
            widget.cardIcon,
            size: 35,
          ),
          SizedBox(width: 10,),
          !widget.isShareButton ?
          
          Text(
            widget.count,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )
          : SizedBox()
        ],
      ),
    );
  }
}
