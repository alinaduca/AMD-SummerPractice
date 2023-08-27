# ☀️ AMD-SummerPractice 2023

Realizarea unui calculator binar în Verilog și SystemVerilog.

Puteți vizualiza aici [Prezentarea proiectului](https://github.com/alinaduca/AMD-SummerPractice/blob/main/Presentation.pdf) împreună cu secvențe de cod relevante și cu formele de undă corespunzătoare fiecărui modul.

## ▶️ Rularea modulelor

Puteți rula un modul și vizualiza formele de undă rulând următoarele comenzi:

```bash
  iverilog <nume-modul>_design.v <nume-modul>_testbench.v
  ./a.out
  gtkwave dump.vcd
```
Exemplu:

```bash
  iverilog SerialTransceiver.v SerialTransceiver_testbench.v
  ./a.out
  gtkwave dump.vcd
```
