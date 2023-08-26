import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/connection/repository/sites_repository.dart';
import '../model/sites.dart';

class Cards extends ConsumerStatefulWidget {
  const Cards({super.key});

  @override
  ConsumerState<Cards> createState() => _CardsState();
}

class _CardsState extends ConsumerState<Cards> {
  bool cardVisible = true;
  bool isLoading = true;
  List<Sites> _allsites = [];
  Future<void> getAllSitesList(
    double latitude,
    double longitude,
  ) async {
    try {
      _allsites = await SitesRepository().getAllSites(latitude, longitude);

      setState(() {
        isLoading = false;
      });
    } catch (e, s) {
      // inside catch
      print('***StackTrace*** => $s');
      print('***erreur*** => $e');
      final snackBar = SnackBar(
        content: Text('ERROR  => $e'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  void initState() {
    super.initState();
    getAllSitesList(33.887923, 10.098633);
  }

  @override
  Widget build(BuildContext context) {
    double calculateSize(String sizes, double value) {
      double val;
      if (sizes == "w") {
        val = ((value * 100) / 375) / 100;
        return MediaQuery.of(context).size.width * val;
      } else {
        val = ((value * 100) / 812) / 100;

        return MediaQuery.of(context).size.height * val;
      }
    }

    if (cardVisible) {
      return SizedBox(
        // height: MediaQuery.of(context).size.height * 0.14,
        height: MediaQuery.of(context).size.height * 0.28,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 72),
          child: ListView.builder(
            padding: EdgeInsets.only(
                left: calculateSize("w", 8), right: calculateSize("w", 8)),
            scrollDirection: Axis.horizontal,
            itemCount: _allsites.length,
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return Visibility(
                    visible: cardVisible,
                    maintainState: true,
                    maintainAnimation: true,
                    maintainSize: true,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: calculateSize("w", 8),
                                          top: calculateSize("h", 8),
                                          right: calculateSize("w", 0)),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8)),
                                        child: Image(
                                          height: calculateSize("h", 100),
                                          width: calculateSize("w", 100),
                                          image: _allsites[index].image == ""
                                              ? Image.asset(
                                                      'assets/icons/image.png')
                                                  .image
                                              : ResizeImage(
                                                  NetworkImage(
                                                    _allsites[index].image,
                                                  ),
                                                  height: 200,
                                                  width: 200,
                                                ),
                                          fit: BoxFit.cover,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        width: calculateSize("w", 203),
                                        height: double.infinity,

                                        //#####################

                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 30.0),
                                                    child: Text(
                                                      _allsites[index]
                                                          .placeLabel,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                      style: const TextStyle(
                                                        color: Color.fromARGB(
                                                            230, 1, 32, 60),
                                                        fontFamily: 'Stolzl',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Flexible(
                                              flex: 2,
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 6,
                                                        left: 0,
                                                        right: calculateSize(
                                                            "w", 28)),
                                                    child: const Expanded(
                                                      child: Text(
                                                        maxLines: 3,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        "Plongez dans l'histoire et la spiritualité à la mosquée Zitouna de Tunis 🕌📚",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              230, 1, 32, 60),
                                                          fontFamily: 'Stolzl',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 13,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                        ),
                                                        // minFontSize: 6,
                                                        // maxFontSize: 28,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: calculateSize("h", 8),
                                                  left: 0),
                                              child: Row(
                                                children: [
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 2.0),
                                                    child: Icon(
                                                      Icons.circle,
                                                      size: 8,
                                                      color: Colors.amber,
                                                    ),
                                                  ),
                                                  const Text(
                                                    "Art et architecture",
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          191, 3, 32, 63),
                                                      fontFamily: 'Stolzl',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 10,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: calculateSize(
                                                            "w", 8),
                                                        right: calculateSize(
                                                            "w", 4)),
                                                    child: const ImageIcon(
                                                      AssetImage(
                                                          'assets/icons/Direction.png'),
                                                      size: 16,
                                                    ),
                                                  ),
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        left: .0),
                                                    child: Text(
                                                      "18KM",
                                                      style: TextStyle(
                                                        color: Color.fromARGB(
                                                            191, 3, 32, 63),
                                                        fontFamily: 'Stolzl',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          right: 8,
                          top: 8,
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  cardVisible = false;
                                });
                              },
                              icon: SvgPicture.asset(
                                'assets/icons/Cancel.svg',
                                height: calculateSize("h", 48),
                                width: calculateSize("w", 48),
                              )),
                        )
                      ],
                    ),
                  );
              }
            },
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
