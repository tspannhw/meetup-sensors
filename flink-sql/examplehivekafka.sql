beeline

CREATE EXTERNAL TABLE kafka_table
  (`uuid` STRING, `systemtime` STRING , `temperaturef` STRING , `pressure` DOUBLE,`humidity` DOUBLE, `lux` DOUBLE, `proximity` int, `oxidising` DOUBLE , `reducing` DOUBLE, `nh3` DOUBLE , `gasko` STRING,`current` INT, `voltage` INT ,`power` INT, `total` INT,`fanstatus` STRING)
  STORED BY 'org.apache.hadoop.hive.kafka.KafkaStorageHandler'
  TBLPROPERTIES
  ("kafka.topic" = "global_sensor_events", 
  "kafka.bootstrap.servers"="url:9092");

show tables;

describe extended kafka_table;

select *
from kafka_table;

!exit


/opt/cloudera/parcels/CDH/bin/kafka-console-producer --broker-list tspann-princeton0-cluster-0:9092 --topic global_sensor_eventsCluster

Send a test

CTRL-D


SEE:   https://docs.cloudera.com/HDPDocuments/HDP3/HDP-3.1.5/integrating-hive/content/hive_kafka_query_table.html
