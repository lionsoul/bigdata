# HIVE
## Hive Metastore
To delete table with all partitions included one should execute following script in Hive Metastore database. Usually Hive Metastore database runs on MySQL server.

```sql
# check Hive metastore data
SELECT * FROM hive.DBS;
set @database_id:=16; 
select * from hive.TBLS where DB_ID = @database_id;

select * from hive.PARTITIONS where TBL_ID IN (select TBL_ID from hive.TBLS where DB_ID = @database_id);

select * from hive.PARTITION_KEY_VALS 
	where PART_ID IN (select PART_ID from hive.PARTITIONS 
			where TBL_ID IN (select TBL_ID from hive.TBLS where DB_ID = @database_id));
            
select * from hive.PARTITION_PARAMS 
	where PART_ID IN (select PART_ID from hive.PARTITIONS 
			where TBL_ID IN (select TBL_ID from hive.TBLS where DB_ID = @database_id));

select * from hive.PARTITION_KEYS where TBL_ID IN (select TBL_ID from hive.TBLS where DB_ID = @database_id);

select * from hive.TABLE_PARAMS where TBL_ID IN (select TBL_ID from hive.TBLS where DB_ID = @database_id);
select * from hive.TBL_PRIVS where TBL_ID IN (select TBL_ID from hive.TBLS where DB_ID = @database_id);

        
delete from hive.PARTITION_KEY_VALS 
	where PART_ID IN (select PART_ID from hive.PARTITIONS 
			where TBL_ID IN (select TBL_ID from hive.TBLS where DB_ID = @database_id));
delete from hive.PARTITION_PARAMS 
	where PART_ID IN (select PART_ID from hive.PARTITIONS 
			where TBL_ID IN (select TBL_ID from hive.TBLS where DB_ID = @database_id));
delete from hive.PARTITIONS where TBL_ID IN (select TBL_ID from hive.TBLS where DB_ID = @database_id);
delete from hive.PARTITION_KEYS where TBL_ID IN (select TBL_ID from hive.TBLS where DB_ID = @database_id);
delete from hive.TBL_PRIVS where TBL_ID IN (select TBL_ID from hive.TBLS where DB_ID = @database_id);
delete from hive.TABLE_PARAMS where TBL_ID IN (select TBL_ID from hive.TBLS where DB_ID = @database_id);
delete from hive.TBLS where DB_ID = @database_id;
delete from hive.DBS where DB_ID = @database_id;
```
