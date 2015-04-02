wget -q https://www.govtrack.us/data/congress-legislators/legislators-historic.csv -O data/legislators-historic.csv
wget -q https://www.govtrack.us/data/congress-legislators/legislators-current.csv -O data/legislators-current.csv

cat data/legislators-historic.csv
sed '1d' data/legislators-current.csv