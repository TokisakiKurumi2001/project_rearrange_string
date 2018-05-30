#import random library
import random
#random the array
def random_logout(arr):
    #get the length of the input array
    length = int(len(arr))
    #create a empty array to assign new elements which has been random chosen
    #from the base array(input array)
    copy = []
    #run the random function for several times equal the length of the array
    for i in range(0, length):
        #get new length beacause the array will be removed some elements
        length = int(len(arr))
        #choose randomly which element to be log out
        index = random.randint(0, length-1)
        #pass the chosen element to the copy array
        copy.append(arr[index])
        #remove element from the array because I don't want same element logged out again
        arr.remove(arr[index])

    #return the new set of array which has been randomly choose
    return copy

# convert to array to string
def arrayToString(array):
    # make an empty string
    string = ''
    # join all the array into the string
    string = string.join(array)
    # return the string
    return string

# the final function to operate in this file
def rearrange_string(string):
    #convert the string to the array
    arr_1 = list(string)
    #random order the array
    arr_2 = random_logout(arr_1)
    # convert array(has been ordered) back to string
    str_1 = arrayToString(arr_2)
    # return the final result
    return str_1

# since the string in the database has this format 'string\n'
# we need to remove the last character
def format_string(string):
    # convert string to array
    arr_1 = list(string)
    # remove the last character
    # first get the length
    length = len(arr_1)
    # remove the last one
    arr_1.remove(arr_1[length-1])
    # convert back to the string
    str_1 = arrayToString(arr_1)

    # return the formatted string
    return str_1

# open file
file = open("database.txt","r")
# read through the lines in the file
line = file.readlines()
# close the file
file.close()

#open the another file and ready to write
myfile = open("result.txt","w")
# loop through the array of lines
str_1 = ''
str_2 = ''
str_3 = ''
for i in range(0, int(len(line))):
    # format the stringt to subtract `\n` character
    str_1 = format_string(line[i])
    # rearrange the string randomly
    str_2 = rearrange_string(str_1)
    # add `\n` so endline
    str_3 = str_2 + "\n"
    # write to the new file
    myfile.write(str_3)

myfile.close()


