// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/appointment.dart';
import 'package:flutter_application_1/screen/home.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const WelcomeScreen2(),
    const PublicInfoScreen(),
    NotificationsScreen(),
    const MyInfoScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'หน้าหลัก',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            label: 'ประชาสัมพันธ์',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'แจ้งเตือน',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'ข้อมูลของฉัน',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'ตั้งค่า',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class MenuItem {
  final IconData icon;
  final String title;

  MenuItem({required this.icon, required this.title});
}

class AppointmentItem {
  final IconData icon;
  final String title;
  final String detail;
  final String schedule;

  AppointmentItem({
    required this.icon,
    required this.title,
    required this.detail,
    required this.schedule,
  });
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      height: 150,
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/profile2.jpg'),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "นายสมบูรณ์ แข็งแรงดี",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Container(
                  height: 1,
                  width: 150,
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(vertical: 4.0),
                ),
                const Text(
                  "HN : B13965/12",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w100,
                  ),
                ),
                const Text(
                  "ชาย - เกิด 25/08/1987",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w100,
                  ),
                ),
                const Text(
                  "(32 ปี 2 เดือน 13 วัน)",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            width: 300,
            margin: const EdgeInsets.only(right: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, -3),
                )
              ],
            ),
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "หมายเลข",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "A132",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 80,
                  width: 2,
                  color: Colors.grey,
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                ),
                const SizedBox(width: 20),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "แตะเพื่อดูรายละเอียด",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "จำนวนคิวที่เหลือ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "3",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "เวลาที่รอคิว (นาที)",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "30",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class WelcomeScreen2 extends StatefulWidget {
  const WelcomeScreen2({super.key});

  @override
  State<WelcomeScreen2> createState() => _WelcomeScreen2State();
}

class _WelcomeScreen2State extends State<WelcomeScreen2> {
  bool isMenuVisible = true;

  final List<MenuItem> menuItems = [
    MenuItem(icon: Icons.location_on, title: 'check-in'),
    MenuItem(icon: Icons.assignment, title: 'ประวัติการรักษา'),
    MenuItem(icon: Icons.medical_services_rounded, title: 'ประวัติการใช้ยา'),
    MenuItem(icon: Icons.info, title: 'ข้อมูลทั่วไป'),
    MenuItem(icon: Icons.health_and_safety, title: 'บริการสุขภาพ'),
    MenuItem(icon: Icons.favorite_border, title: 'การรับบริการ'),
    MenuItem(icon: Icons.favorite_border, title: 'การแพทย์ทางไกล'),
    MenuItem(icon: Icons.favorite_border, title: 'ค่าใช้จ่าย'),
    MenuItem(icon: Icons.favorite_border, title: 'บันทึกสุขภาพประชาชน'),
    MenuItem(icon: Icons.favorite_border, title: 'โทรเรียกรถฉุกเฉิน'),
    MenuItem(icon: Icons.favorite_border, title: 'หมอพร้อม'),
    MenuItem(icon: Icons.favorite_border, title: '***'),
    MenuItem(icon: Icons.favorite_border, title: '***'),
    MenuItem(icon: Icons.favorite_border, title: '***'),
    MenuItem(icon: Icons.favorite_border, title: '***'),
  ];

  @override
  Widget build(BuildContext context) {
    List<MenuItem> favoriteItems = menuItems.sublist(0, 6);
    List<MenuItem> remainingItems = menuItems.sublist(
      6,
    );
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: AppBar(
            backgroundColor: Colors.green,
            flexibleSpace: const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  "หน้าหลัก",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const ProfileCard(),
              Container(
                color: const Color.fromARGB(255, 216, 242, 202),
                height: 180,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AppointmentScreen(),
                          ),
                        );
                      },
                      child: Container(
                          width: 180,
                          height: 180,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              top: BorderSide(color: Colors.grey, width: 1),
                              bottom: BorderSide(color: Colors.grey, width: 1),
                              left: BorderSide(color: Colors.grey, width: 1),
                              right: BorderSide(color: Colors.grey, width: 1),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/calendar_icon.png',
                                width: 80,
                                height: 80,
                              ),
                              const Text(
                                "นัดหมายล่วงหน้า",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today,
                                    color: Colors.green,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    "ตารางนัดหมายที่กำลังจะมาถึง",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                "16 มกราคม 2566 , 10:30",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                "แผนกรังสีคลินิกพิเศษ",
                                style: TextStyle(
                                  color: Colors.green,
                                ),
                              ),
                              const Text(
                                "นพ.ยุทธภพ ใต้หลามหาสมุทร",
                                style: TextStyle(
                                  color: Colors.green,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            NotificationsScreen()),
                                  );
                                },
                                child: const Text(
                                  "ดูตารางนัดหมายของฉัน >",
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 16,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 8,
                          color: Colors.green,
                          margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        ),
                        const Text(
                          "รายการโปรด",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "แก้ไข >",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: isMenuVisible ? 100 : 0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: favoriteItems.length,
                  itemBuilder: (context, index) {
                    final menuItem = favoriteItems[index];
                    return GestureDetector(
                      onTap: () {
                        print('${menuItem.title} tapped');
                      },
                      child: Container(
                        width: 100,
                        margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(menuItem.icon, size: 40, color: Colors.green),
                            const SizedBox(height: 20),
                            Text(
                              menuItem.title,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isMenuVisible = !isMenuVisible;
                  });
                },
                child: Text(isMenuVisible ? 'ซ่อนเมนู' : 'แสดงเมนู'),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: remainingItems.map((menuItem) {
                    return Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: GestureDetector(
                        onTap: () {
                          print('${menuItem.title} tapped');
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(menuItem.icon, size: 40, color: Colors.green),
                            const SizedBox(height: 10),
                            Text(
                              menuItem.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ));
  }
}

class PublicInfoScreen extends StatefulWidget {
  const PublicInfoScreen({super.key});

  @override
  _PublicInfoScreenState createState() => _PublicInfoScreenState();
}

class _PublicInfoScreenState extends State<PublicInfoScreen> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  final List<String> imageList = [
    'assets/images/banner1.jpg',
    'assets/images/banner2.jpg',
    'assets/images/banner1.jpg',
    'assets/images/banner2.jpg',
  ];

  final List<Map<String, String>> newsList = [
    {
      'title': 'ข่าวที่ 1',
      'time': '1 ชั่วโมงที่แล้ว',
    },
    {
      'title': 'ข่าวที่ 2',
      'time': '1 ชั่วโมงที่แล้ว',
    },
    {
      'title': 'ข่าวที่ 3',
      'time': '1 ชั่วโมงที่แล้ว',
    },
    {
      'title': 'ข่าวที่ 4',
      'time': '5 ชั่วโมงที่แล้ว',
    },
    {
      'title': 'ข่าวที่ 5',
      'time': '1 วันที่แล้ว',
    },
    {
      'title': 'ข่าวที่ 6',
      'time': '1 วันที่แล้ว',
    },
    {
      'title': 'ข่าวที่ 7',
      'time': '1 วันที่แล้ว',
    },
    {
      'title': 'ข่าวที่ 8',
      'time': '1 วันที่แล้ว',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: Colors.green,
          flexibleSpace: const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                "ประชาสัมพันธ์",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: CarouselSlider(
                controller: _controller,
                options: CarouselOptions(
                  height: 200.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
                items: imageList.map((imageUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imageList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4),
                    ),
                  ),
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  final news = newsList[index];
                  return Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.green, // สีเขียว
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'รูปภาพข่าวสาร',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  news['title'] ?? '',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 4.0),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    news['time'] ?? '',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 24.0),
                ),
                child: const Text(
                  'อ่านข่าวทั้งหมด',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({super.key});

  final List<AppointmentItem> appointmentItems = [
    AppointmentItem(
        icon: Icons.calendar_month,
        title: "คุณมีนัดหมายการพบแพทย์ในวันพรุ่งนี้",
        detail: "ห้องตรวจอายุรกรรม เวลา 9:00น.-12:00น.",
        schedule: "วันนี้"),
    AppointmentItem(
        icon: Icons.calendar_month,
        title: "คุณมีนัดหมายการพบแพทย์ในอีก 7 วัน",
        detail: "ห้องตรวจอายุรกรรม เวลา 9:00น.-12:00น.",
        schedule: "1 สัปดาห์ที่แล้ว"),
    AppointmentItem(
        icon: Icons.calendar_month,
        title: "คุณมีนัดหมายการพบแพทย์ในวันพรุ่งนี้",
        detail: "ห้องตรวจอายุรกรรม เวลา 9:00น.-12:00น.",
        schedule: "วันนี้"),
    AppointmentItem(
        icon: Icons.calendar_month,
        title: "คุณมีนัดหมายการพบแพทย์ในวันพรุ่งนี้",
        detail: "ห้องตรวจอายุรกรรม เวลา 9:00น.-12:00น.",
        schedule: "วันนี้"),
    AppointmentItem(
        icon: Icons.calendar_month,
        title: "คุณมีนัดหมายการพบแพทย์ในวันพรุ่งนี้",
        detail: "ห้องตรวจอายุรกรรม เวลา 9:00น.-12:00น.",
        schedule: "วันนี้"),
    AppointmentItem(
        icon: Icons.calendar_month,
        title: "คุณมีนัดหมายการพบแพทย์ในวันพรุ่งนี้",
        detail: "ห้องตรวจอายุรกรรม เวลา 9:00น.-12:00น.",
        schedule: "วันนี้"),
    AppointmentItem(
        icon: Icons.calendar_month,
        title: "คุณมีนัดหมายการพบแพทย์ในวันพรุ่งนี้",
        detail: "ห้องตรวจอายุรกรรม เวลา 9:00น.-12:00น.",
        schedule: "วันนี้"),
    AppointmentItem(
        icon: Icons.calendar_month,
        title: "คุณมีนัดหมายการพบแพทย์ในวันพรุ่งนี้",
        detail: "ห้องตรวจอายุรกรรม เวลา 9:00น.-12:00น.",
        schedule: "วันนี้"),
    AppointmentItem(
        icon: Icons.calendar_month,
        title: "คุณมีนัดหมายการพบแพทย์ในวันพรุ่งนี้",
        detail: "ห้องตรวจอายุรกรรม เวลา 9:00น.-12:00น.",
        schedule: "วันนี้"),
    AppointmentItem(
        icon: Icons.calendar_month,
        title: "คุณมีนัดหมายการพบแพทย์ในวันพรุ่งนี้",
        detail: "ห้องตรวจอายุรกรรม เวลา 9:00น.-12:00น.",
        schedule: "วันนี้"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: Colors.green,
          flexibleSpace: const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                "แจ้งเตือน",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProfileCard(), // Profile Card at the top
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 50.0),
            child: Text(
              "ล่าสุด",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: appointmentItems.length,
              itemBuilder: (context, index) {
                final appointment = appointmentItems[index];
                return Column(
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 60.0, bottom: 20.0),
                          child: Row(
                            children: [
                              Icon(
                                appointment.icon,
                                color: Colors.green,
                                size: 60,
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        appointment.title,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        appointment.detail,
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 8,
                          right: 50,
                          child: Text(
                            appointment.schedule,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                      color: Colors.grey,
                      indent: 40,
                      endIndent: 40,
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class MyInfoScreen extends StatelessWidget {
  const MyInfoScreen({super.key});

  Widget buildProfileInputField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          readOnly: true,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            hintText: value,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: Colors.green,
          flexibleSpace: const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                "ข้อมูลส่วนตัว",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 80, // ขนาดรูปภาพ
                      backgroundImage: AssetImage('assets/images/profile2.jpg'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'แก้ไขรูปภาพ',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: buildProfileInputField('ชื่อ', 'สมบูรณ์'),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: buildProfileInputField('นามสกุล', 'แข็งแรงดี'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: buildProfileInputField('วันเกิด', '25 สิงหาคม 1987'),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: buildProfileInputField('อายุ', '32 ปี'),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              buildProfileInputField('เลขบัตรประชาชน', '1234567890123'),
              const SizedBox(height: 20),

              buildProfileInputField(
                  'ที่อยู่', '123 ถนนสุขสบาย, กรุงเทพมหานคร'),
              const SizedBox(height: 20),

              buildProfileInputField('เบอร์โทร', '081-123-4567'),
              const SizedBox(height: 40), // เว้นช่องว่างระหว่างข้อมูลและปุ่ม

              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    textStyle: const TextStyle(fontSize: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('แก้ไขข้อมูล'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  Widget buildMenuItem(
      {required IconData icon,
      required String text,
      required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.green, size: 35),
      title: Text(
        text,
        style: const TextStyle(fontSize: 18),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: Colors.green,
          flexibleSpace: const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                "ตั้งค่า",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyInfoScreen()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/profile2.jpg'),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'สมบูรณ์ แข็งแรงดี',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'ดูโปรไฟล์ของฉัน',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.grey),
                ],
              ),
            ),
          ),
          const Divider(
            indent: 10,
            endIndent: 10,
          ),
          // Settings Menu
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: ListView(
                children: [
                  buildMenuItem(
                    icon: Icons.lock,
                    text: 'การตั้งค่าความเป็นส่วนตัว',
                    onTap: () {},
                  ),
                  buildMenuItem(
                    icon: Icons.language,
                    text: 'ภาษาและการแสดงผล',
                    onTap: () {},
                  ),
                  buildMenuItem(
                    icon: Icons.health_and_safety,
                    text: 'ข้อมูลสุขภาพ',
                    onTap: () {},
                  ),
                  buildMenuItem(
                    icon: Icons.help_outline,
                    text: 'ศูนย์ช่วยเหลือ',
                    onTap: () {},
                  ),
                  buildMenuItem(
                    icon: Icons.info_outline,
                    text: 'ข้อมูลเกี่ยวกับโรงพยาบาล',
                    onTap: () {},
                  ),
                  // const Divider(),
                  buildMenuItem(
                    icon: Icons.logout,
                    text: 'Log out',
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                        (Route<dynamic> route) => false,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
