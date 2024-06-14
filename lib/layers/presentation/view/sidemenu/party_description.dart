import 'dart:ui';

import 'package:aps_party/layers/data/utils/app_color.dart';
import 'package:aps_party/layers/data/utils/app_images.dart';
import 'package:aps_party/layers/domain/entity/banner_member.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PartyDescription extends StatefulWidget {
  const PartyDescription({super.key});

  @override
  State<PartyDescription> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<PartyDescription> {
  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   title: Text(
      //     "ASP Party ",
      //     style: TextStyle(
      //         fontFamily: 'Fontspring-DEMO-blue_vinyl_regular_ps_ot',
      //         fontSize: 30),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(
                  padding: EdgeInsets.all(10),
                  // height: h * 0.45,
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 2.h,
                          ),
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  height: 35.h,
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.only(left: 1.0, right: 1),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image: AssetImage(AppImages.dr),
                                          fit: BoxFit.fill)),
                                ),
                              ),
                              Positioned(
                                // top: 2.h,
                                left: 1.h,
                                // right: 0,
                                bottom: 2.h,
                                child: SizedBox(
                                    child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10)),
                                    color:
                                        AppColors.primarycolor.withOpacity(0.6),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: const Text(
                                      "About The Party",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ),
                                )),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 10),
                            child: Text(
                              "आज़ाद समाज पार्टी क्यों",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 0),
                            child: Text(
                              // widget.userStory.description,
                              "दुनिया के जितने भी व्यक्तिगत या राजनैतिक संघर्ष है , वो सारे के सारे आज़ादी के लिए है ! मनुष्य जब से जन्म लेता है अंतिम समय तक आज़ादी के लिए संघर्ष करता है ! मनुष्य आर्थिक आज़ादी चाहता है ! जिसके लिए रात दिन मेहनत , मशक्कत करता है ! मनुष्य रोग मुक्त शारीरक आज़ादी चाहता है ,सवस्थ रहना चाहता है ! मनुष्य मानसिक आज़ादी चाहता है , ताकि वह दक़ियानूसी विचारो को त्याग ,अपने हिसाब से कुछ आज़ाद विचार सोच सके ! इंसान जीने की ,सोचने की, रहने की , खाने की , शिक्षा ,स्वास्थ्य ,धर्म की , जातीय बंधन की या किसी भी प्रकार की गुलामी से मुक्त समाज स्थापित करने को छटपटा रहा है ! सारे बंधनो से आज़ाद होने के लिए व्याकुल , आकुल है ! भारतीय समाज ने सदियों की गुलामी से आज़ादी १९४७ में अथक संघर्षो के बाद ली ! गुलाम जनता ने क्रूर शाशको , जन्मजात राजाओ , हुडो ,मुगलो ,अंग्रेजो का शासन पीडी दर पीढ़ी हज़ारो हज़ार साल तक झेला ! सामजिक गुलामी से कई हज़ारो सालो से एक पुरे के पुरे बहुल समाज जिसमे अनुसुचिंत जाती ,जनजाति , महिलाओ , धार्मिक अल्पसंख्यकों को मनुवादी विचार ने मानसिक गुलामी में जकड के रखा हुआ है, निरंतर शोषण जारी है , जो अब इस गुलामी से आज़ाद होना चाहता है ! बाबा साहेब भीम राव अम्बेडकर ने कहा था राजनैतिक सत्ता हासिल कर , शाशन तंत्र हाथ में लिए बिना भारत की बड़ी आबादी आज़ाद नहीं हो सकती !",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 04, vertical: 10),
                            child: Text(
                              // widget.userStory.description,
                              "बड़ी आबादी को १९४७ की सत्ताई आज़ादी से आज तक शिक्षा , स्वाथ्य ,रोजगार ,सामजिक सम्मान ,न्याय जैसे मूलभूत जीवन कारक नहीं मिले ! यह आज भी गुलाम है ! आज भी मनुवादी विचार की गुलामी ने इनको आज़ाद नहीं किया ! इन सबको आज़ाद करने का वक़्त आ गया है ! \n भारत वर्ष के अंदर हमारे ही नागरिक , धार्मिक उत्पीड़न के शिकार हो कर, मनुवादी लोगो से भयभीत होकर गुलाम की तरह जीवन जी रहे है ! धार्मिक अल्पसंख्यकों को भारत के संविधान के दायरे में उनके भय को ख़त्म कर आज़ाद भारत में इस डर से आज़ादी देने का वक़्त आ गया है ! \n  बहुजन समाज को सत्ता की गुलामी , वोटो की सौदागिरी से धनवादी राजनैतिक गुलामी , परिवारवादी सोच की गुलामी से आज़ाद करने का समय आ गया है !भारतीय समाज १९४७ की सत्ताई आजादी के बाद भी भ्रष्टाचार , अनाचार , अत्याचार का गुलाम है उसको रोज़ मर्रा जीवन में आने वाली समस्याओ , आपदाओं से आज़ादी का समय आ गया है ! \n क्या भारत की जनता को असली आज़ादी मिली ?? या फिर गोरो की सत्ताई गुलामी हटकर , आज हमारा समाज ,अपने ही लोगो ने , कुछ राजनीतिज्ञों ने, कुछ नौकरशाहो , पूंजीपतियों ने इस लोकतंत्र को गुलाम बना लिया है ?? जनता आज इनकी गुलामी से त्रस्त हो , नया सवेरा तलाश रही है , इनसे सांविधानिक आज़ादी आज़ादी का समय आ गया है ! \n गरीब, आम जन, किसान , मजदूर आज पूंजीपतियों का गुलाम बन गया है उसको आर्थिक असमानता ख़त्म कर अपनी आज़ादी चाहिए ! इन्ही सब मूल्यों की रक्षा के लिए , आज गुलाम मानव को आज़ादी देने लिए हम “आज़ाद समाज पार्टी” के रूप में राजनैतिक संगठन बना रहे है ! जो मानव को हर प्रकार की गुलामी से मुक्ति का राजनैतिक , सामजिक प्लेटफॉर्म बनाकर भारत के अंदर नया समाज , नई सोच , नई ऊर्जा विकसित करेगी !",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 04, vertical: 10),
                            child: Text(
                              "बहुजनसमाज जो कई हज़ार वर्ष से गुलामी से जकड़ा भीम राव अबेडकर” को इस धरती पर महामानव के रूप में भेजा! उसके बाद \n मान्यवर काशीराम साहब ने ने सोती कौम को जगा दिया और शासक बनना सिखाया ! परंतु जब मिशन पूरी तरह ढह गया चारों तरफ अंधकार से देखने लगा कोई रास्ता समझ में नहीं आ रहा था धन ,दौलत ,मोह , माया के चक्कर में उनकी शिक्षाओं व मिशन की तिलांजलि देकर , समाज द्वारा दी हुई राजनैतिक ताक़त को कुछ लोगो ने निजी पूंजी बनाने का जरिया बना लिया ! ऐसे समय जब धार्मिक अल्पसख्यको को सताया जा रहा हो, तरह तरह के मुद्दे ला कर लोकतान्त्रिक भारत में लोगो को डराया ,सताया जा रहा है उनका दमन किया जा रहा है ! दूसरी तरफ घोर मनुवादी लोग सत्ता में काबिज हो चुके है वह मानसिक गुलाम बनाकर सदियों को दलित ,पिछडो के हक़ को निजीकरण कर ,रेजेर्वेशन ख़त्म करने की राह पर है ! राजनीति में पैसे से सत्ता ,सत्ता से पैसा का खेल गरीबो दलितों के वोट से चंद लोग खेल रहे हो !समाज को गुलाम रखने पर तुले है! चारो तरफ घोर निराशा ,अंधकार देश में फैला हुआ है !",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 04, vertical: 10),
                            child: Text(
                              "हमारे राष्ट्रीय अध्यक्ष एडवोकेट चंद्रशेखर आजाद गरीबी को देखा है , समाज की दकियानूसी जिल्लत को झेला है ! भाई ने अपना जीवन आपको समर्पित कर दिया है ! जो मनुवादियो के जुल्म के खिलाफ अपनी जान देने को तैयार है !,भारत के लोकतंत्र को बचाने ,आपके बच्चो के उज्जवल भविष्य की आज़ाद सोच को लेकर निकले हैं! \n ऐसे समय में जब “हाथ” निरंतर कीचड पैदा कर आज “कमल “को खिलने का मौका दे रहा हो ! हमारे समाज के बहुत सारे नेता भाई भतीजावादी हो ,उम्र के पड़ाव में” माया “बचाने को समझौता वादी हो कर मनुवादियो की कठपुतली बन गए हो ! कोई रास्ता बचा न हो तो ! प्रारंभ करते हैं बाबा साहब एवं मान्यवर कांशीराम के दिखाए रास्ते पर चलकर आओ नए उनके सपनों का भारत बनाएं! भारत की 85% आबादी को उसका हक दिलाते हैं ! समय के बदलाव के साथ , नए सच्चे आज़ाद भारत के निर्माण को,, भाई चंद्रशेखर आज़ाद को अपना नेता मान कर उनको तन ,मन धन से उसको शक्ति प्रदान करनी होगी ! लोकतंत्र सविंधान ,धर्म निरपेक्षता बचाना होगा ! बहुत जनों को इस देश का शासक बनाना है उसके लिए संघर्ष त्याग और बलिदान के लिए तैयार रहना होगा आओ हम सब मिलकर चलें और भाई चंद्रशेखर आजाद के नेतृत्व में अपने पूर्वजों के दिखाए रास्ते पर चलकर उनके सपनों को साकार करने का प्रण लें",
                              style: TextStyle(fontSize: 16),
                            ),
                          )
                        ],
                      )
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
