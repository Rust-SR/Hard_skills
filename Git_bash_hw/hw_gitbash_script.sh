echo "Vvedite imya papki"
read dirname

if [ ! -d "$dirname" ]
then
    echo "File ne suwestvuet, sozdau..."
    mkdir ./$dirname
    echo "Sozdano"
else
    echo "File suwestvuet"
fi

echo "Perehodim v sodannuy papku"
cd $dirname

echo "Sozdaem 3 papki, vvedite imena..."
for ((i = 0; i < 3; i++))
do
	read dirname
	mkdir ./$dirname
done
echo "Papki sozdany"

cd $dirname
touch > text_1.txt text_2.txt text_3.txt json_1.json json_2.json
echo "Sozdano 5 failov"
mkdir p_1 p_2 p_3
echo "Sozdano 3 papki"
ls

mv text_1.txt ~/downloads/qa_1/moved_files
mv text_2.txt ~/downloads/qa_1/moved_files
echo "2 faila peremeweny"
