import 'dart:io';

void main(){

triangle();

}


void triangle(){

double base=40.0;

  /* print('Enter your triangle base value :');
 double? base=double.tryParse(stdin.readLineSync()!);*/

double height=20.0;

/* print('Enter your triangle height :');
 double? height=double.tryParse(stdin.readLineSync()!);*/



    //if user validate input
/*if(base!= null && height != null && base>0 && height>0){

    // calculate area
   double area=0.5*base*height;
   print('The Triangle Area is : $area');
}
 else{

   print(' The Triangle  Area is Invalid');

 }*/


double area=0.5*base*height;
print('The Triangle Area is : $area');



}