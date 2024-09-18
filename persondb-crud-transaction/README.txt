transaction - this is a set of commands that are executed all together and if at least one of them is not executed, then all the others are not executed;

Rules of ACID:

 - A - atomicity  a set of commands is perceived as a single whole (for example, transferring money from one card to another implies two operations - withdrawal from one and crediting to another);
Guarantees that no transaction will be recorded in the system partially. Either all of its sub-operations will be executed, or none of them will be executed.

 - C - consistency после завершения транзакции либо все команды должны быть выполнены, либо система
должна быть в состоянии, в котором она была до начала операции;  committed->OK;
rollback->smth went not OK , rejected;
Транзакция, достигающая своего нормального завершения и, тем самым, фиксирующая свои результаты,
сохраняет согласованность БД;

 - I - isolation с БД одновременно могут работать 100 или 1000(-n) пользователей, они могут
выполнять множество транзакций; инкапсуляция позволяет инкапсулировать промежуточные результаты одной
транзакции от результатов другой; (законченность операции); по умолчанию имеет значение
read committed (когда другая транзакция уже закомичена, мы не видим промежуточных);
Во время выполнения транзакции, параллельные транзакции не должны оказывать влияние на ее результат.

- D - durability если БД закомитила транзакцию, то она ее обязана будет выполнить;
Независимо от проблем на нижних уровнях(к примеру, обесточивание системы или сбои в оборудовании) изменения,
сделанные успешно завершенной транзакцией, должны остаться сохраненными после возвращения системы в работу.
