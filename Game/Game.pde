
int dim = 10;
boolean [ ] [ ] [ ]cells = new boolean[dim][dim][dim]; 
boolean [ ] [ ] [ ]temp = new boolean[dim][dim][dim];

void setup() {
  size(700,700,P3D);
  randomizeCells();  }

void draw() {
  background(32,32,32);  
  stroke(255);
  for (int row = 0; row < dim; row++) { 
   for (int col = 0; col < dim; col++) {
      for (int dep = 0; dep < dim; dep++) {
     if (cells[col][row][dep]) fill(200,30,150); else fill(80); 
     pushMatrix();
     translate(20,20,20);
      rotateY(0.5*mouseY);
      rotateX(0.5*mouseX);
      rotateZ(0.5);
      box(width/dim*col, width/dim*row, width/dim*dep); 
    popMatrix();
  }}}} // może box jest źle opisany?

void randomizeCells() {
  for(int row=0; row<dim; row++) {
    for(int col=0; col<dim; col++) {
      for(int dep=0; dep<dim; dep++) { 
      cells[col][row][dep] = randomBoolean(); } } } } 

boolean randomBoolean() {
  float r = random(1000); 
  if(r>500) return true; return false; }

int liczbaSasiadow(int col, int row, int dep) {
  int wynik = 0;

  if(pobierzZawartosc(col-1,row,dep)) wynik +=1;
   if(pobierzZawartosc(col-1,row-1,dep)) wynik +=1;
    if(pobierzZawartosc(col-1,row-1,dep-1)) wynik +=1;
     if(pobierzZawartosc(col-1,row, dep-1)) wynik +=1;
      if(pobierzZawartosc(col,row-1,dep)) wynik +=1;
       if(pobierzZawartosc(col,row-1,dep-1)) wynik +=1;
        if(pobierzZawartosc(col,row,dep-1)) wynik +=1;
          if(pobierzZawartosc(col+1,row,dep)) wynik +=1;
            if(pobierzZawartosc(col+1,row+1,dep)) wynik +=1;
              if(pobierzZawartosc(col+1,row+1,dep+1)) wynik +=1;
                if(pobierzZawartosc(col+1,row,dep+1)) wynik +=1;
                  if(pobierzZawartosc(col,row+1,dep)) wynik +=1;
                   if(pobierzZawartosc(col,row+1,dep+1)) wynik +=1;  
                    if(pobierzZawartosc(col,row,dep+1)) wynik +=1;
                    if(pobierzZawartosc(col+1,row-1,dep)) wynik +=1;
                    if(pobierzZawartosc(col+1,row-1,dep-1)) wynik +=1;
                    if(pobierzZawartosc(col+1,row,dep-1)) wynik +=1;
                    if(pobierzZawartosc(col+1,row-1,dep+1)) wynik +=1;
                    if(pobierzZawartosc(col+1,row+1,dep-1)) wynik +=1;    
                    if(pobierzZawartosc(col-1,row+1,dep)) wynik +=1;
                    if(pobierzZawartosc(col-1,row+1,dep+1)) wynik +=1;
                    if(pobierzZawartosc(col-1,row,dep+1)) wynik +=1;
                    if(pobierzZawartosc(col-1,row-1,dep+1)) wynik +=1;
                    if(pobierzZawartosc(col-1,row+1,dep-1)) wynik +=1;
                    if(pobierzZawartosc(col,row-1,dep+1)) wynik +=1;         
                    if(pobierzZawartosc(col,row+1,dep-1)) wynik +=1;         
                  
  return wynik;
}

boolean pobierzZawartosc(int col, int row, int dep) { //dodałam int dep
 if(col < 0 || col >= dim || row < 0 || row >= dim || dep < 0 || dep >= dim) return false; 
return cells[row][col][dep]; 
}

  
//void updateCells() {
//int n = 0;
  //for (int row = 0; row < dim; row++) {
  //for (int col = 0; col < dim; col++) {
  //for (int dep = 0; dep < dim; dim++) {
    //n = liczbaSasiadow(col,row,dep);
      //if(n > 6 && n < 26) temp[col][row][dep] = true; else temp[col][row][dep] = false; } }  }
  //arrayCopy(temp, cells);}

//void keyReleased() {
  //if(key == ' ') randomizeCells(); }


