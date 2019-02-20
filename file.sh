#!/bin/sh
# Aoo Create File & Insert Script # Version 1.0.0.5
# Script Developed by Apivat Pattana-Anurak
# SysAdmin & Programmer Form #Bangkok #Thailand 

echo "What is File Name?"
read FILE_NAME
echo "Create File $FILE_NAME Success."
echo "I will create your a file called ${FILE_NAME}"
touch "${FILE_NAME}"


echo "What is File Script?"
read Script
echo "Insert $Script to File $FILE_NAME"
echo "I will Insert your Script in [$Script]"
echo '#!/bin/sh' > ${FILE_NAME}
echo "$Script" >> ${FILE_NAME}



INPUT_STRING=$Script
while [ "$INPUT_STRING" != "exit" ]
do
  echo "I will Insert your Script in [$INPUT_STRING] (exit to quit)"
  read INPUT_STRING
  echo "$INPUT_STRING" >> ${FILE_NAME}
done

chmod 755 ${FILE_NAME}




