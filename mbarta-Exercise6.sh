# FIRST QUESTION

cat wages.csv | grep -v "gender" | cut -d , -f 1,2 | sed 's/,/ /g'| sort -V | uniq  >> GenderUniqueExpYears.txt

# SECOND QUESTION

echo "Highest Earner"
cat $1 | grep -E "(female|male)" | sort -t "," -k4,4nr | head -n 1 | cut -d , -f 1,2,4


echo "Lowest Earner"
cat "$1" | grep -v "gender" | cut -d , -f 1,2,4 | sed 's/,/ /g' | sort -Vk 3 | head -n 1

echo "Number of Females in top 10 earners"
cat $1 | sort -t "," -k4,4nr | head -n 10 | grep -E "female" | wc -l

# THIRD QUESTION

val1=$(cat "$1" | grep -v "gender" | cut -d , -f 3,4 | sort -n | sed 's/,/ /g' | grep "12 " | head -n 1 | cut -d " " -f 2)
val2=$(cat "$1" | grep -v "gender" | cut -d , -f 3,4 | sort -n | sed 's/,/ /g' | grep "16 " | head -n 1 | cut -d " " -f 2)

diff="$val2-$val1"

echo "The difference between 12 vs. 16 years of education on minimum wage is:" 
echo "$val2 $val1" | awk '{print $1-$2}'
