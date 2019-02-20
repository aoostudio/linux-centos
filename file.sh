#!/bin/sh
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
