
years="2010 2013 2014 2020 2021 2022 2023"
years="2020"

for year in $years
do
	# get all frd dropsondes from year 2020, the following lines get only *.frd data
	wget -nc --recursive --no-parent -A frd --no-check-certificate https://seb.noaa.gov/pub/acdata/${year}/AVAPS/
	# Preliminary quality checked data, we do not use this one:
	#https://seb.noaa.gov/pub/flight/ASPEN_Data/$date/
done




