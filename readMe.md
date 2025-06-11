
## Authors

- [@NgoDuc25](https://github.com/NgoMinhDuc25)
- [@MyMainGithubProfile](https://github.com/NgoDuc2505)

## Compile and run script

Run testbench and verilog module file
```bash
iverilog -o [out_file_name] [verilog_module.v] [testbench.v]
```
Run result test and generate .vcd file
```bash
vvp [out_file_name]    
```
Run gtkwave
```bash
gtkwave [out_vcd_file]  
```

## Binary decoder 

![Schematic](img/2to4decoder.png)

## 4 to 2 priority encoder 

![Schematic](img/4x2Encoder.png)

## 8 to 3 priority encoder 

![Schematic](img/8to3encoder.png)

## 4 bit comparator from 2 bit comparator

![Schematic](img/4bit_comparator.png)