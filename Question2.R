#2.1

#Created a data frame using the data.frame() function and assigned it to RUTranscript
#The data frame concatenated the courses, grades, and credits into a 9X3 table
RUTranscript <- data.frame (
  Course = c("640:135", "198:101", "198:280", "640:237", "640:327", "198:102", "640:136", "198:251", "198:335"),
  Grade = c(87,93,83,68,75,76,88,93,77),
  Credits = c(4,3,3,3,3,3,4,3,3)
)

#prints the transcript
RUTranscript

#2.2

#I created a function called gpaCalculator that takes in grades and credits
#& it returns a GPA based on Rutgers University's grading criteria
#K stands for the grades earned and M is for the credits of the class
gpaCalculator <- function(K,M){
  
  #I created an empty vector called gradePoint to store the grade points in
  gradePoint <- NULL
  
  #I then converted the grade percentage from the provided
  #Grading Scheme and turned it into grade point values.
  #I then used the true/false vector to index the
  #empty vector gradePoint and associate them to the correct
  #grade point value 
  gradePoint[K>= 89.5] <- 4.0
  gradePoint[K>= 84.5 & K<= 89.49] <- 3.5
  gradePoint[K>= 79.5 & K<= 84.49] <- 3.0
  gradePoint[K>= 74.5 & K<= 79.49] <- 2.5
  gradePoint[K>= 69.5 & K<= 74.49] <- 2.0
  gradePoint[K>= 59.5 & K<= 69.49] <- 1.0
  gradePoint[K<= 59.49] <- 0
  
  #Calculates the GPA by taking the sum of the gradePoints * credits
  #then divides this by the sum of the credits
  GPA <- sum(gradePoint*M)/sum(M)
  return(GPA)
}

#I then took the grades and credits from my original data frame and
#assign them to new variables which I then passed through the
#function I created above
#I then assigned the determined value of this person's gpa, assigned it to GPA and called it 
RU_Grades <- c(87,93,83,68,75,76,88,93,77)
RU_credits <- c(4,3,3,3,3,3,4,3,3)
GPA <- gpaCalculator(RU_Grades,RU_credits)
GPA
