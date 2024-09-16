import 'package:flutter/material.dart';
import 'package:togo/presentation/disquette/widgets/button_widget.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({super.key, required this.text});
  final String text;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      
      child: Container(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Column(
                children: [
                  Container(
                    height: 200,
                    child: Center(
                      child: Text(
                        widget.text,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                        maxLines: null,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
          
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonWidget(cardIcon: Icons.arrow_circle_up_sharp, count: "20", isShareButton: false,),
                        ButtonWidget(cardIcon: Icons.arrow_circle_down_sharp, count: "20", isShareButton: false),
                        ButtonWidget(cardIcon: Icons.mode_comment_outlined, count: "20", isShareButton: false),
                        ButtonWidget(cardIcon: Icons.share, count: "", isShareButton: true),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
    );
  }
}