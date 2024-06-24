

dirs=`ls -d -1 2*/`
echo $dirs

rm getParameters.asc
for dir in $dirs
do
  cd $dir
  name0=${dir::-1}
  name=${name0:5:20}

  fileOut=${dir::-1}


  refyear=`cat main.sh | egrep "avapsgetstormspeed.sh" | cut -d" " -f 3`
  refmon=`cat main.sh | egrep "avapsgetstormspeed.sh" | cut -d" " -f 4`
  refday=`cat main.sh | egrep "avapsgetstormspeed.sh" | cut -d" " -f 5`
  refhr=`cat main.sh | egrep "avapsgetstormspeed.sh" | cut -d" " -f 6`
  refmin=`cat main.sh | egrep "avapsgetstormspeed.sh" | cut -d" " -f 7`
  
  ref_u=`cat main.sh | egrep "avapslonlatStorm.sh" | cut -d" " -f 2`
  ref_v=`cat main.sh | egrep "avapslonlatStorm.sh" | cut -d" " -f 3`
  ref_t_ks=`cat main.sh | egrep "avapslonlatStorm.sh" | cut -d" " -f 4`

  lon0=`cat main.sh | egrep "avaps3dvarONR" | cut -d" " -f 6`
  dlon=`cat main.sh | egrep "avaps3dvarONR" | cut -d" " -f 7`
  nlon=`cat main.sh | egrep "avaps3dvarONR" | cut -d" " -f 8`
  lat0=`cat main.sh | egrep "avaps3dvarONR" | cut -d" " -f 9`
  dlat=`cat main.sh | egrep "avaps3dvarONR" | cut -d" " -f 10`
  nlat=`cat main.sh | egrep "avaps3dvarONR" | cut -d" " -f 11`

  lon1=`echo "$lon0 + $dlon * $nlon" | bc -l`
  lat1=`echo "$lat0 + $dlat * $nlat" | bc -l`
 
  echo $name $refyear $refmon $refday $refhr $refmin $ref_u $ref_v $ref_t_ks $lon0 $lon1 $lat0 $lat1
  
  echo $name $refyear $refmon $refday $refhr $refmin $ref_u $ref_v $ref_t_ks $lon0 $lon1 $lat0 $lat1 >> ../getParameters.asc


  uniget ../${name0}.nc > tempFile.cdf
  cat tempFile.cdf |\
        cdfentropy -q pres temp mr ent satmr |\
        cdfrdim z 0 1 | \
        cdfmath "ent entbl =" | \
        cdfmath "pres pres1 =" | \
        cdfextr -rs z |\
        cdfextr pres1 entbl > temp3
    cdfmerge tempFile.cdf '' temp3 '' | \
        cdfextr -r cape |\
            cdfderiv dtempdz temp z | \
        cdfwindow z 0 16 |
        cdfentropy -d pres temp temp satent satmr |\
        cdfmath 'satent entbl - dtempdz * 0 > -1 * cape =' |\
	cdfdefint z |\
	cdfextr -s lon lat ztime |\
        uniput ../${name0}.cape.nc
    cat tempFile.cdf |\
	avapspv.sh |\
	cdfextr pv |\
        uniput ../${name0}.pv.nc

    listFiles=`ls Z*.cdf`

    rm ../FLIGHT_${refyear}_${name}.txt
    for fileZ in $listFiles
    do
      yZ=`echo $fileZ | cut -c 2-5`
      mZ=`echo $fileZ | cut -c 6-7`
      dZ=`echo $fileZ | cut -c 8-9`
      hZ=`echo $fileZ | cut -c 11-12`
      minZ=`echo $fileZ | cut -c 13-14`
      echo $yZ $mZ $dZ $hZ $minZ 00 >> ../FLIGHT_${yZ}_${name}.txt 
    done

  #echo here

  
#  cat merge.cdf |\
#	cdfrdim z 4 |\
#	qplot lon,lat,mflux,f/lon,lat,mflux,w,2,0:1:1,c/lon,lat,u,v,2,2,v/lon.m,lat.m,k,1,p/lon.m,lat.m,r.,7,p/"longitude (deg)",lx/"latitude (deg)",ly/$name,tl ../${fileOut}_mflux4km png
  cd .. 
  #echo here 2 
  uniget $name0.nc |\
	  avapsvtend2.sh  $ref_u $ref_v |\
	  uniput $name0.vort.nc
  uniget $name0.nc |\
          avapsngmsZ.sh |\
          uniput $name0.srcmr.nc
  uniget $name0.nc |\
          avapsngmsZ3d.sh |\
          uniput $name0.srcmr3D.nc


  
done

