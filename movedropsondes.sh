
years="2010 2013 2014 2020 2021 2022 2023"

# directory to which copy the files
# change this to go to your SONDES directory 
deposit=/home/user/SenticEtAlGRLpaper/SONDES/


for year in $years
do

# modify the following path to match the location of the directory
# where you used getdrospondes.sh
cd /home/user/SenticEtAlGRLpaper/seb.noaa.gov/pub/acdata/${year}/AVAPS/
dirs=`ls -d 2*/`
for dir in $dirs
do
  echo ${dir:8:1}
  if [ "${dir:8:1}" = "N" ]; then
	echo ${dir}
       #ls -R1 $dir
       # finds all *.frd files and copies them into 
       find $dir -name \*.frd -exec cp {} $deposit \; 
  fi
done # dirs loop

done # years loop




