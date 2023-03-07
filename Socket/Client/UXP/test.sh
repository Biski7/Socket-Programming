#Make necessary imports and run id_from_xml to create iic, then run uxp_from_id to create uxp
# Need xml file beforehand to run this
export UXP='/home/bishal/Sertainty/developer/'
export LD_LIBRARY_PATH=$"/home/bishal/Sertainty/developer/bin"
gcc -g -c id_from_xml.c -I$UXP/includes -I$UXP/includes/C
gcc -g id_from_xml.o  -L$UXP/bin -o ./id_from_xml -lSertaintyCore -lSertaintyServices 
./id_from_xml
gcc -g -c uxp_from_id.c -I$UXP/includes -I$UXP/includes/C
gcc -g uxp_from_id.o  -L$UXP/bin -o ./uxp_from_id -lSertaintyCore -lSertaintyServices 
./uxp_from_id
