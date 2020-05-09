import java.util.List;
Circulo tmp;
List <Circulo>lista; // <> Operador Diamante
String IdSeleccionado_Etiqueta="";
float x,y;
int numeroElementos = 10; // numero de circulos en la lista
int seleccionadoIndice=-1;
void setup(){
    size(400,300);
    lista = new <Circulo>ArrayList();
    tmp = null;
    for(int i=0; i <numeroElementos ;i++){
       x = random(width);
       y = random(height);
       tmp = new Circulo(x,y,50,i);
       lista.add(tmp);
    }
}

void draw(){
   background(0);
   for(int i=0; i < lista.size() ;i++){
       tmp = lista.get(i);
       tmp.dibuja();
   }
   textSize(24);
   fill(#DB145D);
   text(IdSeleccionado_Etiqueta,40,50);
   fill(255);
}

void mousePressed(){
   for(int i=numeroElementos-1; i>=0 ;i--){
       tmp=lista.get(i);
          if (tmp.isAdentro(mouseX, mouseY) ) {
             seleccionadoIndice=i;
             IdSeleccionado_Etiqueta += tmp.id;
             tmp.mover=true;
             break;
          }
   }
}
void mouseDragged(){
  if(seleccionadoIndice!=-1){
    tmp=lista.get(seleccionadoIndice);
    tmp.x=mouseX;
    tmp.y=mouseY;
  }
}

void mouseReleased(){
   IdSeleccionado_Etiqueta = "";
   seleccionadoIndice=-1;
   tmp.mover = false;
   tmp = null;
}
