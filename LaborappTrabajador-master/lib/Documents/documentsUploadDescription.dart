import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';
import 'filterChip.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';

class documentsUploadDescription extends StatelessWidget {
  var singletonWorkerInstance = SingletonWorker();

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          textDirection: TextDirection.rtl,
          children: <Widget>[
            Align
              (
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Localidad:",
      //Localidad items: <String>['Usaquén','Chapinero','Santa Fe','Usme','Tunjuelito','San Cristóbal',
                  //  'Bosa','Kennedy','Fontibón','Engativá','Suba','Barrios Unidos','Teusaquillo',
                  //  'Los Mártires','Antonio Nariño','Puente Aranda','La Candelaria',
                  //  'Rafael Uribe','Ciudad Bolívar','Sumapaz']
                  style: TextStyle(color: Colors.black26,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: Align
                (
                alignment: Alignment.centerLeft,
                child: Container(
                    child: Wrap(
                      spacing: 5.0,
                      runSpacing: 3.0,
                      children: <Widget>[

      //Especialidad items: <String>['Pintura', 'Drywall', 'Lavado de Fachada y Aseo', 'Mampostería', 'Estrucutra']
      //Pintura items: <String>['Estuco',
                        //      'Segunda Mano',
                        //      'Terminación',
                        //      'Graniplast',
                        //      'Carraplast',
                        //      'Ayudante']

      //Drywall items: <String>['Estructura',
                        //      'Tapado',
                        //      'Empastador',
                        //      'Ayudante']

      //Lavado items: <String>['Lavador',
                        //     'Aseo']

      //Mamposteria items: <String>['Oficial',
                        //          'Media Cuchara',
                        //          'Ayudante',
                        //          'Mampostero',
                        //          'Pañetador',
                        //          'Enchapador']

      //Estructura items: <String>['Oficial',
                        //         'Media Cuchara',
                        //         'Ayudante',
                        //         'Latero']

                        filterChipWidget(chipName: 'TAG1'),
                        filterChipWidget(chipName: 'TAG2'),
                      ],
                    )
                ),
              ),
            ),
            SizedBox(
                height: getHeightWithoutSafeAreaAppBar(context) * 0.06),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AutoSizeText(
                  "AHORA, ES EL MOMENTO DE \n"
                  "SUBIR LOS DOCUMENTOS, \n"
                  "SÓLO ES TOMARLE FOTO CON \n"
                  "EL CELULAR A CADA UNO",
                  maxLines: 4,
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w800),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(
                height: getHeightWithoutSafeAreaAppBar(context) * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  onPressed: () {
                    
                  },
                  child: new ConstrainedBox(
                    constraints: new BoxConstraints.expand(),
                    child: new Image.asset('assets/registo_obrero/workerSignIn/camara1.png')
                  ),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  onPressed: () {

                  },
                  child: new ConstrainedBox(
                      constraints: new BoxConstraints.expand(),
                      child: new Image.asset('assets/registo_obrero/workerSignIn/camara2.png')
                  ),
                ),
                    FloatingActionButton(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      onPressed: () {

                      },
                      child: new ConstrainedBox(
                          constraints: new BoxConstraints.expand(),
                          child: new Image.asset('assets/registo_obrero/workerSignIn/camara3.png')
                      ),
                    ),
              ],
            )
          ],
        ),
      ),
    );
  }
}