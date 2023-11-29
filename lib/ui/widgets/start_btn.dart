import 'package:flutter/material.dart';

class StartButtonWidgets extends StatelessWidget {
  final Function() ontap;
  final String titleBtn;
  const StartButtonWidgets(
      {super.key, required this.ontap, required this.titleBtn});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 166,
        height: 45,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Colors.grey),
          onPressed: ontap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child:
                    Icon(Icons.arrow_back_ios, size: 14, color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 0),
                child: Text("About me",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white)),
              ),
            ],
          ),
        ));
  }
}
