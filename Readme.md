**Basic Introduction**
------------------

What is Liquibase ?
Open-Source database schema management and versioning tool !

Why do we need it ?
To maintain diff versions of db schema !

How Does It Work ?
The change that you need should be done in a file and this file should be made available to db.changelog-master file !


NOTE : I have kept master file as yaml and other changelog files as sql, although we can have other formats as well.

**====Explanation====**

We have a file named db.changelog-master.yml as the name suggests this is a master file.

Below are the contents of a simple master file.

<img width="706" height="95" alt="image" src="https://github.com/user-attachments/assets/822d9814-6545-40b9-a38e-5117d0bebdfa" />

What does above content means for liquibase engine ?

databaseChangeLog:
This is the root element of a Liquibase changelog master file.
It tells Liquibase that this file contains a list of changes or references to other files(changelog files) that have changes.

include:
Instead of writing all changes directly inside this file, Liquibase allows you to include other changelog files.
This is useful for organizing migrations into smaller files instead of having one giant changelog. 

file: db/changelog/dbChanges/changelog-JiraId.sql
This specifies the relative path to another changelog file.
Liquibase will load changelog-JiraId.sql and process the changesets inside it.
Path is relative to the root changelog (db.changelog-master.yml).

We can have multiple changelog files.
Note : JiraId would be unique for every file.

db/
 └── changelog/
     ├── db.changelog-master.yml
     └── dbChanges/
         ├── changelog-JiraId.yaml
         ├── changelog-JiraId.yaml


-------------------------
ChangeLog File Explained

1.Structure

--changeset bilal:1
CREATE TABLE users (
    id BIGINT PRIMARY KEY,
    username VARCHAR(100)
);

--changeset bilal:2
ALTER TABLE users ADD email VARCHAR(255);


--changeset bilal:1 ->This starts a new changeset.
bilal -> the author. Usually your name/initials/team ID.
1 -> the id of the changeset (must be unique per author).
Together (bilal:1) uniquely identifies this change.
CREATE TABLE users ...
Actual SQL that runs when this changeset is executed.
It will create a table named users.

--changeset bilal:2
Marks the start of another changeset, also written by bilal, but with id 2.
Even though both are in the same file, Liquibase treats them as separate tracked changes.
ALTER TABLE users ADD email VARCHAR(255);
Adds a new column email to the already-created users table.
