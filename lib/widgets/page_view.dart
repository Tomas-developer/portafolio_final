import 'package:flutter/material.dart';
import 'package:portafolio/commons/commons.dart';

import 'package:portafolio/model/model.dart';
import 'package:portafolio/widgets/custom_painters.dart';
import 'package:portafolio/widgets/presentation_widget.dart';
import 'package:portafolio/widgets/second_page_view.dart';
import 'package:provider/provider.dart';
import 'package:timelines/timelines.dart';

import 'about_me_widget.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Model>(context, listen: false);

    return Expanded(
      child: PageView(
        
        controller: provider.controller,
        scrollDirection: Axis.vertical,
        onPageChanged: (value) => provider.setCurrentPage = value,
        children: [
          const PresentationWidget(),
          const AboutMeWidget(),
          const Training(),
          ExperenceWiget(),
          const Libraris(),
          const SecondPageView()
        ],
      ),
    );
  }
}


class Training extends StatelessWidget {
  const Training({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      
      painter: CustomPainter1(),
      child: Container(
        child: TimeLineWidget(experences: const {
          "Desarrollo de Aplicaciones Web (DAW)" : "IES Pedro mercedes 2017 - 2019",
          "Desarrollo de Aplicaciones Multiplataforma (DAM)" : "IES Pedro mercedes 2019 - 2020"
        }, title: "Estudios"),
      ),
    );
  }
}

class ExperenceWiget extends StatelessWidget {
  ExperenceWiget({super.key});

  final Map<String, String> experences = {
    "Getronics 2021 - 2023" : "Cliente banco santander: desarrollo de microservicios con spring boot",
    "Getronics 2023 - Actual" : "Cliente Servicio Público Empleo Estatal: mantenimiento de aplicaciones java",
    "Proyectos personales" : "Desarrollo de aplicaciones propias para moviles y web utilizando flutter con sus principales librerias (http, provider, getX ..) y utilizando los patrones de diseño provider y bloc."
  };

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      
      painter: CustomPainter2(),
      child: TimeLineWidget(experences: experences, title: "Experiencia profesional.",),
      
    );
  }
}

class TimeLineWidget extends StatelessWidget {
   TimeLineWidget({
    super.key,
    required this.experences,
    required this.title
  });

    double fontSizeTitle = 20;
  double fontSizeSubtitle = 15;


  final String title;
  final Map<String, String> experences;

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    checkSize(width);

    return Container(
      padding: const EdgeInsets.only(top: 100),
      child: Column(
        children: [
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Text(title, style: const TextStyle(fontSize: 18, color: colorText))),
          Expanded(
            child: Timeline.tileBuilder(
              physics: const NeverScrollableScrollPhysics(),
              theme: TimelineThemeData(
                color: colorText,
                direction: Axis.vertical
              ),
              builder: TimelineTileBuilder.fromStyle(
                
                contentsAlign: ContentsAlign.basic,
                contentsBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: colorText,
                borderRadius: BorderRadius.circular(30)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start ,
                children: [
                  Text(experences.keys.toList()[index], style: TextStyle(fontSize: fontSizeTitle, color: secondaryColor)),
                  Text(experences.values.toList()[index], style: TextStyle(fontSize: fontSizeSubtitle, color:  secondaryColor),)
                ],
              ),
            ),
                ),
                itemCount: experences.length,
              ),
                ),    
          )
        ],
      ),
    );
  }

  void checkSize(double width) {
    if(width < 700) {
      fontSizeTitle = 15;
      fontSizeSubtitle = 12;
    } else {
      fontSizeTitle = 20;
      fontSizeSubtitle = 15;
    }
  }
}

class Libraris extends StatelessWidget {
  const Libraris({super.key});

  @override
  Widget build(BuildContext context) {
    final double space = spaceItems(context);
    return CustomPaint(
      painter: CustomPainter1(),
      child: Padding(
        padding: const EdgeInsets.only(top: 100, right: 10, left: 10, bottom: 20),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Text("Skills", style: TextStyle(fontSize: 17, color: colorText),)),
            Expanded(
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: space,
                crossAxisSpacing: space,
               crossAxisCount: countItemsRow(context),
               children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    color: Colors.white,child: Image.asset("images/spring.png"))),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child:Container(
                    padding: const EdgeInsets.all(5),
                    color: Colors.white,child: Image.asset("images/java.jpg"))),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child:Container(
                    padding: const EdgeInsets.all(5),
                    color: Colors.white,
                    child: Image.asset("images/flutter.png"))),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child:Container(
                    padding: const EdgeInsets.all(5),
                    color: Colors.white,
                    child: Image.asset("images/dart.png"))),
                ClipRRect(
                  
                  borderRadius: BorderRadius.circular(20),
                  child:Container(
                    color: Colors.white,
                    child: Image.asset("images/mongodb.png"))),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child:Container(
                    padding: const EdgeInsets.all(5),
                    color: Colors.white,
                    child: Image.asset("images/gradle.png"))),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child:Container(
                    color: Colors.white,
                    child: Image.asset("images/maven.png"))),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child:Container(
                    padding: const EdgeInsets.all(5),
                    color: Colors.white,child: Image.asset("images/kotlin.png"))),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child:Container(
                    padding: const EdgeInsets.all(5),
                    color: Colors.white,child: Image.asset("images/junit.png"))),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child:Container(
                    padding: const EdgeInsets.all(5),
                    color: Colors.white,child: Image.asset("images/eclipse.png"))),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child:Container(
                    padding: const EdgeInsets.all(5),
                    color: Colors.white,child: Image.asset("images/androidstudio.png"))),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child:Container(
                    padding: const EdgeInsets.all(5),
                    color: Colors.white,child: Image.asset("images/vscode.png"))),
               ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  int countItemsRow(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    
    if(width > 850) {
      return 6;
    }

    if(width > 450) {
      return 4;
    }
      return 3;
    

  }

  double spaceItems(BuildContext context) {
        final width = MediaQuery.of(context).size.width;

    if(width > 850) {
      return 10;
    }
    
    if(width > 500) {
      return 14;
    }

    if(width > 450) {
      return 15;
    }

    return 24;
  }
}
