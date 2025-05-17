
// IMAGEN
PImage imagen1,imagen2,imagen3,imagen4;

//historia 

String pantalla;

String txt1 = "EVANGELION";

String txt2 = "Año 2000. Un experimento con una entidad llamada Adán causa el Segundo Impacto\n, una catástrofe global que mata a millones.Años después,\n seres conocidos como Ángeles comienzan a atacar la Tierra.\n La organización NERV construye mechas gigantes llamados EVAs para defender a la humanidad \n Shinji Ikari, hijo del líder de NERV, es obligado a pilotar el EVA-01.\n Se une a otros pilotos como Rei y Asuka.\n Mientras combaten a los Ángeles, enfrentan traumas profundos y dudas existenciales.\n Los EVAs resultan estar conectados a las almas de sus madres ";

String txt3 =  " El Tercer Impacto comienza.\n Shinji debe decidir entre una existencia sin dolor pero sin individualidad,\n o aceptar la soledad y seguir siendo humano.\n Elige vivir con sufrimiento y esperanza. \n El mundo termina...\n pero también puede volver a empezar.";

String txt4 = " FIN.";

 
// Tamaño Inicial
int maX = 12;
int miN = 1; 

int tamFont;
int tiempo;        //variable que cuenta el tiempo transcurrido
int velX, velY;           // velocidad
float posX, posY, botT;   // posicion y tamaño
color relleno; 
PFont fuente;

void setup() {
  size(640, 480);
  textSize(20);
  textAlign(CENTER,CENTER);
  noStroke();

  
  //PHOTO
  imagen1= loadImage("EVANGELION 04.jpg");
  
  imagen2= loadImage("EVANGELION 02.jpg");
  
  imagen3= loadImage("pelea.jpeg");
  
  imagen4= loadImage("EVA 10.png");
  
  //VARIABLES
  
  
  pantalla = "menu";    //Pantalla arranca en "menu", tiempo en 0
  tiempo = 0;
  
  posX =width/2 ;
  posY = height/4*3; 
  botT = 100;
  
  velX = 10;
  velY += 1;
  tamFont = 0;
  
  // color
  relleno = color(0);
  
  frameRate(40);
}

void draw() {
  
  background(relleno);     //Pintar fondo de color
  
  

//Pantalla está en "menu"


  if (pantalla ==("menu")) {
    //velY += 1;
    relleno = color(0);    //cambiar color del fondo
    image(imagen1, 0, 0, width, height);
    
    //push(); y pop(); para que solo afecte adentro
    push();
    //fill(0,0,255);
    textSize(tamFont);
    text(txt1, width/2, height/2);
    tamFont++;
    pop();
    
    tiempo++;
    if(tiempo >= frameRate*5){     
      pantalla = "p2";       //pasar a pantalla 1
      //velY = 0;
      tiempo = 0;      //y reiniciar tiempo
      
    }
    
    if(dist(mouseX,mouseY,posX,posY) < botT/2){      //si pongo el mouse en el botón (mouseOver), pintar de rojo
      fill(255,0,0);
      
    }else{
      fill(255);        //si no pongo el mouse en el botón, pintar de blanco 
     
    }
    ellipse(posX,posY, botT,botT);      //dibujar botón para siguiente pantalla
    
    fill(255);    //para que el color del botón no afecte al texto
    //fill(0);    
    text("Iniciar", posX,posY);
    
    
//PANTALLA "p2"
  } else if (pantalla == ("p2")) {
     velY += 1;
    relleno = color(50);    //cambiar color del fondo
    image(imagen2, 0, 0, width, height);
  
    push();
    //textSize(tamFont);
    textSize(16);
    text(txt2, width/2,height-velY);
    //tamFont++;
    pop();
    
    
    tiempo++;
    if(tiempo >= frameRate*10){        
      pantalla = "p3";                //...pasar a pantalla 2
      tiempo = 0;      //y reiniciar tiempo
      tamFont = 0;
    }


//PANTALLA "p3"
  } if (pantalla == ("p3")) {
    relleno = color(300);    //cambiar color del fondo
    image(imagen3, 0, 0, width, height);
    
    velY -= 1;
    push();
    textSize(17);
    text(txt3, width/2, height/2-velY);
    pop();
    tiempo++;
    if(tiempo >= frameRate*12){        
      pantalla = "p4";                //...pasar a pantalla 2
      tiempo = 0;                      //y reiniciar tiempo
    }
    
    
//PANTALLA "p4"
  } else if (pantalla == ("p4")) {
    relleno = color(200);    //cambiar color del fondo
    image(imagen4, 0, 0, width, height);
   
    push();
    textSize(maX);
    text(txt4, width/2, height/2);
    pop();
    maX += miN;
   
    if(maX > 60 || maX < 12){
      miN = -miN;
    }
    
    if(dist(mouseX,mouseY,posX,posY) < botT/2){    
      fill(255,0,0);
    }else{
      fill(255);       
  }
    ellipse(posX,posY, botT,botT);    
    
    fill(255);    
    text("Reiniciar", posX,posY);

  }
  
  println(frameRate);
}

//se ejecuta cuando se presiona el mouse.
void mousePressed(){                              
  if(pantalla ==("menu")){                        
    if(dist(mouseX,mouseY,posX,posY) < botT/2){          
      pantalla = "p2";                                 
      velY = 0;
      tiempo = 0;                                       
  }
  }
  // pantalla 4 + boton de reinicio.
  if(pantalla ==("p4")){                        
    if(dist(mouseX,mouseY,posX,posY) < botT/2){          // pongo el mouse en el botón
      pantalla = "menu";                                  
      tiempo = 0;                                        
    }
  }
}
//FIN 
