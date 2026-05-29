# 대표작 — Arduino · 드론 · BLE (2024-2)

ArduinoBLE 기반 드론 모터 무선제어 스케치와 회로·부품 자료를 모은 대표 묶음입니다.

## 대표 파일

| 파일 | 종류 | 내용 |
|------|------|------|
| `Arduino_대표스케치_2024-11-10.ino` | 소스코드 | BLE Peripheral로 모터 2채널(메인/방향타)을 비트 플래그 제어 |
| `BLE_Bypass_대표코드.ino` | 소스코드 | BLE 패스스루(bypass) 통신 테스트 스케치 |
| `드론 부품.xlsx` | BOM | 브러시리스 모터·ESC·MPU6050·Pixy2 등 부품 목록 |
| `Fritzing_DJI_30A_ESC.fzp` | 회로 부품 | Fritzing용 DJI 30A ESC 사용자 부품 |

## 핵심 포인트

- **BLE 무선제어**: 스마트폰(Central)이 1바이트 명령을 Write → 드론(Peripheral)이 비트별로 모터 구동.
- 메인 모터(bit0)와 방향타 모터(bit1)를 분리 제어하는 구조.
- 코드 + 부품 BOM + 회로 부품을 함께 제시해 **하드웨어 제작 기반 프로젝트**임을 입증.

> 코드 상세·조이스틱 드론 소스 분석은 상위 분야 문서 참고 → [05. 임베디드 제어 — Arduino · 드론 · BLE](../../README.md)
