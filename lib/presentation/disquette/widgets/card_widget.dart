import 'package:flutter/material.dart';
import 'package:togo/presentation/disquette/widgets/button_widget.dart';

class CardWidget extends StatelessWidget {
  CardWidget({super.key, required this.text, this.subtitle});
  final String text;
  String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      text,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                      maxLines: null,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      subtitle ?? "Subtitle",
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.grey),
                      maxLines: null,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonWidget(cardIcon: Icons.arrow_circle_up_sharp, count: "20", isShareButton: false,),
                ButtonWidget(cardIcon: Icons.arrow_circle_down_sharp, count: "20", isShareButton: false),
                ButtonWidget(cardIcon: Icons.mode_comment_outlined, count: "20", isShareButton: false),
                ButtonWidget(cardIcon: Icons.share, count: "", isShareButton: true),
              ],
            )
          ],
        ),
      ),
    );
  }
}