

dirs=`ls -d 2*/`
for dir in $dirs
do
	echo Workin on dir: $dir
  cd $dir
  ./main.sh
  cd ..
done

