CREATE TABLE scada (
	 uuid STRING, systemtime STRING,  amplitude100 DOUBLE, 
amplitude500 DOUBLE, amplitude1000 DOUBLE, lownoise DOUBLE, midnoise DOUBLE,
highnoise DOUBLE, amps DOUBLE, ipaddress STRING, host STRING, host_name STRING,
macaddress STRING, endtime STRING, runtime STRING, starttime STRING, 
cpu DOUBLE, cpu_temp STRING, diskusage STRING, memory DOUBLE, id STRING, 
temperature STRING, adjtemp STRING, adjtempf STRING, temperaturef STRING, 
pressure DOUBLE, humidity DOUBLE, lux DOUBLE, proximity INT, 
oxidising DOUBLE, reducing DOUBLE, nh3 DOUBLE, gasko STRING
) WITH (
	'connector.type'    	 = 'kafka',
	'connector.version' 	 = 'universal',
	'connector.topic'   	 = 'scada',
	'connector.startup-mode' = 'earliest-offset',
	'connector.properties.bootstrap.servers' = 'edge2ai-1.dim.local:9092',
	'connector.properties.group.id' = 'flink-sql-scada-consumer',
	'format.type' = 'json'
);
