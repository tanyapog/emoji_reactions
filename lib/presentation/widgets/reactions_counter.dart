import 'package:flutter/material.dart';

class ReactionsCounter extends StatelessWidget {
  final Map<String, int> reactionsCounter;
  const ReactionsCounter({Key? key, required this.reactionsCounter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 3, bottom: 2),
      child: Container(
        height: 41,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20,10,20,10,),
          child: ListView.separated(
            itemCount: reactionsCounter.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, i) {
              final reaction = reactionsCounter.keys.elementAt(i);
              return RichText(
                text: TextSpan(
                    text: '$reaction ', style: const TextStyle(fontSize: 18,),
                    children: [
                      TextSpan(text: '${reactionsCounter[reaction]}',
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blueAccent),),
                    ]
                ),
              );
            },
            separatorBuilder: (context, i) => const SizedBox(width: 12,),
          ),
        ),
      ),
    );
  }
}
