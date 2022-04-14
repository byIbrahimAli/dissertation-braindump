import csv
from ntpath import join

file = open('my_keywords.csv')

csvreader = csv.reader(file)

csv_header = []
csv_header = next(csvreader) # extracts header, next move is actual data

data = []
for row in csvreader:
    data.append(row)
# print(data)
file.close()

# target keyword, replace 'flutter' with keyword
# target colour, replace 'blue' with colour

result = 'usable_keywords.csv'
with open(result, 'w', newline='') as file2:
    for specific_column_in_data in data :
        print(specific_column_in_data[1], specific_column_in_data[0])
        csvwriter = csv.writer(file2)
        csvwriter.writerow(["'" + specific_column_in_data[0] + "': HighlightedWord( onTap: () => print('" + specific_column_in_data[0] + "'), textStyle: const TextStyle(color: Colors." + specific_column_in_data[1] + ", fontWeight: FontWeight.bold,),),"])

# Finally figured that shit out but don't know how to remove double quotes...

# Prints targeted column from data :D Sooo I get colour and keyword seperatly
# for specific_column_in_data in data :
#     print(specific_column_in_data[1], specific_column_in_data[0])