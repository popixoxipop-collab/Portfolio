#include <ArduinoBLE.h> // 블루투스 라이브러리 선정

BLEService DroneService("19B10000-E8F2-537E-4F6C-D104768A1214"); // Bluetooth® Low Energy DroneService

BLEByteCharacteristic switchCharacteristic("19B10001-E8F2-537E-4F6C-D104768A1214", BLERead | BLEWrite);

const int M11 = 2; // Motor 1_1 pin
const int M12 = 3; // Motor 1_2 pin
const int M21 = 5; // Motor 2_1 pin
const int M22 = 6; // Motor 2_2 pin

int speed = 300;  //모터 스피드 설정

void setup() {
  Serial.begin(9600); // Prepare Bluetooth serial port
  while (!Serial);

  pinMode(M11, OUTPUT); // Set pin for motor 1
  pinMode(M12, OUTPUT); // Set pin for motor 2
  pinMode(M21, OUTPUT); // Set pin for motor 3
  pinMode(M22, OUTPUT); // Set pin for motor 4

  // 블루투스 초기화 과정 
  if (!BLE.begin()) {
    Serial.println("starting Bluetooth® Low Energy module failed!");
    while (1);
  }
  BLE.setLocalName("DRONE");
  BLE.setAdvertisedService(DroneService);
  DroneService.addCharacteristic(switchCharacteristic);
  BLE.addService(DroneService);
  switchCharacteristic.writeValue(0);
  BLE.advertise();
  Serial.println("BLE motor Peripheral");
}

void loop() {
  
  BLEDevice central = BLE.central();
  if (central) {
    Serial.print("Connected to central: ");
   
    Serial.println(central.address());

    
    while (central.connected()) {
     
      if (switchCharacteristic.written()) {
        uint8_t value = switchCharacteristic.value(); // Read the value

    
        if (value & 0x01) { // 메인 모터의 작동 
          Serial.println("Motor 1 ON");
          analogWrite(M11, speed);
          analogWrite(M12, 0);
          delay(1000); //1초정도 지연
        } else {
          Serial.println("Motor 1 OFF");
          analogWrite(M11, 0);
          analogWrite(M12, 0);
          delay(1000); //1초정도 지연
        }
        if (value & 0x02) { // 고도 상승 및 하강 방향타 모터 작동
          Serial.println("Motor 2 ON");
          analogWrite(M21, speed);
          analogWrite(M22, 0);
          delay(2000); //2초정도 지연
        } else {
          Serial.println("Motor 2 OFF");
          analogWrite(M21, 0);
          analogWrite(M22, 0);
          delay(2000); //2초정도 지연
        }

             }
    }

    // 시리얼 연결 끊길 시 표기
    Serial.print(F("Disconnected from central: "));
    Serial.println(central.address());
  }
}