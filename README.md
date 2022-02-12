# Pewlett-Hackard_Analysis
## Overview of the Pewlett-HAckard employee database
This analysis is being done because of the upcoming "silver tsunami." This means that a lot of current employees are approaching retirement age. the company wants to analyze this and get ahead of it. They are looking into a potential mentorship to help pass the knowledge from the older employees to the newer employees. 

## Resources
Software: PostgreSQL, VSCode

## Results
- Based on the unique_titles table, which was create by combing employees and titles tables and filtering them by date of birth, date hired, are they active and removing duplicates. There are about 72,458 employees that are nearing retiring and part of the silver tsunami. 
- Of the 72,548 employees retiring, they are evenly spread across all the departments. With the percentage of a department included in the Silver Tsunami being between 29.59% and 30.68%  
![Chart](/Data/retiring_percentage.png)
- Out of all the employees retiring, there are 25,916 Sr. Engineers, 24,926 Senior Staff, 9,285 Engineers, 7,636 Staff, 3,603 Technique Leaders, 1,090 Asst Engineers and 2 Managers.  
![Chart](/Data/retiring_titles.PNG)
- There are 1549 employees that are eligible to join the mentorship program at PH. Of these 1,549 mentors there are 569 Senior Staff, 501 Engineers, 169 SR. Engineers, 155 Staff, 78 Asst. Engineers, and 77 Technique Leaders.  
![Chart](/Data/mentorship_titles.PNG)

## Summary 
### How many roles will need to be filled as the 'Silver Tsunami" begins to make an impact?
Overall as a company, they will be looking to replace about 30% (72,548 employees) of their workforce of the coming years. This is evenly spread across all of the departments with the least impacted department losing 29.59% and the most impacted losing 30.68%. 

### Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
If the mentors are assigned on a 1 to 1 basis, then there will be a shortage as there is only 1,549 eligible for the mentorship program. The biggest area lacking mentors is the Senior Engineer role. They are losing the most employees, 25,916, but only have 169 eligible to be mentors. This would be a 153:1 ratio and probably isn't possible to do.  