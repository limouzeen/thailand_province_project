import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:thailand_province_project/views/home_ui.dart';

class IntroductionUI extends StatefulWidget {
  const IntroductionUI({Key? key}) : super(key: key);

  @override
  State<IntroductionUI> createState() => _IntroductionUIState();
}

class _IntroductionUIState extends State<IntroductionUI> {
  final LinearGradient gradient = LinearGradient(
    colors: [
      const Color.fromARGB(255, 252, 241, 148),
      Color.fromARGB(255, 131, 194, 253),
      Color.fromARGB(255, 225, 103, 247),
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: gradient,
        ),
        child: IntroductionScreen(
          globalBackgroundColor: Colors.transparent,
          autoScrollDuration: 2000,
          infiniteAutoScroll: true,
          scrollPhysics: BouncingScrollPhysics(),
          pages: [
            PageViewModel(
              titleWidget: SafeArea(
                child: Text(
                  'วิสัยทัศน์',
                  style: GoogleFonts.anuphan(
                    fontSize: MediaQuery.of(context).size.height * 0.03,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 40, 11, 119),
                  ),
                ),
              ),
              image: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/view0.jpg',
                  width: MediaQuery.of(context).size.width * 0.7,
                ),
              ),
              bodyWidget: Center(
                // Center the content
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'จันทบุรี',
                        style: GoogleFonts.sarabun(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height * 0.022,
                          color: Color.fromARGB(255, 40, 11, 119),
                        ),
                      ),
                      TextSpan(
                        text:
                            ' เมืองเศรษฐกิจการเกษตร\n อัญมณี การค้าชายแดนและการท่องเที่ยว\n มูลค่าสูง ที่เป็นมิตรต่อสิ่งแวดล้อม\n มีความคิดสร้างสรรค์ และสังคมที่ดี',
                        style: GoogleFonts.sarabun(
                          fontSize: MediaQuery.of(context).size.height * 0.022,
                          color: Color.fromARGB(255, 35, 35, 51),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Add other PageViewModels similarly
            showPageViews(
              'ประวัติความเป็นมา',
              'assets/images/view3.png',
              '',
              'จันทบุรี เป็นเมืองเก่าแก่ เคยเป็นที่อยู่อาศัยของมนุษย์ยุคก่อนประวัติศาสตร์ มีการสำรวจโบราณคดีหลายแห่งในจันทบุรี พบเครื่องมือเครื่องใช้ยุคหินขัด อายุประมาณ 2,000 ปี ในเขตอำเภอมะขาม อำเภอท่าใหม่และที่ราบเชิงเขาที่บ้านคลองบอน อำเภอโป่งน้ำร้อน… ',
            ),

            showPageViews(
              'ข้อมูลจังหวัด',
              'assets/images/view1.png',
              '',
              'จังหวัดจันทบุรีเป็นจังหวัดในภาค\nตะวันออก ตั้งอยู่ชายฝั่งทะเลด้านทิศตะวันออก\nของอ่าวไทย อยู่ห่างจากกรุงเทพเป็น\nระยะทางประมาณ 245 กิโลเมตร\n มีเนื้อที่ประมาณ 6,338 ตารางกิโลเมตร',
            ),

            showPageViews(
              'คำขวัญจังหวัด',
              'assets/images/view2.jpg',
              '',
              'น้ำตกลือเลื่อง เมืองผลไม้\n พริกไทยพันธุ์ดี อัญมณีมากเหลือ\n เสื่อจันทบูร สมบูรณ์ธรรมชาติ\n สมเด็จพระเจ้าตากสินมหาราช\n รวมญาติกู้ชาติที่จันทบุรี\n ',
            ),


          ],
          showSkipButton: true,
          skip: Text(
            'Skip',
            style: GoogleFonts.kanit(
              color: Color.fromARGB(255, 23, 42, 153),
            ),
          ),
          onSkip: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeUI(),
            ),
          ),
          dotsDecorator: DotsDecorator(
            size: Size(
              MediaQuery.of(context).size.width * 0.025,
              MediaQuery.of(context).size.height * 0.025,
            ),
            color: Color.fromARGB(255, 142, 165, 241),
            activeSize: Size(
              MediaQuery.of(context).size.width * 0.025,
              MediaQuery.of(context).size.height * 0.025,
            ),
            activeColor: Color.fromARGB(255, 23, 42, 153),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(25.0),
              ),
            ),
          ),
          next: Icon(
            Icons.arrow_forward,
            color: Color.fromARGB(255, 23, 42, 153),
          ),
          nextFlex: 0,
          done: Text(
            'Done',
            style: GoogleFonts.sulphurPoint(
              color: Color.fromARGB(255, 23, 42, 153),
            ),
          ),
          onDone: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeUI(),
            ),
          ),
        ),
      ),
    );
  }

  PageViewModel showPageViews(text1, img, text2, text3) {
    return PageViewModel(
      titleWidget: SafeArea(
        child: Text(
          text1,
          style: GoogleFonts.anuphan(
            fontSize: MediaQuery.of(context).size.height * 0.03,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 40, 11, 119),
          ),
        ),
      ),
      image: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          img,
          width: MediaQuery.of(context).size.width * 0.7,
        ),
      ),
      bodyWidget: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: text2,
              style: GoogleFonts.sarabun(
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.height * 0.022,
                color: Color.fromARGB(255, 40, 11, 119),
              ),
            ),
            TextSpan(
              text: text3,
              style: GoogleFonts.sarabun(
                fontSize: MediaQuery.of(context).size.height * 0.022,
                color: Color.fromARGB(
                    255, 35, 35, 51), // Adjust the color as needed
              ),
            ),
          ],
        ),
      ),
    );
  }
}
