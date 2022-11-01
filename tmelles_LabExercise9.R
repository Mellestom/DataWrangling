rm(list=ls())

# Exercise 1
student <- read.csv('student.csv')
department <- read.csv('department.csv')

student_department <- merge(student,department,by.x = 'Department',by.y = 'DepartmentID')
student_department1 <- merge(student,department,by.x = 'Department',by.y = 'DepartmentID',all.x = T)
student_department2 <- merge(student,department,by.x = 'Department',by.y = 'DepartmentID',all.y = T)
student_department3 <- merge(student,department,by.x = 'Department',by.y = 'DepartmentID',all = T)

# Exercise 2
fall <- read.csv('grade_fall.csv')
spring <- read.csv('grade_spring.csv')

names(fall)[names(fall) == 'Percentage'] <-'Grade'

fall$Semester <-'Fall'

grade <- rbind(fall, spring)

# Exercise 3
faculty <- read.csv('faculty.csv')
course <- read.csv('course.csv')

teaching_faculty <- merge(faculty, course, by = 'FacultyID')


# Exercise 4
faculty2 <- read.csv('faculty.csv')

facutly_mentor <- merge(faculty2,faculty2,by.x = 'FacultyID',by = 'Mentor',all.x = T)

# Exercise 5
course2 <- read.csv('course.csv')
fall2 <- read.csv('grade_fall.csv')

course2$CourseID <- toupper(course$CourseID)

setdiff(course2$CourseID, fall2$CourseID)
setdiff(fall2$CourseID, course2$CourseID)

fall_course <- merge(fall2, course2,by = 'CourseID',all.x = T)