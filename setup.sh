
# No Kerberos 

HADOOP_USER_NAME=hdfs hdfs dfs -mkdir /user/admin
HADOOP_USER_NAME=hdfs hdfs dfs -mkdir /user/root
HADOOP_USER_NAME=hdfs hdfs dfs -chown root:root /user/root
HADOOP_USER_NAME=hdfs hdfs dfs -chown admin:admin /user/admin
HADOOP_USER_NAME=hdfs hdfs dfs -chmod -R 777 /user
HADOOP_USER_NAME=hdfs hdfs dfs -mkdir /user/kafka
HADOOP_USER_NAME=hdfs hdfs dfs -mkdir /tmp/sensors
HADOOP_USER_NAME=hdfs hdfs dfs -chmod -R 777 /tmp/sensors
HADOOP_USER_NAME=hdfs hdfs dfs -chown kafka:kafka /user/kafka
HADOOP_USER_NAME=hdfs hdfs dfs -chown kafka:kafka /tmp/sensors
HADOOP_USER_NAME=hdfs hdfs dfs -mkdir /tmp/itemprice
HADOOP_USER_NAME=hdfs hdfs dfs -chmod -R 777 /tmp/itemprice
HADOOP_USER_NAME=hdfs hdfs dfs -chown kafka:kafka /tmp/itemprice
HADOOP_USER_NAME=hdfs hdfs dfs -mkdir /tmp/sensorevents/
HADOOP_USER_NAME=hdfs hdfs dfs -chmod -R 777 /tmp/sensorevents/
HADOOP_USER_NAME=hdfs hdfs dfs -chown kafka:kafka /tmp/sensorevents/

impala-shell -i ec2-52-54-225-47.compute-1.amazonaws.com -d default -f kudu.sql 

curl -k -u admin:supersecret1 --location --request POST 'http://ec2-52-54-225-47.compute-1.amazonaws.com:31000/api/atlas/v2/types/typedefs' \
--header 'Content-Type: application/json' \
--data-raw '{
    "enumDefs": [],
    "structDefs": [],
    "classificationDefs": [],
    "entityDefs": [
        {
            "name": "flink_application",
            "superTypes": [
                "Process"
            ],
            "serviceType": "flink",
            "typeVersion": "1.0",
            "attributeDefs": [
                {
                    "name": "id",
                    "typeName": "string",
                    "cardinality": "SINGLE",
                    "isIndexable": true,
                    "isOptional": false,
                    "isUnique": true
                },
                {
                    "name": "startTime",
                    "typeName": "date",
                    "cardinality": "SINGLE",
                    "isIndexable": false,
                    "isOptional": true,
                    "isUnique": false
                },
                {
                    "name": "endTime",
                    "typeName": "date",
                    "cardinality": "SINGLE",
                    "isIndexable": false,
                    "isOptional": true,
                    "isUnique": false
                },
                {
                    "name": "conf",
                    "typeName": "map<string,string>",
                    "cardinality": "SINGLE",
                    "isIndexable": false,
                    "isOptional": true,
                    "isUnique": false
                },
                {
                    "name": "inputs",
                    "typeName": "array<string>",
                    "cardinality": "LIST",
                    "isIndexable": false,
                    "isOptional": false,
                    "isUnique": false
                },
                {
                    "name": "outputs",
                    "typeName": "array<string>",
                    "cardinality": "LIST",
                    "isIndexable": false,
                    "isOptional": false,
                    "isUnique": false
                }
            ]
        }
    ],
    "relationshipDefs": []
}'




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
	'format.type' = 'avro'
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
	'format.type' = 'avro'
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



