CREATE TABLE global_iot_events (
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
fanstatus STRING,
image_filename STRING
) WITH (
	'connector.type'    	 = 'kafka',
	'connector.version' 	 = 'universal',
	'connector.topic'   	 = 'energy',
	'connector.startup-mode' = 'earliest-offset',
	'connector.properties.bootstrap.servers' = 'tspann-princeton0-cluster-0.general.fuse.l42.cloudera.com:9092',
	'connector.properties.group.id' = 'flink-sql-global-join',
	'format.type' = 'json'
);

INSERT INTO global_iot_events 
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
energy.fanstatus,
airun.image_filename

FROM energy,
     airun,
     scada
WHERE
    energy.systemtime = airun.systemtime 
AND
    scada.systemtime = energy.systemtime;
