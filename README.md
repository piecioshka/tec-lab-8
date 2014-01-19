# tec-lab-8

* Wykład: http://tomaszewicz.zpt.tele.pw.edu.pl/node/257
  * plik: SDP2_KKrawczyk.pdf
  * Metody optymalizacji soft-procesorów NIOS - Kamil Krawczyk

Method | Speed
--- | ---
NIOS Software | 0.65
NIOS Custom instructions | 0.1
NIOS Custom Componenets | 0.01

Quartus II 
-> Qsys (SoPC)

Budowa:
- NIOS II (Procesor)
- OnChipMemory (Pamięć)
- JTag UART (Skonfigurować nasz procesor)
- SDRAM Controller

Łączymy...
* Procesor - Pamięć
* System przerwań
