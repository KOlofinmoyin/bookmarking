# Bookmark Challenge - once again!
[![Build Status](https://travis-ci.com/KOlofinmoyin/bookmarking.svg?branch=master)](https://travis-ci.com/KOlofinmoyin/bookmarking)

### The project
The bookmark manager is a website to maintain a collection of bookmarks (URLs).

+ It can be used to save the urls of useful webpages.
+ It can be used to add tags to saved webpages, in order to find them later.
+ it can be used to browse bookmarks other users have added.
+ it can be used to comment on bookmarks.

### Core competences learnt:
+ Agile and TDD
+ Engineering and 'Dev Recipes'
+ Databases
+ Tooling

### Domain model:
<img width="566" alt="Screenshot 2020-04-06 at 14 34 41" src="https://user-images.githubusercontent.com/33905131/78564088-dadf4b00-7813-11ea-964b-9745438ea8fd.png">

### To set up the database

1. Connect to `psql` and create the `bookmark_manager` database using: CREATE DATABASE `bookmark_manager;`

2. To set up the appropriate tables, connect to the database in `psql` using `\c bookmarking_manager` and

3. Run the SQL scripts in the `db/migrations` folder in the given order.

4. Insert into database using: `INSERT into bookmarkings(url) VALUES('http://www.makersacademy.com')`

5. Delete from  database using: `DELETE from  bookmarkings(url) WHERE url = 'http://www.makersacademy.com'`

6. Update from  database using (example): `UPDATE  bookmarkings(url) SET url = 'http://www.destroyallsoftware.com' WHERE url= 'http://www.twitter.com'`

### To run app:
- `rackup -p 3000`

### To view bookmarks, navigate to `localhost:3000/bookmarks`

### To run tests:	### To run tests:
- `rspec`

### User Stories:
```
As a time-pressed user
So that I can quickly go to web sites I regularly visit
I would like to see a list of bookmarks

```

### Test cases:
```
Lorem ipsum dolor sit amet, consectetur adipisicing elit.
```
