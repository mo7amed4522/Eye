// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class StatelessWidget1 extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  const StatelessWidget1({
    required this.text,
    required this.onChanged,
    required this.hintText,
    Key? key,
  }) : super(key: key);

  @override
  _StatelessWidget1State createState() => _StatelessWidget1State();
}

class _StatelessWidget1State extends State<StatelessWidget1> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final styleActive = TextStyle(color: Colors.black);
    final styleHint = TextStyle(color: Colors.black54);
    final style = widget.text.isEmpty ? styleHint : styleActive;

    return Container(
      height: 40,
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: style.color),
          suffixIcon: widget.text.isNotEmpty
              ? GestureDetector(
                  child: Icon(Icons.close, color: style.color),
                  onTap: () {
                    controller.clear();
                    widget.onChanged('');
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                )
              : null,
          hintText: widget.hintText,
          hintStyle: style,
          border: InputBorder.none,
        ),
        style: style,
        onChanged: widget.onChanged,
      ),
    );
  }
}

// class SearchWidget extends StatelessWidget {
//   SearchWidget({
//     Key? key,
//     required this.text,
//     required this.hintText,
//     required this.onChanged,
//   }) : super(key: key);
//   final String text;
//   final ValueChanged<String> onChanged;
//   final String hintText;

//   final SearchController _contoller = Get.put(SearchController());

//   @override
//   Widget build(BuildContext context) {
//     final style = text.isEmpty ? _contoller.styleHint : _contoller.styleActive;
//     return Obx(
//       () => Container(
//         height: 40,
//         margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           color: Colors.white,
//         ),
//         padding: const EdgeInsets.symmetric(horizontal: 8),
//         child: TextField(
//           controller: _contoller.controller,
//           decoration: InputDecoration(
//             icon: Icon(Icons.search, color: style.color),
//             suffixIcon: text.isNotEmpty
//                 ? GestureDetector(
//                     child: Icon(Icons.close, color: style.color),
//                     onTap: () {
//                       _contoller.controller.clear();
//                       onChanged('');
//                       FocusScope.of(context).requestFocus(FocusNode());
//                     },
//                   )
//                 : null,
//             hintText: hintText,
//             hintStyle: style,
//             border: InputBorder.none,
//           ),
//           style: style,
//           onChanged: onChanged,
//         ),
//       ),
//     );
//   }
// }
