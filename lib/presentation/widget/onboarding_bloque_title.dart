// ignore_for_file: unused_local_variable
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:grupo_exito/presentation/widget/text_input_pedidos.dart';
import 'package:sizer/sizer.dart';


Widget onboardingBloqueTitle(BuildContext context){
      return Column(
      children: [                        
         TextInputPedidos(
              title: 'Pedidos', 
              colorText: const Color(0xff000000), 
              dimen:  22.sp ,
              onPressed: (){},
              sombra: kIsWeb ? false : true,
              subrayado: false,
             ),                                   
          SizedBox( height: 1.h,),    
          TextInputPedidos(
              title: "al alcance de tu mano!", 
              colorText: const Color(0xff000000), 
              dimen:  18.sp, 
              onPressed: (){},
              sombra: kIsWeb ? false : true,
              subrayado: false,
          )
   ],
  );
}