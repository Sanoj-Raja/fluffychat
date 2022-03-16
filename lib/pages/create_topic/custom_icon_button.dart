import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key key,
    @required this.icon,
    @required this.buttonText,
    @required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String buttonText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.width / 8,
            width: MediaQuery.of(context).size.width / 8,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromARGB(255, 25, 178, 238),
                  Color.fromARGB(255, 21, 236, 229)
                ],
              ),
            ),
            child: Icon(
              icon,
              size: MediaQuery.of(context).size.width / 12,
              color: Colors.white.withOpacity(.9),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(buttonText)
        ],
      ),
    );
  }
}
