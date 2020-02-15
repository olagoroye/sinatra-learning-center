
3 MODELS

=> USER
attributes : name, :email, :password_digest(has_secure_password)

=>STUDENT
attributes :name, user_id(foreign key)


=>DAILY REPORT
attributes :dates , comments/notes, :dues dates, :user_id , student_id(foreign keys )


ASSOCIATION
* USER HAS_MANY STUDENT
* STUDENT BELONG TO USER(TEACHER)(PARENT: JUST UP FOR SIGNUP/SIGNIN)
* report BELONG_TO STUDENT AND USER 

create migrations




 You have a large number of small Git commits
 Your commit messages are meaningful
 You made the changes in a commit that relate to the commit message
 You don't include changes in a commit that aren't related to the commit message