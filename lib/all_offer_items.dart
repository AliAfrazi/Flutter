import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class AllItems extends StatefulWidget {
  const AllItems({Key? key}) : super(key: key);

  @override
  State<AllItems> createState() => _AllItemsState();
}

class _AllItemsState extends State<AllItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Items'),
      ),
      body: ListView.builder(
        itemCount: 10,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) => items(index + 1),
      ),
    );
  }

  Widget items(int index) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                blurRadius: 5,
                color: Color(0x4D000000),
                offset: Offset(0,1),
              )
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                const Text(
                  'تومان',
                  style: TextStyle(color: Colors.black, fontFamily: 'Light', fontSize: 14),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Text(
                    '${15400 * index}'.toPersianDigit().seRagham(),
                    style: const TextStyle(color: Colors.black, fontFamily: 'Light', fontSize: 14),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    color: Colors.redAccent,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Text(
                        '${(index * 3.264).round()}%'.toPersianDigit(),
                        style: const TextStyle(color: Colors.white, fontFamily: 'Light', fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
        const Divider(
          height: 10,
          color: Colors.transparent,
        )
      ],
    );
  }
}
