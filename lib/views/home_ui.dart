import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

// Define a class to represent the data for each item
class MyListItem {
  final String image;
  final String districtName;

  MyListItem(this.image, this.districtName);
}

// // Create a list of MyListItem objects with the data for each item
final List<MyListItem> myListItems = [
  MyListItem('assets/images/Dmueng.jpg', 'อำเภอเมืองจันทบุรี'),
  MyListItem('assets/images/Dsoidao.jpg', 'อำเภอสอยดาว'),
  MyListItem('assets/images/Dpongnamron.jpg', 'อำเภอโป่งน้ำร้อน'),
  MyListItem('assets/images/Dthamai.jpg', 'อำเภอท่าใหม่'),
  MyListItem('assets/images/Dklung.jpg', 'อำเภอขลุง'),
  MyListItem('assets/images/Dmakham.jpg', 'อำเภอมะขาม'),
  MyListItem('assets/images/Dlamsing.jpg', 'อำเภอแหลมสิงห์'),
  MyListItem('assets/images/Dnayaiarm.jpg', 'อำเภอนายายอาม'),
  MyListItem('assets/images/Dkichagood.jpg', 'อำเภอเขาคิชฌกูฏ'),
  MyListItem('assets/images/Dkangharngmeow.jpg', 'อำเภอแก่งหางแมว'),
];

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentTabIndex = 0;
  final LinearGradient gradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 255, 250, 210),
      Color.fromARGB(255, 188, 222, 255),
      Color.fromARGB(255, 246, 196, 254),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  final LinearGradient gradienttab = LinearGradient(
    colors: [
      Color.fromARGB(255, 43, 0, 143),
      Color.fromARGB(255, 56, 17, 197),
      Color.fromARGB(255, 33, 46, 229),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  @override
  void initState() {
    _tabController =
        TabController(length: 11, vsync: this, initialIndex: _currentTabIndex);
    super.initState();
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 11,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: gradienttab, // Use the gradient for the background
            ),
          ),
          title: Text(
            'Chanthaburi Province',
            style: GoogleFonts.anuphan(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                exit(0); //ปิดแอพ
              },
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.grey,
              ),
            ),
          ],
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            labelColor: Colors.yellow,
            unselectedLabelColor: Colors.grey[400],
            indicatorColor: Colors.yellow,
            indicatorWeight: 5.0,
            tabAlignment: TabAlignment.start,
            tabs: [
              Tab(
                icon: Icon(
                  Icons.home,
                ),
                text: 'ข้อมูลจังหวัด',
              ),
              Tab(
                icon: Icon(
                  Icons.location_city_rounded,
                ),
                text: 'อำเภอเมืองจันทบุรี',
              ),
              Tab(
                icon: Icon(
                  Icons.location_city_rounded,
                ),
                text: 'อำเภอสอยดาว',
              ),
              Tab(
                icon: Icon(
                  Icons.location_city_rounded,
                ),
                text: 'อำเภอโป่งน้ำร้อน',
              ),
              Tab(
                icon: Icon(
                  Icons.location_city_rounded,
                ),
                text: 'อำเภอท่าใหม่',
              ),
              Tab(
                icon: Icon(
                  Icons.location_city_rounded,
                ),
                text: 'อำเภอขลุง',
              ),
              Tab(
                icon: Icon(
                  Icons.location_city_rounded,
                ),
                text: 'อำเภอมะขาม',
              ),
              Tab(
                icon: Icon(
                  Icons.location_city_rounded,
                ),
                text: 'อำเภอแหลมสิงห์',
              ),
              Tab(
                icon: Icon(
                  Icons.location_city_rounded,
                ),
                text: 'อำเภอนายายอาม',
              ),
              Tab(
                icon: Icon(
                  Icons.location_city_rounded,
                ),
                text: 'อำเภอเขาคิชฌกูฏ',
              ),
              Tab(
                icon: Icon(
                  Icons.location_city_rounded,
                ),
                text: 'อำเภอแก่งหางแมว',
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: Container(
            decoration: BoxDecoration(
              gradient: gradient,
            ),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text(
                    'ยินดีต้อนรับ',
                    style: GoogleFonts.kanit(
                      color: Colors.white,
                    ),
                  ),
                  accountEmail: Text(
                    'จังหวัดจันทบุรี',
                    style: GoogleFonts.kanit(),
                  ),
                  decoration: BoxDecoration(
                    gradient: gradienttab,
                    // image: DecorationImage(
                    //   image: AssetImage(
                    //     '',
                    //   ),
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/images/icon_large.png',
                    ),
                  ),
                  // otherAccountsPictures: [
                  //   CircleAvatar(
                  //     backgroundImage: NetworkImage(
                  //       'https://cdn.pixabay.com/photo/2017/02/08/12/47/cake-2048732_960_720.jpg',
                  //     ),
                  //   ),
                  //   CircleAvatar(
                  //     backgroundImage: NetworkImage(
                  //       'https://cdn.pixabay.com/photo/2019/08/29/16/39/tart-4439393_960_720.jpg',
                  //     ),
                  //   ),
                  // ],
                ),
                ListTile(
                  onTap: () {
                    setState(() {
                      _tabController.index = 0;
                    });
                    Navigator.pop(context);
                  },
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/images/Info.jpg',
                    ),
                  ),
                  title: Text(
                    'ข้อมูลจังหวัด',
                    style: GoogleFonts.sarabun(),
                  ),
                ),
                Divider(),
                // showListTile(context, 1, 'assets/images/Dmueng.jpg',
                //     'อำเภอเมืองจันทบุรี'),
                // showListTile(
                //     context, 2, 'assets/images/Dsoidao.jpg', 'อำเภอสอยดาว'),
                // showListTile(context, 3, 'assets/images/Dpongnamron.jpg',
                //     'อำเภอโป่งน้ำร้อน'),
                // showListTile(
                //     context, 4, 'assets/images/Dthamai.jpg', 'อำเภอท่าใหม่'),
                // showListTile(
                //     context, 5, 'assets/images/Dklung.jpg', 'อำเภอขลุง'),
                // showListTile(
                //     context, 6, 'assets/images/Dmakham.jpg', 'อำเภอมะขาม'),
                // showListTile(
                //     context, 7, 'assets/images/Dlamsing.jpg', 'อำเภอแหลมสิงห์'),
                // showListTile(
                //     context, 8, 'assets/images/Dnayaiarm.jpg', 'อำเภอนายายอาม'),
                // showListTile(context, 9, 'assets/images/Dkichagood.jpg',
                //     'อำเภอเขาคิชฌกูฏ'),
                // showListTile(context, 10, 'assets/images/Dkangharngmeow.jpg',
                //     'อำเภอแก่งหางแมว'),

                ListView.builder(
                  shrinkWrap: true,
                  itemCount: myListItems.length,
                  itemBuilder: (context, index) {
                    return showListTile(context, index + 1, myListItems[index]);
                  },
                ),

                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 33, 46, 229),
                  ),
                  child: ListTile(
                    onTap: () {
                      exit(0);
                    },
                    leading: Icon(
                      Icons.exit_to_app,
                    ),
                    title: Text(
                      'ออกจากการใช้งาน',
                      style: GoogleFonts.kanit(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: gradient,
          ),
          child: TabBarView(
            controller: _tabController,
            children: [
              showDetails(
                'จังหวัดจันทบุรี',
                'assets/images/Info.jpg',
                'assets/images/p2.jpg',
                'assets/images/p3.jpg',
                '039312277',
                'https://www.chanthaburi.go.th/frontpage',
                'https://maps.app.goo.gl/XAcsjvxpEMEEN4uj7',
              ),
              showShopWidget(
                'อำเภอเมืองจันทบุรี',
                'assets/images/p1-1.jpg',
                'assets/images/p5.jpg',
                'assets/images/p6.jpg',
                '039312272',
                '039319666',
                'https://chanmunic.go.th/',
                'https://maps.app.goo.gl/uPdum8CBemfRVatR6',
              ),
              showShopWidget(
                'อำเภอสอยดาว',
                'assets/images/p7.jpg',
                'assets/images/p8.jpg',
                'assets/images/p9.jpg',
                '039381105',
                '039381376',
                'https://www.soidaochan.go.th/index.php',
                'https://maps.app.goo.gl/yb1TUkdFYofRG1jH9',
              ),
              showShopWidget(
                'อำเภอโป่งน้ำร้อน',
                'assets/images/p10.jpg',
                'assets/images/p12.jpg',
                'assets/images/p11.jpg',
                '039387111',
                '039387003',
                'https://www.tessabanpong.go.th',
                'https://maps.app.goo.gl/cXnBsy1ZLJLg9hJ89',
              ),
              showShopWidget(
                'อำเภอท่าใหม่',
                'assets/images/p13.jpg',
                'assets/images/p14.jpg',
                'assets/images/p15.jpg',
                '039431111',
                '039431001',
                'https://thamaicity.go.th/public/',
                'https://maps.app.goo.gl/F99QkwbtKMTLEgPT7',
              ),
              showShopWidget(
                'อำเภอขลุง',
                'assets/images/p17.jpg',
                'assets/images/p18.jpg',
                'assets/images/p19.jpg',
                '039441456',
                '039441700',
                'https://khlungcity.go.th/public/',
                'https://maps.app.goo.gl/VU9zz3Uzy3eUDuB18',
              ),
              showShopWidget(
                'อำเภอมะขาม',
                'assets/images/p20.jpg',
                'assets/images/p21.jpg',
                'assets/images/p22.jpg',
                '039389018',
                '039389454',
                'www.makhammueangmai.go.th',
                'https://maps.app.goo.gl/JnMN89eGaL14JBBr8',
              ),
              showShopWidget(
                'อำเภอแหลมสิงห์',
                'assets/images/p23.jpg',
                'assets/images/p24.jpg',
                'assets/images/p25.jpg',
                '039499191',
                '039444300',
                'http://www.laemsingha.go.th/',
                'https://maps.app.goo.gl/Ddpp9cSN4qyoMD3ZA',
              ),
              showShopWidget(
                'อำเภอนายายอาม',
                'assets/images/p26.jpg',
                'assets/images/p27.jpg',
                'assets/images/p28.jpg',
                '039491069',
                '039491103',
                'https://www.nayaiam.go.th/contact.php',
                'https://maps.app.goo.gl/ZJu1UdMDFeTS4hUx5',
              ),
              showShopWidget(
                'อำเภอเขาคิชฌกูฏ',
                'assets/images/p29.jpg',
                'assets/images/p30.jpg',
                'assets/images/p31.jpg',
                '039309191',
                '039309241',
                'http://www.pluangcity.go.th/index.php',
                'https://maps.app.goo.gl/7SPRMKuYh44LX6xC7',
              ),
              showShopWidget(
                'อำเภอแก่งหางแมว',
                'assets/images/p32.jpg',
                'assets/images/p33.jpg',
                'assets/images/p34.jpg',
                '039308179',
                '039308028',
                'http://kanghangmaeo.go.th/',
                'https://maps.app.goo.gl/oXJcVzsUpaMcWcKK7',
              ),
            ],
          ),
        ),
      ),
    );
  }

  //showListTile

  Widget showListTile(BuildContext context, int index, MyListItem listItem) {
    return Column(
      children: <Widget>[
        Container(
          child: ListTile(
            onTap: () {
              setState(() {
                _tabController.index = index;
              });
              Navigator.pop(context);
            },
            leading: CircleAvatar(
              backgroundImage: AssetImage(
                listItem.image,
              ),
            ),
            title: Text(
              listItem.districtName,
              style: GoogleFonts.sarabun(),
            ),
          ),
        ),
        if (index != 10) Divider(),
      ],
    );
  }

  Widget showDetails(text1, image1, image2, image3, phone, url, map) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          Text(
            text1,
            style: GoogleFonts.sarabun(
              fontSize: MediaQuery.of(context).size.width * 0.06,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 25, 3, 151),
              shadows: [
                Shadow(
                  color:
                      Color.fromARGB(255, 247, 253, 158), // Bright shadow color
                  blurRadius: 5,
                  offset: Offset(0, 0),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image1,
                width: MediaQuery.of(context).size.width * 0.4,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.02,
              ),
              Image.asset(
                image2,
                width: MediaQuery.of(context).size.width * 0.4,
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image3,
                width: MediaQuery.of(context).size.width * 0.4,
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 50.0,
              right: 50.0,
            ),
            child: ListTile(
              onTap: () {
                _makePhoneCall(phone);
              },
              tileColor: Colors.pink[100],
              leading: Icon(
                Icons.local_police,
                color: Color.fromARGB(255, 25, 3, 151),
              ),
              title: Text(
                phone,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 50.0,
                right: 50.0,
              ),
              child: ListTile(
                onTap: () {
                  _launchInBrowser(
                    Uri.parse(map),
                  );
                },
                tileColor: Colors.pink[100],
                leading: Icon(
                  FontAwesomeIcons.mapPin,
                  color: Colors.red,
                ),
                title: Text(
                  'นำทางไปยังที่ว่าการอำเภอ',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 50.0,
              right: 50.0,
            ),
            child: ListTile(
              onTap: () {
                _launchInBrowser(
                  Uri.parse(url),
                );
              },
              tileColor: Colors.pink[100],
              leading: Icon(
                Icons.web,
                color: Color.fromARGB(255, 25, 3, 151),
              ),
              title: Text(
                url,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
        ],
      ),
    );
  }

  //showShopWidget Layouts of shop page
  Widget showShopWidget(
      text1, image1, image2, image3, phone1, phone2, url, map) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            Text(
              text1,
              style: GoogleFonts.sarabun(
                fontSize: MediaQuery.of(context).size.width * 0.06,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 25, 3, 151),
                shadows: [
                  Shadow(
                    color: Color.fromARGB(
                        255, 247, 253, 158), // Bright shadow color
                    blurRadius: 5,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  image1,
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                Image.asset(
                  image2,
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  image3,
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 50.0,
                right: 50.0,
              ),
              child: ListTile(
                onTap: () {
                  _makePhoneCall(phone1);
                },
                tileColor: Colors.pink[100],
                leading: Icon(
                  Icons.local_police,
                  color: Color.fromARGB(255, 25, 3, 151),
                ),
                title: Text(
                  phone1,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 50.0,
                right: 50.0,
              ),
              child: ListTile(
                onTap: () {
                  _makePhoneCall(phone2);
                },
                tileColor: Colors.pink[100],
                leading: FaIcon(
                  FontAwesomeIcons.hospitalUser,
                ),
                title: Text(
                  phone2,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 50.0,
                  right: 50.0,
                ),
                child: ListTile(
                  onTap: () {
                    _launchInBrowser(
                      Uri.parse(map),
                    );
                  },
                  tileColor: Colors.pink[100],
                  leading: Icon(
                    FontAwesomeIcons.mapPin,
                    color: Colors.red,
                  ),
                  title: Text(
                    'นำทางไปยังที่ว่าการอำเภอ',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 50.0,
                right: 50.0,
              ),
              child: ListTile(
                onTap: () {
                  _launchInBrowser(
                    Uri.parse(url),
                  );
                },
                tileColor: Colors.pink[100],
                leading: Icon(
                  Icons.web,
                  color: Color.fromARGB(255, 25, 3, 151),
                ),
                title: Text(
                  url,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}
