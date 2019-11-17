CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;

-------------------------------------------------------------
-- PLEASE DO NOT CHANGE ANY SQL STATEMENTS ABOVE THIS LINE --
-------------------------------------------------------------

-- The size of each dog
CREATE TABLE size_of_dogs AS
select dogs.name, sizes.size
from dogs,
     sizes
where height <= max
  and height > min;

-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
select parents.child
from parents,
     dogs
where name = parent
order by height desc;

-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
select p1.child || ' and ' || p2.child || ' are ' || s1.size || ' siblings'
from parents as p1,
     parents as p2,
     size_of_dogs as s1,
     size_of_dogs as s2
where p1.parent = p2.parent
  and p1.child = s1.name
  and p2.child = s2.name
  and p1.child < p2.child
  and s1.size = s2.size;

-- Ways to stack 4 dogs to a height of at least 170, ordered by total height
CREATE TABLE stacks_helper(dogs, stack_height, last_height);

-- Add your INSERT INTOs here


CREATE TABLE stacks AS
select a.name || ', ' || b.name || ', ' || c.name || ', ' || d.name,
       a.height + b.height + c.height + d.height as total_height
from dogs as a,
     dogs as b,
     dogs as c,
     dogs as d
where a.height + b.height + c.height + d.height > 170
  and a.height < b.height
  and b.height < c.height
  and c.height < d.height
order by total_height;
