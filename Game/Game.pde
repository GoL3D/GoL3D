int bok = 20;
boolean [][][] widok = new boolean [bok][bok][bok];
boolean [][][] brudnopis = new boolean [bok][bok][bok];


void setup () {
size(800,800,P3D);
randomizeBox();
frameRate(10);
}

/* teraz pętla draw, która będzie będzie ogarniała jak ma przerysować 
brudnopis na widok po zmianie życia w każdym boxie dzięki wynikowi z 
update(); */

void draw () {
  update();
  background(32,32,32);
  stroke(255);
 for (int a = 0; a < bok; a++) {
 for (int b = 0; b < bok; b++) {
 for (int c = 0; c < bok; c++) {
   if(brudnopis[a][b][c]) fill(200,30,150); else fill(80); 
 pushMatrix();
 translate(400,400,-400);
 rotateX(0.1*mouseX);
 rotateY(0.1*mouseY);
 rotateZ(0.1);
 box(width/bok*a,width/bok*b,width/bok*c);
 popMatrix();
 }}}
  
}

//teraz część od randomowego kolorowania boxów

void randomizeBox() {
 for (int a = 0; a < bok; a++) {
  for (int b = 0; b < bok; b++) {
   for (int c = 0; c < bok; c++) {
    widok[a][b][c] = randomBoolean();
    
   }}}}
    
boolean randomBoolean() {
  float r = random(1000);
  if(r>500) return true; return false; }

 
/* badam czy przeżyje sprawdzając ile sąsiadów żyje 
i czy wystarczająco dużo */
   
int ileZywych(int a, int b, int c) {  
  int wynik = 0;
    if (jestZywa(a,b,c)) wynik += 1;
    if (jestZywa(a,b,c-1)) wynik += 1;
    if (jestZywa(a,b,c+1)) wynik += 1;
    if (jestZywa(a,b-1,c)) wynik += 1;
    if (jestZywa(a,b-1,c-1)) wynik += 1;
    if (jestZywa(a,b-1,c+1)) wynik += 1;
    if (jestZywa(a,b+1,c)) wynik += 1;
    if (jestZywa(a,b+1,c-1)) wynik += 1;
    if (jestZywa(a,b+1,c+1)) wynik += 1;
    if (jestZywa(a-1,b,c)) wynik += 1;
    if (jestZywa(a-1,b,c-1)) wynik += 1;
    if (jestZywa(a-1,b,c+1)) wynik += 1;
    if (jestZywa(a-1,b-1,c)) wynik += 1;
    if (jestZywa(a-1,b-1,c-1)) wynik += 1;
    if (jestZywa(a-1,b-1,c+1)) wynik += 1;
    if (jestZywa(a-1,b+1,c)) wynik += 1;
    if (jestZywa(a-1,b+1,c-1)) wynik += 1;
    if (jestZywa(a-1,b+1,c+1)) wynik += 1;
    if (jestZywa(a+1,b,c)) wynik += 1;
    if (jestZywa(a+1,b,c-1)) wynik += 1;
    if (jestZywa(a+1,b,c+1)) wynik += 1;
    if (jestZywa(a+1,b-1,c)) wynik += 1;
    if (jestZywa(a+1,b-1,c-1)) wynik += 1;
    if (jestZywa(a+1,b-1,c+1)) wynik += 1;
    if (jestZywa(a+1,b+1,c)) wynik += 1;
    if (jestZywa(a+1,b+1,c-1)) wynik += 1;
    if (jestZywa(a+1,b+1,c+1)) wynik += 1;
    return wynik;
}

boolean jestZywa(int a, int b, int c) {
  if(a<0 || a >= bok || b < 0 || b >= bok || c > 700) return false;
  return brudnopis[a][b][c];
}


boolean czyPrzezyje(int a, int b, int c) {
  int i = ileZywych(a,b,c);
  if(i > 5 && i < 15) { 
     return true;  
  } else {
    return false;
  }
}
  
  
 void update() {
    for (int a = 0; a < bok; a++) {
         for (int b = 0; b < bok; b++) {
             for (int c = 0; c < bok; c++) {
                 brudnopis[a][b][b] = czyPrzezyje(a,b,c);
             }
        }
    }
    arrayCopy(brudnopis, widok);
}

  
   
   
   

