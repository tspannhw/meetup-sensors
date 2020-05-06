beeline

CREATE EXTERNAL TABLE kafka_table
  (`timestamp` timestamp , `page` string,  `newPage` boolean, 
  added int, deleted bigint, delta double)
  STORED BY 'org.apache.hadoop.hive.kafka.KafkaStorageHandler'
  TBLPROPERTIES
  ("kafka.topic" = "global_sensor_eventsCluster", 
  "kafka.bootstrap.servers"="tspann-princeton0-cluster-0.general.fuse.l42.cloudera.com:9092");

show tables;

!exit


/opt/cloudera/parcels/CDH/bin/kafka-console-producer --broker-list tspann-princeton0-cluster-0:9092 --topic global_sensor_eventsCluster

Send a test

CTRL-D
