-- Here are some questions to answer
-- Keep the questions in the file, and just put the answers below the questions.

/*
  About the DATA
  There are 4 tables
  here is a list with descriptions

  IMPORTANT: YOU MAY CHANGE THE TABLE STRUCTURES IF YOU WOULD LIKE.
      THE LAST QUESTION WILL ASK ABOUT ALL YOUR CHANGES.

  - users
     - just a list of user data
  - emails
     - holds users emails.
     - There is a one to many relationship with the users table. Each user can have many emails
     - One email is marked as the primary email for the user
  - usage_log
     - holds the users session dates and times.
     - contains the login and logout times of every user session.
     - So every time a user logs in, it creates a new entry in this table
  - users_admin
     - only holds a user id
     - if a user's id is in this table, then they are an admin
*/

-- EXAMPLE
-- Write a statement that will return all the users
--  with the last name 'Johnson'
SELECT *
  FROM users
  WHERE lName = 'Johnson';


-- QUESTION 1
-- write a statement that returns all the users data
--   including their primary email, if they have one
--   and if they are an admin or not

select users.*, emails.email, usage_log.sessionId, usage_log.login, usage_log.logout, user_admin.userId as admin from users 
left join emails on (users.id = emails.userId and primaryEmail = 1) left join usage_log on (users.id = usage_log.userId)
left join user_admin on (users.id = user_admin.userId and user_admin.userId IS NOT NULL);

-- QUESTION 2
-- write a statement that returns all user data
--   including their primary email
--   and if they are an admin or not
--   but only users with emails

select users.*, emails.email, emails.primaryEmail, usage_log.sessionId, usage_log.login, usage_log.logout, user_admin.userId as admin from users 
left join emails on (users.id = emails.userId) left join usage_log on (users.id = usage_log.userId)
left join user_admin on (users.id = user_admin.userId and user_admin.userId IS NOT NULL) where emails.email is not null;

-- QUESTION 3
-- write a statement that returns all user data
--   that do not have an email
--   and are not admins
select users.*, usage_log.sessionId, usage_log.login, usage_log.logout from users 
left join emails on (users.id = emails.userId) left join usage_log on (users.id = usage_log.userId)
where emails.email IS NULL and NOT EXISTS (select user_admin.userId from user_admin where users.id = user_admin.userId);


-- QUESTION 4
-- write a statement that returns all the users data
--    only users with last name that contains a letter 'B'
--    and also return the number of emails those users have

select users.*, emails.email, count(emails.email) as numberOfEmails, emails.primaryEmail, usage_log.sessionId, usage_log.login, usage_log.logout
from users left join emails on (users.id = emails.userId) left join usage_log on (users.id = usage_log.userId)
where users.lName LIKE '%b%';

-- QUESTION 5
-- write a statement that returns all the users data
--    only users that have more than one email
--    and are admins

select users.*, emails.email, emails.primaryEmail, usage_log.sessionId, usage_log.login, usage_log.logout 
from users left join emails on (users.id = emails.userId) left join usage_log on (users.id = usage_log.userId) 
where EXISTS (select user_admin.userId from user_admin where users.id = user_admin.userId) group by users.id having count(emails.email) > 1;

-- QUESTION 6
-- write a statement that returns all user data
--   with the total amount of time the users have spent on the site
--   in the past 21 days, in minutes
select users.*, emails.email, emails.primaryEmail, usage_log.sessionId, usage_log.login, usage_log.logout, SUM(TIMESTAMPDIFF(MINUTE, usage_log.login, usage_log.logout)) as totalTime 
from users left join emails on (users.id = emails.userId) left join usage_log on (users.id = usage_log.userId) 
WHERE usage_log.login >= NOW() - INTERVAL 21 DAY AND usage_log.login  < NOW() + INTERVAL 21 DAY;

-- QUESTION 7
-- Write a statement that returns all user data
--   with the total amount of time spent on the site
--   and with the total number of logins
--   beginning of time

select users.*, emails.email, emails.primaryEmail, usage_log.sessionId, usage_log.login, usage_log.logout, 
SUM(TIMESTAMPDIFF(MINUTE, usage_log.login, usage_log.logout)) as totalTime, count(usage_log.login) as totalLogins
from users left join emails on (users.id = emails.userId) left join usage_log on (users.id = usage_log.userId) group by users.id;

-- QUESTION 8
-- given the table structure provided.
-- How would you did/would you change/improve our schema? Any Why?
-- Please list all changes that were made and a justification for the change.

The assignment for the app was:
Create a functioning login page, and logout feature.
Using the Assessment data provided, allow the user to take an assessment. They should be allowed to take the assessment as many times as they want.
Store the results of only the last assessment taken. (No need to keep the results of every time taking it)
Display the results for the user.

1. So, I changed user_admin to scores table with the same schema (added userId to access scores with ease)but just to keep up with the users scores because there is nothing to admin.
2. I added email column to users table because I see no reason for multiple emails just to take an assemssment; Not using emails table. Also added a password column for logins.
3. I changed age column in users table from BIGINT to INT as that's all that's needed.
4. I added created_at and updated_at columns to all tables because I used Eloquent query builder 
5. I loaded assessment data to assessment table

