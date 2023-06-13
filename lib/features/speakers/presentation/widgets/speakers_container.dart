// ignore_for_file: inference_failure_on_function_invocation

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/speakers/data/models/speaker.model.dart';
import 'package:flutter_conf_colombia/features/speakers/data/repositories/speakers.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class SpeakersContainer extends StatelessWidget {
  const SpeakersContainer({super.key});

  static const height = 600.0;

  static const title = 'speakers_container';

  @override
  Widget build(BuildContext context) {
    return Container(
      /*height: height,
      color: Colors.blue[400],
      alignment: Alignment.center,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('speakers').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot data = snapshot.data!.docs[index];
                return SpeakerModel(
                  documentSnapshot: data,
                  name: data['name'].toString(),
                  //company: data['company'].toString(),
                  //twitter: data['twitter'].toString(),
                  //linkedin: data['linkedin'].toString(),
                  //photo: data['photo'].toString(),
                );
              },
            );
          }
        },
      ),*/
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      padding: EdgeInsets.fromLTRB(2, 50, 0, 0),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xffffffff),
      ),
      child: Column(
        children: [
          Container(
            // expositoresLtH (42:4)
            margin: const EdgeInsets.fromLTRB(0, 0, 1, 50),
            child: const Text(
              'EXPOSITORES',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 50,
                fontWeight: FontWeight.w700,
                height: 1.5,
                color: Color(0xff000000),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 10, 50),
            constraints: const BoxConstraints(
              maxWidth: 4280,
            ),
            child: const Text(
              'Nuestros primeros expositores\ndestacados (confirmados!)',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 30,
                fontWeight: FontWeight.w700,
                height: 1.1799998983,
                color: Color(0xff003087),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 600,
            child: Stack(
              children: [
                /*Positioned(
                  left: 0,
                  top: 0,
                  child: Align(
                    child: SizedBox(
                      width: 1440,
                      height: 600,
                      child: Image(
                        image: AssetImage(
                          'assets/images/topbanner.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),*/
                Positioned(
                  left: 0,
                  top: 0,
                  // ignore: sized_box_for_whitespace
                  child: Container(
                    width: 300,
                    height: 1271,
                    child: Column(
                      // ignore: avoid_redundant_argument_values
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 72),
                          width: double.infinity,
                          height: 420,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(656),
                            border: Border.all(
                              color: Color(0xff3b9ed8),
                              width: 4,
                            ),
                            image: const DecorationImage(
                              image: AssetImage(
                                'assets/images/colombia_flag.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 1000,
                          child: Stack(
                            children: [
                              const Positioned(
                                left: 0,
                                top: 0,
                                child: Align(
                                  child: SizedBox(
                                    width: 312,
                                    height: 175,
                                    child: Text(
                                      'Diego Velasquez',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        height: 1.5,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Align(
                                  child: SizedBox(
                                    width: 1376,
                                    height: 215,
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: const TextSpan(
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 10,
                                          fontWeight: FontWeight.w700,
                                          height: 1.5,
                                          color: Color(0xff000000),
                                        ),
                                        children: [
                                          // ignore: lines_longer_than_80_chars
                                          TextSpan(
                                            text:
                                                'Mobile\nSoftware Architect\nFlutter GDE\n',
                                          ),
                                          TextSpan(
                                            text: '@diegoveloper',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700,
                                              height: 1.5,
                                              color: Color(0xff3b9ed8),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
