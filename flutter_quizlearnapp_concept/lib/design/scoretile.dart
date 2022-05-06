part of 'designs.dart';

class ScoreTile extends StatelessWidget {
  const ScoreTile(
      {Key key,
      this.timer,
      this.skor,
      this.round,
      this.roundskor,
      this.questionindex,
      this.stagemodel})
      : super(key: key);
  final int timer;
  final int skor;
  final int round;
  final int roundskor;
  final int questionindex;
  final int stagemodel;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.04;
    if (kIsWeb == true) {
      height = MediaQuery.of(context).size.height * 0.05;
    } else {
      height = MediaQuery.of(context).size.height * 0.04;
    }
    double persensoal;
    if (round == 1) {
      persensoal = (questionindex + 1) / 4;
    } else {
      persensoal = (questionindex + 1) / 10;
    }
    return Column(
      children: [
        if (stagemodel != 0) ...[
          Container(
            color: Colors.transparent,
            height: height,
            width: double.maxFinite,
            child: Row(
              children: [
                Spacer(),
                Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularPercentIndicator(
                          radius: 15,
                          lineWidth: 3.5,
                          percent: 1,
                          progressColor: Colors.white,
                          center: Text(
                            round.toString(),
                            style: GoogleFonts.notoSans(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        CircularPercentIndicator(
                          radius: 15,
                          lineWidth: 3.5,
                          percent: persensoal,
                          progressColor: Colors.white,
                          center: Text(
                            (questionindex + 1).toString(),
                            style: GoogleFonts.notoSans(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ]),
                ),
                Spacer()
              ],
            ),
          ),
          Container(
            color: Colors.transparent,
            height: MediaQuery.of(context).size.height * 0.04,
            width: double.maxFinite,
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(Icons.timer, color: Colors.white),
                      Flexible(
                        child: Container(
                          //width: MediaQuery.of(context).size.width * 0.25,
                          decoration: BoxDecoration(
                            color: Colors.transparent.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(25),
                            shape: BoxShape.rectangle,
                          ),
                          height: double.maxFinite,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              timer.toString(),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.notoSans(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        "Skor",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.notoSans(color: Colors.white),
                      ),
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(25),
                            shape: BoxShape.rectangle,
                          ),
                          height: double.maxFinite,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              roundskor.toString(),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.notoSans(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        "Total",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.notoSans(color: Colors.white),
                      ),
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(25),
                            shape: BoxShape.rectangle,
                          ),
                          height: double.maxFinite,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              skor.toString(),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.notoSans(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ] else if (stagemodel == 0) ...[
          Container(
            color: Colors.transparent,
            height: height,
            width: double.maxFinite,
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(Icons.timer, color: Colors.white),
                      Flexible(
                        child: Container(
                          //width: MediaQuery.of(context).size.width * 0.25,
                          decoration: BoxDecoration(
                            color: Colors.transparent.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(25),
                            shape: BoxShape.rectangle,
                          ),
                          height: double.maxFinite,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              timer.toString(),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.notoSans(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: CircularPercentIndicator(
                    radius: 15,
                    lineWidth: 3.5,
                    percent: (questionindex + 1) / 10,
                    progressColor: Colors.white,
                    center: Text(
                      (questionindex + 1).toString(),
                      style: GoogleFonts.notoSans(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        "Skor",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.notoSans(color: Colors.white),
                      ),
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(25),
                            shape: BoxShape.rectangle,
                          ),
                          height: double.maxFinite,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              roundskor.toString(),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.notoSans(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ]
      ],
    );
  }
}
