## 2.0.1+1

* Truncate arguments in exception

## 2.0.0+2

* `nnbd` support
* Fix transaction ref counting on begin transaction failure

## 1.0.3+2

* Don't lock globally during open but lock per database full path.
 
## 1.0.2+1

* Don't create a transaction during openDatabase if not needed.

## 1.0.1

* Export `DatabaseException.getResultCode()`.

## 1.0.0+1

* Initial revision from sqflite 1.2.2+1
