
dirs=`ls -d 2*/`

for dir in $dirs
do
  echo ${dir::-1}
  cd $dir
  yer=${dir:0:4}
  echo $yer
  if [ $yer -lt 2019 ]; then
          echo Using PREDICT script
          avapsmakePREDICT.sh
  else
          echo Using ONR3 script
          avapsmakeONR3.sh
  fi
  if [ -f convert.sh ]; then
        ./convert.sh
  fi
  avapslonlat.sh
  cp dropsonde_*.png ..
  cd ..
done


# Some special fixes:

cd 2014_cristobal1
avapsconvertEOL3.sh D20140827_012751_P.QC.eol 11 0 1
avapslonlat.sh
cp dropsonde_map_*.png ..
cd ..

cd 2010_karl5b
cat Z20100913_205122.cdf | cdfmath "-78.688202 lon.m =" | cdfmath "14.255447 lat.m =" >tmp
mv tmp Z20100913_205122.cdf
avapslonlat.sh
cp dropsonde_map_*.png ..
cd ..

cd 2010_karl6
# from file: vim D20100914_164821_P.QC.eol
# useld lon,lat: -81.881300   18.599300
# to fix the lon.m and lat.m in the Z.cdf file
# Similar for other files below
cat Z20100914_164821.cdf | cdfmath "-81.881300 lon.m =" | cdfmath "18.599300 lat.m =" > tmp
 mv tmp Z20100914_164821.cdf
avapslonlat.sh
cp dropsonde_map_*.png ..
cd ..

cd 2010_matthew2a
cat Z20100921_215958.cdf | cdfmath "-62.089920 lon.m =" | cdfmath "13.212948 lat.m =" >tmp
mv tmp Z20100921_215958.cdf
avapslonlat.sh
cp dropsonde_map_*.png ..
cd ..

cd 2010_matthew3a
cat Z20100922_180948.cdf | cdfmath "-69.657784 lon.m =" | cdfmath "14.741936 lat.m =" > tmp
mv tmp Z20100922_180948.cdf
cat Z20100922_175740.cdf | cdfmath "-69.507923 lon.m =" | cdfmath "15.854645 lat.m =" > tmp
mv tmp Z20100922_175740.cdf
avapslonlat.sh
cp dropsonde_map_*.png ..
cd ..

cd 2010_nicole2
cat Z20100928_155055.cdf | cdfmath "-83.395500 lon.m =" | cdfmath "18.833900 lat.m =" > tmp
mv tmp Z20100928_155055.cdf
cat Z20100928_170441.cdf | cdfmath "-85.084400 lon.m =" | cdfmath "17.600500 lat.m =" > tmp
mv tmp Z20100928_170441.cdf
avapslonlat.sh
cp dropsonde_map_*.png ..
cd ..

cd 2023_lee08
cat Z20230914_105702.cdf | cdfmath "-71.213 lon.m =" | cdfmath "29.602 lat.m =" > tmp
mv tmp Z20230914_105702.cdf
avapslonlat.sh
cp dropsonde_map_*.png ..
cd ..

