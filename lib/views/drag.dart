import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import '../data/connection/repository/sites_repository.dart';
import '../model/sites.dart';

class DraggableSheet extends StatefulWidget {
  const DraggableSheet({super.key});

  @override
  State<DraggableSheet> createState() => _DraggableSheetState();
}

class _DraggableSheetState extends State<DraggableSheet> {
  final dragController = DraggableScrollableController();
  final minChildSize = 0.2;
  bool _visible = true;
  bool _buttonPress = true;
  late ScrollController collapseController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DraggableScrollableSheet(
          initialChildSize: 0.2,
          minChildSize: minChildSize,
          maxChildSize: 1,
          controller: dragController,
          builder:
              (BuildContext context, ScrollController insideScrollController) {
            collapseController = insideScrollController;
            return NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                final ScrollDirection direction = notification.direction;
                setState(
                  () {
                    if (direction == ScrollDirection.reverse) {
                      _visible = false;
                      _buttonPress = true;
                    } else if (direction == ScrollDirection.forward) {
                      _visible = true;
                      _buttonPress = false;
                    }
                  },
                );
                return _visible;
              },
              child: SingleChildScrollView(
                controller: insideScrollController,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      const CustomDraggingHandle(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: Row(
                          children: [
                            const CustomDraggableText(),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                dragController.animateTo(
                                  1,
                                  duration: const Duration(milliseconds: 100),
                                  curve: Curves.easeInCirc,
                                );
                              },
                              child: const Text(
                                "Voir liste",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Stolzl',
                                  color: Color.fromRGBO(1, 32, 60, 0.91),
                                ),
                              ),
                            )
                            // FIXME TEXT GESTURE DETECTOR HERE
                          ],
                        ),
                      ),
                      CustomInnerContent(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: _visible ? 0 : 1,
              child: FloatingActionButton.extended(
                onPressed: _buttonPress
                    ? () {
                        dragController.animateTo(
                          minChildSize,
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.bounceInOut,
                        );
                        if (collapseController.hasClients) {
                          collapseController.animateTo(
                            collapseController.position.minScrollExtent,
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.easeOutBack,
                          );
                          setState(
                            () {
                              _visible = true;
                              _buttonPress = false;
                            },
                          );
                        }
                      }
                    : null,
                label: const Text(
                  'Retour a la Map',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Stolzl',
                    color: Color.fromRGBO(134, 82, 255, 1),
                  ),
                ),
                icon: SvgPicture.asset(
                  'assets/icons/MapButtonIcon.svg',
                ),
                backgroundColor: const Color.fromRGBO(240, 234, 255, 1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomInnerContent extends StatefulWidget {
  const CustomInnerContent({super.key});

  @override
  State<CustomInnerContent> createState() => _CustomInnerContentState();
}

class _CustomInnerContentState extends State<CustomInnerContent> {
  late bool visible = true;
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 60),
      child: ListView.builder(
        physics: const PageScrollPhysics(),
        shrinkWrap: true,
        itemCount: _allsites.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 220,
            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(16),
                      ),
                      image: DecorationImage(
                        image: _allsites[index].image == ""
                            ? Image.asset('assets/icons/image.png').image
                            : ResizeImage(
                                NetworkImage(
                                  _allsites[index].image,
                                  scale: 0.4,
                                ),
                                height: 200,
                                width: 200,
                              ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                            gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(0, 0, 0, 0.6),
                                Colors.transparent,
                              ],
                              stops: [0, 0.8],
                              begin: Alignment.bottomCenter,
                              end: Alignment.center,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          _allsites[index].placeLabel,
                                          maxLines: 2,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Stolzl',
                                            //color: Colors.white,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 0),
                                            child: SvgPicture.asset(
                                              'assets/icons/categoryIcon.svg',
                                              width: 8,
                                              height: 8,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                8, 0, 0, 0),
                                            child: Text(
                                              _allsites[index]
                                                  .franaisCentresIntrt
                                                  .toString(),
                                              style: const TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Stolzl',
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                8, 0, 0, 0),
                                            child: SvgPicture.asset(
                                              'assets/icons/distance_icon.svg',
                                              width: 12,
                                              height: 12,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                4, 0, 0, 0),
                                            child: Text(
                                              _allsites[index].distance,
                                              style: const TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Stolzl',
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(16, 8, 0, 0),
                                    //padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: OutlinedButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(56.0),
                                          ),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          const Color.fromRGBO(
                                              240, 234, 255, 1),
                                          //Background Color
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        'Itinéraire',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Stolzl',
                                          //color: Color.fromARGB(1, 8, 8, 8),
                                          color:
                                              Color.fromRGBO(134, 82, 255, 1),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CustomDraggingHandle extends StatelessWidget {
  const CustomDraggingHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
      child: Container(
        height: 6,
        width: 40,
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}

class CustomDraggableText extends StatelessWidget {
  const CustomDraggableText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Lieux à découvrir",
      style: TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.w600,
        fontFamily: 'Stolzl',
        color: Color.fromRGBO(1, 32, 60, 0.91),
      ),
    );
  }
}
