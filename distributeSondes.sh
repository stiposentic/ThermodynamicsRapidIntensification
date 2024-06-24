

cd LIST_OF_SONDES
filesL=`ls list_of_sondes_*.txt`
cd ..

for fileL in $filesL
do

        case0=${fileL:15:-4}
        echo List file: $fileL, case: $case0
        while read file; do
                #echo "$file"
                cp SONDES/$file $case0
        done < LIST_OF_SONDES/$fileL

done

