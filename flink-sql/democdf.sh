clear
cd /opt/demo
yum -y install git
git clone https://github.com/tspannhw/meetup-sensors
git clone https://github.com/tspannhw/FlinkSQLDemo

chmod -R 777 /opt/demo/FlinkSQLDemo
chmod -R 777 /opt/demo/meetup-sensors

/opt/demo/FlinkSQLDemo/sethdfspermissions.sh

/opt/cloudera/parcels/CDH/bin/kafka-topics --create --bootstrap-server edge2ai-1.dim.local:9092 --replication-factor 1 --partitions 1 --topic global_sensor_events

/opt/cloudera/parcels/CDH/bin/kafka-topics --create --bootstrap-server edge2ai-1.dim.local:9092 --replication-factor 1 --partitions 1 --topic energy

/opt/cloudera/parcels/CDH/bin/kafka-topics --create --bootstrap-server edge2ai-1.dim.local:9092 --replication-factor 1 --partitions 1 --topic scada

/opt/demo/FlinkSQLDemo/buildyarnsession.sh

/opt/demo/FlinkSQLDemo/startsqlclient.sh

show catalogs;

show tables;

CREATE TABLE global_sensor_events (
 uuid STRING, 
	systemtime STRING ,  
temperaturef STRING , 
pressure DOUBLE, 
humidity DOUBLE, 
lux DOUBLE, 
proximity int, 
oxidising DOUBLE , 
reducing DOUBLE, 
nh3 DOUBLE , 
gasko STRING,
`current` INT, 
voltage INT ,
`power` INT,
`total` INT,
fanstatus STRING
) WITH (
	'connector.type'    	 = 'kafka',
	'connector.version' 	 = 'universal',
	'connector.topic'   	 = 'global_sensor_events',
	'connector.startup-mode' = 'earliest-offset',
	'connector.properties.bootstrap.servers' = 'edge2ai-1.dim.local:9092',
	'connector.properties.group.id' = 'flink-sql-global-sensor-join',
	'format.type' = 'json'
);

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
	'connector.properties.bootstrap.servers' = 'edge2ai-1.dim.local:9092',
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
	'connector.properties.bootstrap.servers' = 'edge2ai-1.dim.local:9092',
	'connector.properties.group.id' = 'flink-sql-scada-consumer',
	'format.type' = 'json'
);

INSERT INTO global_sensor_events 
SELECT 
	scada.uuid, 
	scada.systemtime ,  
scada.temperaturef , 
scada.pressure , 
scada.humidity , 
scada.lux , 
scada.proximity , 
scada.oxidising , 
scada.reducing , 
scada.nh3 , 
scada.gasko,
energy.`current`, 
energy.voltage ,
energy.`power` ,
energy.`total`,
energy.fanstatus

FROM energy,
     scada
WHERE
    scada.systemtime = energy.systemtime;

show tables;

# then query then Quit

select * from energy;

select * from scada;

select * from global_sensor_events;

# when done

drop table energy;

drop table scada;

drop table global_sensor_events;

# exit

exit;
