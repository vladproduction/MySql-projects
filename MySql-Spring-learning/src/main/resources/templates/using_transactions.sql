/*Using transactions
When we issue a SQL command that changes our database in some way, it starts what is called a "transaction."
  A transaction is a sequence of operations treated as a single logical piece of work (like a bank transaction),
  and in the world of databases, a transaction must comply to the ACID principles to make sure the operations
  are processed reliably.*/
  /*ACID (atomicity, consistency, isolation, durability) is a set of properties of database transactions intended
    to guarantee data validity despite errors, power failures, and other mishaps.*/
/*Atomicity
  guarantees that each transaction is treated as a single "unit", which either succeeds completely or
  fails completely: if any of the statements constituting a transaction fails to complete, the entire
  transaction fails and the database is left unchanged.*/
/*Consistency
  ensures that a transaction can only bring the database from one consistent state to another, preserving
  database invariants: any data written to the database must be valid according to all defined rules,
  including constraints, cascades, triggers, and any combination thereof.*/
/*Isolation
  ensures that concurrent execution of transactions leaves the database in the same state that would have
  been obtained if the transactions were executed sequentially.*/
/*Durability
  guarantees that once a transaction has been committed, it will remain committed even in the
  case of a system failure (e.g., power outage or crash). This usually means that completed transactions
  (or their effects) are recorded in non-volatile memory.*/

/*Whenever we issue a command like CREATE, UPDATE, INSERT, or DELETE, we are automatically starting a
  transaction. However, if we want, we can also wrap up multiple commands inside a bigger transaction.
  It may be that we only want an UPDATE to go through if another UPDATE goes through as well, so we want to
  put both of them in the same transaction.*/

select * from test_table;

begin work;
update test_table
set deleted = true
where id = 4;
delete
from test_table
where id < 4;
commit;

select * from test_table;

/*We also use transactions when we want to make sure that all of our commands operate on the same view of the data - when we want
  to ensure that no other transactions operate on that same data while the sequence of commands is running. When you're looking at a
  sequence of commands you want to run, ask yourself what would happen if another user issued commands at the same time.
  Could your data end up in a weird state? In that case, you should run in a transaction.*/
