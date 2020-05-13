CIT117-Comp-Org-MIPS  
Computer Organization and Assembly Language - MIPS Assignments

Assignment Prompt:  
Write a program to prompt, read and print a floating point number. What is strange about the registers used for this program?   

The strange thing about the registers for this program from $f0-$f31 is that the even registers ($f0, $f2, $f4, …, $f30)  
can hold a double value while the odd can only hold a float. This is because the size of the registers are only 32 bit,  
and a double requires 64 bits of data. Therefore, when a double is used, half of the value is stored within the odd register.
