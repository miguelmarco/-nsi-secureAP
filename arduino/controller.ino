#include "Wire.h";
#include "FaBoLCD_PCF8574.h";
#include "Keypad.h";
#include "Key.h"
 
// initialize the library
FaBoLCD_PCF8574 lcd; //Con esto creamos nuestro objeto
 
const byte rows = 4; //four rows
const byte cols = 4; //three columns
char keys[rows][cols] = {
  {'1','4','7','*'},
  {'2','5','8','0'},
  {'3','6','9','#'},
  {'A','B','C','D'}
};
byte rowPins[rows] = {5, 4, 3, 2}; //connect to the row pinouts of the keypad
byte colPins[cols] = {9, 8, 7, 6}; //connect to the column pinouts of the keypad
Keypad keypad = Keypad( makeKeymap(keys), rowPins, colPins, rows, cols );
 
char tecla;

int unidad; // 0-> mins, 1-> hours, 2-> days, 3-> permanent
int pantalla; // 0 -> select unit; 1-> enter units
String nombres[]={"minutos ","horas","dias","permanente"};
String iniciales[] = {" m"," h"," d", " p"};
String valor;
int posicion;

void setup() {
// set up the LCD's number of columns and rows:
lcd.begin(16, 2); //Definimos nuestro objeto con las variables de nuestra pantalla.
// Print a message to the LCD.
//lcd.print("Este domingo"); //Mostramos un mensaje
//lcd.setCursor(0, 1); //Cambiamos la posición.
//lcd.print("OneWire, I2C y ++");
//Antes de escribir en una posición ocupada hay que borrarla.
valor = "";
unidad = 1;
pantalla = 0;
Serial.begin(9600);
}

void loop() {
    
    

    if (pantalla == 0) {
        lcd.clear();
        posicion = (16-nombres[unidad].length())/2;
        lcd.setCursor(posicion,0);
        lcd.print(nombres[unidad]);
        lcd.setCursor(0,1);
        lcd.print("<-*          #->");
        tecla = keypad.waitForKey();
        
        if (tecla == '*') {
            if (unidad > 0){
                unidad=unidad-1;
            }
        }
        else if (tecla == '#') {
            if (unidad < 3){
                unidad = unidad+1;
            }
        }
        
        else if (!(tecla == 'A' || tecla =='B' || tecla == 'C' || tecla =='D' )) {
            valor = String(tecla);
            pantalla = 1;
        }
    }
    
    
    else {
        lcd.clear();
        posicion = (14 - valor.length() - nombres[unidad].length())/2;
        lcd.setCursor(posicion,0);
        lcd.print(nombres[unidad]+": " + valor);
        lcd.setCursor(0,1);
        lcd.print("* Atras     # OK");
        tecla = keypad.waitForKey();
        
        if (tecla == '*'){
            valor = "";
            pantalla = 0;
        }
        else if (tecla == '#'){
            Serial.println(valor + iniciales[unidad]);
            valor = "";
            pantalla = 0;
        }
        else if (!(tecla == 'A' || tecla =='B' || tecla == 'C' || tecla =='D' )){
            valor = valor + String(tecla);
        }
        

    }
}
