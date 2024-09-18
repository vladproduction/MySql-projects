transaction - this is a set of commands that are executed all together and if at least one of them is not executed, then all the others are not executed;

Rules of ACID:

 - A - atomicity
a set of commands is perceived as a single whole (for example, transferring money from one card to another 
implies two operations - withdrawal from one and crediting to another);
Guarantees that no transaction will be recorded in the system partially. 
Either all of its sub-operations will be executed, or none of them will be executed.

 - C - consistency
after the transaction completes, either all commands must be executed or the system
must be in the state it was in before the operation began; committed->OK;
rollback->smth went not OK , rejected;
A transaction that reaches its normal completion and thereby commits its results
maintains database consistency;

 - I - isolation
100 or 1000(-n) users can work with the database at the same time, they can perform multiple transactions; 
encapsulation allows encapsulating the intermediate results of one transaction from the results of another; (operation completion);
by default, it is set to read committed (when another transaction is already committed, we do not see the intermediate ones);
During the execution of a transaction, parallel transactions should not affect its result;

- D - durability
if the DB has committed a transaction, it will be required to execute it;
Regardless of problems at lower levels (for example, a power outage or hardware failure), 
the changes made by a successfully completed transaction must remain saved after the system returns to work;
