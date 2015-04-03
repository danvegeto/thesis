set -v

./collect_candidates.sh
./collect_donations.sh
./collect_votes.sh

cp data/* ../data/