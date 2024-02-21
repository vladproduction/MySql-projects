/*time to talk about the efficiency of your SQL queries - how quickly do they execute, and could they execute faster?
SQL is a declarative language - each query declares what we want the SQL engine to do, but it doesn't say how.  As it turns out,
  the how -- the "plan" -- is what affects the efficiency of the queries, however, so it's pretty important.*/

  select * from books_with_words where author like '%owlin%';

/*2 different ways that SQL could find the results:
Do a "full table scan": look at every single row in the table, return the matching rows.
Create an "index": Make a copy of the table sorted by author, then do a binary search to find the row where the author is "J K Rowling",
  find the matching IDs, then do a binary search on the original table that returns the rows that match the ID.

  If the table was 10 million rows long, then that full table scan would require looking at 10 million rows. It would be faster to
  do a binary search on a sorted table - we only need 23 lookups to find a value in 10 million rows. However, creating the sorted
  table would take a while (~230 million operations, depending on our engine). If we were executing that query many times
  (more than 23 times) or if we already had that table created, then that second plan would be better.*/

  /*The lifecycle of a SQL query
We can think of the SQL engine going through these steps for each query we give it:

    Parse---->Optimize----->Execute

    */

/*The query parser
  makes sure that the query is syntactically correct (e.g. commas out of place) and semantically correct (i.e. the tables exist),
  and returns errors if not. If it's correct, then it turns it into an algebraic expression and passes it to the next step.*/

/*The query planner and optimizer
  does the hard thinking work. It first performs straightforward optimizations (improvements that always result in better performance,
  like simplifying 5*10 into 50). It then considers different "query plans" which may have different optimizations, estimates the cost
  (CPU and time) of each query plan based on the number of rows in the relevant tables, then it picks the optimal plan and passes it
  on to the next step.*/

/*The query executor
  takes the plan and turns it into operations for the database, returning the results back to us if there are any.*/

/*Many times, especially for complex queries, there are indeed ways you can help optimize a query, and that's known as "query tuning".*/