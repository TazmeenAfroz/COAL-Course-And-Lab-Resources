# COAL-THEORY-AND-LAB
This repository contains assignments, lab tasks, and resources for the COAL course.
# SETUP 
### FOR VSCODE -> 
https://medium.com/@muhammadmeeran2003/how-to-set-up-assembly-language-on-visual-studio-code-2021-587a7b01c9a1
#### DOSBOX->
<p>Step1: Download NASM Assembler
https://github.com/whiz-coder/NASM</p>
<p>Step2: Install Dosbox in ubuntu
Go to terminal and type: sudo apt install dosbox</p>
<p>Step3 :Then Extract ZIP File (NASM) which you downloaded from Github</p>
<p>Step4: Copy that NASM folder and paste in home directory</p>
<p>Step5: After that open Dosbox and mount that NASM folder in Dosbox
mount c /home/(username)/NASM
For example:
mount c /home/tazmeen/NASM
type whoami in the terminal to find your PC’s username</p>
<p>Step6:
Go to C drive that you have already mounted
For that type
C:
This will take you to the C drive</p>
<p>Step7: For Compiling Assembly code you need to write assembly code and paste in that NASM folder
which you pasted in home directory
To run your code, type:
nasm (filename.asm) -o (filename.com)
For example:
nasm c01-01.asm -o c01-01.com
then open it in Advance Debbuger by

afd c01-01.com

For list file (.lst):
nasm c01-01.asm -o c01-01.com -l c01-01.lst
And You are done !
</p>
