
// ignore_for_file: deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';



class TextInputPedidos extends StatelessWidget {
  final String title;
  final Color colorText;
  final double dimen;
  final VoidCallback? onPressed;
  final bool sombra;
  final bool subrayado; 

  const TextInputPedidos({
    super.key,
    required this.title,
    required this.colorText,
    required this.dimen,
    required this.onPressed,
    required this.sombra,
    required this.subrayado, // incluir en constructor
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      //  softWrap: true,
      //  overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: TextStyle(
        color: colorText,
        fontSize: dimen,
        fontStyle: FontStyle.italic,
        fontFamily: 'Georgia',
        decoration: subrayado ? TextDecoration.underline : TextDecoration.none, // lógica de subrayado
        decorationColor: colorText,    //  color de la línea
        decorationThickness: 2.0,             // opcional: grosor de la línea
        shadows: sombra
            ? [
                Shadow(
                  offset: const Offset(5.0, 5.0),
                  blurRadius: kIsWeb ? 4.0 : 8,
                  color: colorText.withOpacity(0.4),
                ),
              ]
            : null,
      ),
    );
  }
}

class TextInputPedidosParrafo extends StatelessWidget { 
   final  String title;
   final  Color colorText;
   final  double dimen;
   final VoidCallback? onPressed;
   final bool sombra;
  const TextInputPedidosParrafo({
    super.key,    
   required this.title,
    required this.colorText,
    required this.dimen,
    required this.onPressed,
    required this.sombra,
    });
  @override
  Widget build(BuildContext context) {
   return   Text(
  title,
  textAlign: TextAlign.center,
  softWrap: true, // Permite que el texto se divida en varias líneas
  overflow: TextOverflow.visible, // Evita que se corte o se muestre con puntos suspensivos
  style: sombra == true
      ? TextStyle(
          color: colorText,
          fontSize: dimen,
          fontStyle: FontStyle.italic,
          fontFamily: 'Georgia',
          shadows: [
            Shadow(
              offset: const Offset(5.0, 5.0),
              blurRadius: 1.0,
              color: Colors.grey.withOpacity(0.4),
            ),
          ],
        )
      : TextStyle(
          color: colorText,
          fontSize: dimen,
          fontStyle: FontStyle.italic,
          fontFamily: 'Georgia',
        ),
);
  }
}