import 'package:flutter/material.dart';
import 'package:course_example/all_offer_items.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

void main() => runApp(const Start());

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Course Example',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    int itemCount = 15;
    return Scaffold(
      appBar: AppBar(title: const Text('DigiKala')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              color: Colors.green,
            ),
            SizedBox(
              height: 250,
              child: gridView(),
            ),
            Container(
              width: double.infinity,
              height: 280,
              color: Colors.red,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                reverse: true,
                itemCount: itemCount,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      index == 0
                          ? firstItem()
                          : index == itemCount - 1
                              ? dividerItem()
                              : otherItem(),
                      dividerItem()
                    ],
                  );
                },
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20, left: 15, right: 7.5, bottom: 7.5),
                          child: ClipRRect(
                            clipBehavior: Clip.antiAlias,
                            borderRadius: BorderRadius.circular(25),
                            child: Container(height: 180, color: Colors.blue),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20, left: 7.5, right: 15, bottom: 7.5),
                          child: ClipRRect(
                            clipBehavior: Clip.antiAlias,
                            borderRadius: BorderRadius.circular(25),
                            child: Container(height: 180, color: Colors.red),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 7.5, left: 15, right: 7.5, bottom: 20),
                          child: ClipRRect(
                            clipBehavior: Clip.antiAlias,
                            borderRadius: BorderRadius.circular(25),
                            child: Container(height: 180, color: Colors.pink),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 7.5, left: 7.5, right: 15, bottom: 20),
                          child: ClipRRect(
                            clipBehavior: Clip.antiAlias,
                            borderRadius: BorderRadius.circular(25),
                            child: Container(height: 180, color: Colors.deepOrange),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget firstItem() {
    return SizedBox(
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'پیشنهاد\nشگفت\nانگیز',
            style: TextStyle(color: Colors.white, fontFamily: 'Light', fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            width: 120,
            height: 120,
            child: Image.asset(
              'assets/box.png',
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AllItems()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(Icons.chevron_left, color: Colors.white),
                Text(
                  'مشاهده همه',
                  style: TextStyle(color: Colors.white, fontFamily: 'Light', fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          const GridPaper()
        ],
      ),
    );
  }

  Widget otherItem() {
    return Container(
      width: 180,
      height: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            blurRadius: 5,
            color: Color(0x4D000000),
            offset: Offset(0, 2),
          )
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          const SizedBox(height: 30),
          Container(
            height: 120,
            width: 120,
            color: Colors.yellow,
          ),
          const SizedBox(height: 30),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'تومان',
                style: TextStyle(color: Colors.black, fontFamily: 'Light', fontSize: 14),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Text(
                  '200000'.toPersianDigit().seRagham(),
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
                      '15%'.toPersianDigit(),
                      style: const TextStyle(color: Colors.white, fontFamily: 'Light', fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            '24500'.toPersianDigit().seRagham(),
            style: const TextStyle(color: Colors.grey, fontFamily: 'Light', decoration: TextDecoration.lineThrough, fontSize: 14),
          )
        ],
      ),
    );
  }

  Widget dividerItem() {
    return const VerticalDivider(
      width: 8,
      color: Colors.transparent,
    );
  }

  Widget gridView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, crossAxisAlignment: CrossAxisAlignment.center, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                clipBehavior: Clip.antiAlias,
                child: Container(
                  color: Colors.red,
                  width: 70,
                  height: 70,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  'دیجی کالا مهر',
                  style: TextStyle(fontSize: 12, fontFamily: 'Light'),
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                clipBehavior: Clip.antiAlias,
                child: Container(
                  color: Colors.blue,
                  width: 70,
                  height: 70,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  'خرید اقساطی',
                  style: TextStyle(fontSize: 12, fontFamily: 'Light'),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                clipBehavior: Clip.antiAlias,
                child: Container(
                  color: Colors.black,
                  width: 70,
                  height: 70,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  'حراج استایل',
                  style: TextStyle(fontSize: 12, fontFamily: 'Light'),
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                clipBehavior: Clip.antiAlias,
                child: Container(
                  color: Colors.deepOrange,
                  width: 70,
                  height: 70,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  'دیجی کالا جت',
                  style: TextStyle(fontSize: 12, fontFamily: 'Light'),
                ),
              )
            ],
          )
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, crossAxisAlignment: CrossAxisAlignment.center, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                clipBehavior: Clip.antiAlias,
                child: Container(
                  color: Colors.black12,
                  width: 70,
                  height: 70,
                  child: const Icon(Icons.more_horiz, color: Colors.black26),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  'بیشتر',
                  style: TextStyle(fontSize: 12, fontFamily: 'Light'),
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                clipBehavior: Clip.antiAlias,
                child: Container(
                  color: Colors.purple,
                  width: 70,
                  height: 70,
                  child: const Icon(Icons.add, size: 50, color: Colors.white),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  'دیجی پلاس',
                  style: TextStyle(fontSize: 12, fontFamily: 'Light'),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                clipBehavior: Clip.antiAlias,
                child: Container(
                  color: Colors.teal,
                  width: 70,
                  height: 70,
                  child: const Icon(Icons.settings, size: 50, color: Colors.white),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  'چرخ و بخت',
                  style: TextStyle(fontSize: 12, fontFamily: 'Light'),
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                clipBehavior: Clip.antiAlias,
                child: Container(
                  color: Colors.lightGreen,
                  width: 70,
                  height: 70,
                  child: const Icon(Icons.breakfast_dining, size: 40, color: Colors.white),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  'خرید سر ماه',
                  style: TextStyle(fontSize: 12, fontFamily: 'Light'),
                ),
              )
            ],
          )
        ])
      ],
    );
  }
}