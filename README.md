# COAL-THEORY-AND-LAB
ALL TASKS,QUIZZES,ASSIGNMENTS AND CONTENTS OF THIS COURSE WILL BE IN THIS REPO
# SETUP 
FOR VSCODE -> https://medium.com/@muhammadmeeran2003/how-to-set-up-assembly-language-on-visual-studio-code-2021-587a7b01c9a1
DOSBOX->
Step1: Download NASM Assembler
https://github.com/whiz-coder/NASM
Step2: Install Dosbox in ubuntu
Go to terminal and type: sudo apt install dosbox
Step3 :Then Extract ZIP File (NASM) which you downloaded from Github
Step4: Copy that NASM folder and paste in home directory
Step5: After that open Dosbox and mount that NASM folder in Dosbox
mount c /home/(username)/NASM
For example:
mount c /home/usman/NASM
type whoami in the terminal to find your PC’s username
Step6:
Go to C drive that you have already mounted
For that type
C:
This will take you to the C drive
Step7: For Compiling Assembly code you need to write assembly code and paste in that NASM folder
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