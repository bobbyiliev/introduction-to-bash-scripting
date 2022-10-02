# CSV To VCF

The script given below basically used to convert CSV file into VCF format. <br>
The csv file must be in the format of name,ID,Mobile no. and Age of that person. <br>
It read the file and generate temp.vcf file which contain the details in VCF format. <br>

```bash
#!/bin/bash

input_file=$1
temp="$(basename "$1" | sed 's/\(.*\)\..*/\1/')"
if [ ! -f $input_file ]
then
    echo "The input csv file does not exists!!!"
    exit
fi

count=1
output_file="$temp.vcf"
touch $output_file
while IFS="," read  col1 col2 col3 col4
do
    if [ $count -eq 1 ]
    then
        count=$((count+1))
        continue
    fi
    echo "BEGIN:VCARD" >> $output_file
    echo "VERSION:1" >> $output_file
    echo -e "\nName    : $col1" >> $output_file
    echo "ID     : $col2" >> $output_file
    echo "Mobile  : $col3" >> $output_file
    echo -e "Age     : $col4 \n" >> $output_file
    echo "END:VCARD" >> $output_file

    count=$((count+1))
done < $input_file
```

<br>

Just copyt the code in .sh file then run the file followed by the .csv file name: <br>
for eg.
```bash
csvtovcf.sh info.csv
```
