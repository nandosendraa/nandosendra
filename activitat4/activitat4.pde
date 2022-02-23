int TAM=10;
int [] aleatori=new int [TAM];
int [] ordenat=new int [TAM];
int posXale1 =65;
int posXale2 =55;
int posXale3 =75;
int indexAle=0;
int iOrd=0;
int jOrd=TAM;
int clauOrd=10;
int faseOrd=0;
int posCentre, posInici, posFinal, centre;
int clau=18;

void setup () {
  size(640, 480);
  posInici=0;
  posFinal=TAM-1;
  posCentre=(posInici+posFinal)/2;
  inicialitzarRandom();
  inicialitzarOrdenat();
  centre=ordenat[posCentre];
}

void draw () {
  clear();
  background(255);
  dibuixarContenidorAle();
  dibuixarContenidorOrd();
  emplenarRandom();
  triangleAleatori();
  emplenarOrdenat();
  comprovadorAle();
  pivot();
  marcadors();
  recercaBinaria();
    
  delay(1000);
}

void recercaBinaria(){
  if (centre==clau){
    faseOrd=1;
  }
  else if (centre>clau){
    posFinal=posCentre-1;
    posCentre=(posInici+posFinal)/2;
    centre=ordenat[posCentre];
  }
  else{
    posInici=posCentre+1;
    posCentre=(posInici+posFinal)/2;
    centre=ordenat[posCentre];
  }
}

void dibuixarContenidorAle () {
  for (int i=0; i<TAM; i++) {
    fill(255);
    strokeWeight(1);
    stroke(0);
    square(56*i+40, 100, 56);
  }
  fill(0);
  textSize(20);
  text("Contenidor Aleatori", 240, 50);
}

void dibuixarContenidorOrd () {
  for (int i=0; i<TAM; i++) {
    fill(255);
    strokeWeight(1);
    stroke(0);
    square(56*i+40, 325, 56);
  }
  fill(0);
  textSize(20);
  text("Contenidor Ordenat", 240, 275);
}

void inicialitzarRandom() {
  for (int i=0; i<TAM; i++)
    aleatori [i]=(int)random(1, 10);
}

void inicialitzarOrdenat() {
  for (int i=0; i<TAM; i++)
    ordenat[i]= i*2;
}

void emplenarRandom() {
  for (int i=0; i<TAM; i++)
    text(aleatori[i], 56*i+60, 130);
}

void emplenarOrdenat() {
  for (int i=0; i<TAM; i++)
    text(ordenat[i], 56*i+60, 355);
}

void comprovadorAle() {
  if (indexAle > 8) {
    fill(255, 0, 0);
    triangleAleatori();
    return;
  }
  if (sequencial(aleatori[indexAle], 5)==1) {
    fill(0, 255, 0);
    triangleAleatori();
  } else {
    posXale1+=56;
    posXale2+=56;
    posXale3+=56;
    indexAle++;
  }
}

void triangleAleatori () {
  triangle(posXale1, 160, posXale2, 180, posXale3, 180);
}

int sequencial (int  array, int clau) {
  if (array == clau )
    return 1;
  return -1;
}

void pivot() {
  switch (faseOrd){
    case (0):
      strokeWeight(4);
      stroke(0, 0, 255);
      fill(255, 255, 255, 100);
      square(56*((posInici+posFinal)/2)+40, 325, 56);
      fill(0, 0, 255);
      text("PIVOT", 56*((posInici+posFinal)/2)+45, 410);
      break;
   
    case (1):
      strokeWeight(4);
      stroke(0, 255, 0);
      fill(255, 255, 255, 100);
      square(56*((posInici+posFinal)/2)+40, 325, 56);
      fill(0,255,0);
      text("TROBAT", 56*((posInici+posFinal)/2)+45, 410);
      break;
  }
  
}

void marcadors(){
  switch (faseOrd){
    case (0):
      marcadorInici();
      marcadorFinal();
      break;
  }
}

void marcadorInici(){
  strokeWeight(4);
  stroke(255, 0, 0);
  fill(255, 255, 255, 100);
  square(56*(posInici)+40, 325, 56);
  fill(0, 0, 255);
  text("INICI", 56*(posInici)+45, 410);
}

void marcadorFinal(){
  strokeWeight(4);
  stroke(255, 0, 0);
  fill(255, 255, 255, 100);
  square(56*(posFinal)+40, 325, 56);
  fill(0, 0, 255);
  text("FINAL", 56*(posFinal)+45, 410);
}
