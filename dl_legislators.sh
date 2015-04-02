wget https://www.govtrack.us/data/congress-legislators/legislators-historic.csv -O data/legislators-historic.csv
wget https://www.govtrack.us/data/congress-legislators/legislators-current.csv -O data/legislators-current.csv

cat data/legislators-historic.csv > data/legislators.csv
sed '1d' data/legislators-current.csv >> data/legislators.csv