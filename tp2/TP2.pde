PImage foto1,foto2,foto3;
String texto1 = "Fosiles Interactivos en \n Dinosaurios Argentinos \n 2009 \n Rosenheim Alemania";
String texto2 = "Autores: \n Emiliano Causa \n Matias Romero Costas \n Julia Masvernar \n Fernando Boto Ardouin \n y otros.";
String texto3 = "Consistia en una proyeccion en una \n pared que simulaba un suelo \n interactivo.";
String texto4 = " El publico podia participar usando su \n propia sombra, a modo de espejo \n trasformante, para escabar \n virtualmente y descubriri fosiles \n enterrados.";
String texto5 = "Una ves que los fosiles eran \n desenterrados por completo, \naparecia su imagen junto su nombre \n y una silueta humana, \n permitiendo al publico \n comprender su escala real.";
PFont  tipografia;
int numPantalla;
int contadorTiempo;
int indice = 0;
boolean textoPantalla1 = false;
boolean textoPantalla2 = false;
boolean cicloTerminado = false;
boolean movimientoTexto5;
float velocidadtexto;
float y = 1.0;
float x;

//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void setup (){
  size(640,480);//tamaño de la pantalla 
  numPantalla =0;
  contadorTiempo =0;
  frameRate(30); //cantidad de frame por fotograma 
  tipografia = createFont("THEBOLDFONT-FREEVERSION.otf",48);
  textFont(tipografia);
  y = height;
  x = -300;
  velocidadtexto = 3;
   movimientoTexto5 = true;
}

//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void draw (){
  background(255);//color de la pantalla 
  
 //Primera imagen 
if (numPantalla == 0){
  foto1 = loadImage("foto1.jpg");
  image(foto1,0,0,640,480);
  float opacidad = map(contadorTiempo,0,150,0,255);
  fill(255,opacidad);
  textAlign(CENTER,CENTER);
  textSize(50);
  text(texto1,width/2,height/2);
  
  
}

//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 else if (numPantalla == 1){
  //Segundo texto de la primera imagen
  foto1 = loadImage("foto1.jpg");
  image(foto1,0,0,640,480);
 // y = -textWidth(texto2);
  fill(255);
  textAlign(CENTER);
  textSize(50);
  text(texto2,width/2,y);
  //actualizar la posicion del texto
  y -= 2;
  y -= velocidadtexto;//incrementa la posicion con la velocidad especificada 
}
  
 //----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------   
 else if (numPantalla == 2){
   
  //contador para aumentar el nnumero de pantalla 
  foto2 = loadImage("foto2.jpg");
  image(foto2,0,0,640,480);
  //primer texto de la segunda pantalla 
  if(!textoPantalla2){
   //mostrar texto letra por letra 
   String textoSubstraer = texto3.substring(0, indice);
   fill(255);
   textSize(32);
   textAlign(LEFT,TOP);
   text(textoSubstraer,20,20);
   
   //incrementa el indice para mostrar la siguiente letra 
   indice++;
   
   //comprobar si se a mostrado todo el texto
   if (indice > texto3.length()){
     textoPantalla2 = true;
   
    }
 } else {
   //mostrar todo el texto 
   fill(255);
   textSize(32);
   textAlign(LEFT,TOP);
   text(texto3,20,20);
} 
 
 }

//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
else if (numPantalla == 3){
    foto2 = loadImage("foto2.jpg");
  image(foto2,0,0,640,480);
   fill(255);
   textSize(32);
   textAlign(LEFT,TOP);
   text(texto3,20,20);
   
     if(!textoPantalla1){
   //mostrar texto letra por letra 
   String textoSubstraer = texto4.substring(0, indice);
   fill(255);
   textSize(32);
   textAlign(LEFT,TOP);
   text(textoSubstraer,20,130);
   
   //incrementa el indice para mostrar la siguiente letra 
   indice++;
   
   //comprobar si se a mostrado todo el texto
   if (indice > texto4.length()){
     textoPantalla1 = true;
    }   
 } else {
   //mostrar todo el texto 
   fill(255);
   textSize(32);
   textAlign(LEFT,TOP);
   text(texto4,20,130);
  }  
}

//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
else if (numPantalla == 4){
  //tercera imagen
  foto3 = loadImage("foto5.jpg");
  image(foto3,0,0,640,480);
   if (movimientoTexto5){
    x += velocidadtexto;
  
  if (x >= 20){
   movimientoTexto5 = false;
  }
 }
  fill(255);
  textAlign(0,height/2);
  textSize(32);
  text(texto5,x,height/2); 
}


//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  
 //contador para aumentar el nnumero de pantalla 
contadorTiempo ++;
if (contadorTiempo > 30*5){
    contadorTiempo =0;
    
    numPantalla ++;
    if (numPantalla > 4){
        numPantalla =0;
        
    if (!cicloTerminado){
      cicloTerminado = true;
        noLoop(); //detener el bucle draw
      }
    }   
  }
}


void mousePressed (){
  

  if (cicloTerminado){
    numPantalla = 0;
    cicloTerminado = false;
    loop(); //reactivar el bucle draw
  }
}
