

#output_txtFile = open('/Users/freddiemarsh/Documents/ENGMATHS Y2/MDM2/Group REP 2/model/Output/simulation_output.txt','r')
output_txtFile = open('/Users/freddiemarsh/Documents/ENGMATHS Y2/MDM2/Group REP 2/model/Output/simulation_output_empty_room.txt','r')

output_txt = output_txtFile.readlines()
output_txtFile.close()



line_num = 0
ignore_list = [1,2,3,4,5,6]
string = []



for i in output_txt:
    line_num += 1
    if not line_num in ignore_list:
    
      
        if line_num % 6 == 1:
            string.append(i)
        elif line_num % 6 == 2:
            string.append(i)
        
no_of_people = len(string)/2

#print(no_of_people)


#for i in no_of_people:
    
    
index = 0

for (index, thing) in enumerate(string):
    if index < len(string):
        current = thing
       # next_ = string[index + 1]
        split_list = current.split(',')


        # print('test ' + current)
        
        # print(len(current))
        
        for i in split_list:
            print(i)
       # print(next_)

