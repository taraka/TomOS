filename=$1


fileasm=${filename}.asm
filebin=${filename}.bin
filevdi=£{filename}.vdi



# cleanup old file
rm -f $filebin $filevdi


#built
nasm -f bin -o $filebin 
cat /dev/zero | head -c 1048576 >> $filebin
VBoxManage convertdd $filebin $filevdi
rm -f $filebin
