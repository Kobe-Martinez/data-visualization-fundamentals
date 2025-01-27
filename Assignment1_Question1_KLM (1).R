#21:219:220 Fundamentals of Data Visualization, Spring 2021
#Assignment 1 - Question 1
#Kobe Lee Martinez, RUID: 202006380

#1.1
#I created the variable called myfirstnumber and assigned it the value of 5 by using the leftward operator.
myfirstnumber <- 5
#Although it is not necessary for this particular situation, I used the function print() to display the output of myfirstnmber+1 because I want to become familiar with this function.
print(myfirstnumber + 1)

#1.2
#The name of my vector is myfirstvector which is a list of items that are the same type.
#I used the : operator to produce a sequence of numbers in a list and associated it to myfirstvector. This is one way to create a vector with numerical values.
myfirstvector <- 1:10
#The vector is not going to show any output until you call it again like I did here.
myfirstvector 
#I used the length() function to find out how many items are in my vector.
length(myfirstvector)
#I used the inside brackets[] to access the vector items and I indexed (or called) the 7th entry in the list.
myfirstvector[7]

#1.3
#The name of my vector is mysecondvector. Refer to 1.2 line 12 for information about vectors.
#For string vectors the objects need to be within "" otherwise an error message will appear. I used the c() function to combine the list of items and associated it to the vector.
mysecondvector <- c("Fox", "Panda", "Koala")
#Called the vector using the cat() function which outputs the objects as character vectors and prints out the list without "".
cat(mysecondvector)


#1.4
#The function data.frame() allows you to create a data frame. Data frames are data displayed in a table format.
#Data frames contain columns/rows which should all have the same type of data: numerical, logical, or string/character. 
MyFrame <- data.frame (
  hey = c(5, 6, 7),
  there = c("a", "b", "c"),
  fella = c("blue", "brown", "green")
)
# Prints the data frame.
MyFrame
#str() command displays the internal structure of the data frame above.
#Tells whether the value of a column is numeric or string/character. 
str(MyFrame)
#the function summary() summarizes the data from the data frame MyFrame.
summary(MyFrame)

#1.5
#The matrix() function allows you to create a matrix, which is a two dimensional data set with columns and rows.
#The function runif generates random deviates for the data set. nrow/ncol specifies how many rows/cols are in data set. 
M <- matrix(runif(25), nrow = 5, ncol = 5)
#prints matrix
M
#The [] allows you to index specific items within the data set. [row, col]
M[1,3]
M[4,2]
#If you just want a whole col, put a comma before the number in the bracket. 
M[,3]
