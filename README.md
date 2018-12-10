# bigdata

Task:
Create daily import of cdr table from Oracle DB.

Steps:
1. Use testing.sh to test connectivity to Oracle DB using sqoop.
2. Create sqoop job using sqoop_create_job.sh
3. Schedule sqoop job using crontab (sqoop_schedule_crontab.sh) or using oozie
	as described in oozie/oozie_schedule_sqoop.readme.

Files:

README.md
	This file
	
doc_sources.txt
	Holds reference to internet sources for task solving.

sqoop_create_job.sh
	Bash script to create sqoop job - import cdr table from Oracle DB to Hive.

sqoop_schedule_crontab.sh
	Bash script to install crontab job for sqoop job.

testing.sh
	Bash script to test connectivity to Oracle DB using sqoop.
	
oozie/coordinator.xml
	File needed to create scheduled oozie task.
	
oozie/job.properties
	File for oozie job parameters.
	
oozie/oozie_schedule_sqoop.readme
	Describes steps needed to install oozie job.
	
oozie/workflow.xml
	Oozie workflow for executing sqoop job.
