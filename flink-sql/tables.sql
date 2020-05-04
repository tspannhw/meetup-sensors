CREATE TABLE energy (
	uuid STRING, 
	systemtime STRING,  
        `current` INT, 
	voltage INT, 
	`power` INT, 
	`total` INT, 
	swver STRING, 
	hwver STRING,
	type STRING, 
	model STRING, 
	mac STRING, 
	deviceId STRING, 
	hwId STRING, 
	fwId STRING, 
	oemId STRING,
	alias STRING, 
	devname STRING, 
	iconhash STRING, 
	relaystate INT, 
	ontime INT, 
	activemode STRING, 
	feature STRING, 
	updating INT, 
	rssi INT, 
	ledoff INT, 
	latitude INT, 
	longitude INT, 
	`day` INT, 
	`index` INT, 
	zonestr STRING, 
	tzstr STRING, 
	dstoffset INT, 
	host STRING, 
	currentconsumption INT, 
	devicetime STRING, 
	ledon STRING, 
	fanstatus STRING, 
	`end` STRING, 
	te STRING, 
	cpu INT, 
	memory INT, 
	diskusage STRING
) WITH (
	'connector.type'    	 = 'kafka',
	'connector.version' 	 = 'universal',
	'connector.topic'   	 = 'energy',
	'connector.startup-mode' = 'earliest-offset',
	'connector.properties.bootstrap.servers' = 'tspann-princeton0-cluster-0.general.fuse.l42.cloudera.com:9092',
	'connector.properties.group.id' = 'flink-sql-energy-consumer',
	'format.type' = 'json'
);



CREATE TABLE scada (
	uuid STRING, 
	systemtime STRING,  
	amplitude100 DOUBLE, 
        amplitude500 DOUBLE, 
	amplitude1000 DOUBLE, 
	lownoise DOUBLE, 
	midnoise DOUBLE,
        highnoise DOUBLE, 
	amps DOUBLE, 
	ipaddress STRING, 
	host STRING, 
	host_name STRING,
        macaddress STRING, 
	endtime STRING, 
	runtime STRING, 
	starttime STRING, 
        cpu DOUBLE, 
	cpu_temp STRING, 
	diskusage STRING, 
	memory DOUBLE, 
	id STRING, 
	temperature STRING, 
	adjtemp STRING, 
	adjtempf STRING, 
	temperaturef STRING, 
	pressure DOUBLE, 
	humidity DOUBLE, 
	lux DOUBLE, 
	proximity INT, 
	oxidising DOUBLE, 
	reducing DOUBLE, 
	nh3 DOUBLE, 
	gasko STRING
) WITH (
	'connector.type'    	 = 'kafka',
	'connector.version' 	 = 'universal',
	'connector.topic'   	 = 'scada',
	'connector.startup-mode' = 'earliest-offset',
	'connector.properties.bootstrap.servers' = 'tspann-princeton0-cluster-0.general.fuse.l42.cloudera.com:9092',
	'connector.properties.group.id' = 'flink-sql-scada-consumer',
	'format.type' = 'json'
);
