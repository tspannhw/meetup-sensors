CREATE TABLE envirosensors 
(
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
	gasko STRING,
 PRIMARY KEY (uuid) ) 
PARTITION BY HASH PARTITIONS 4 
STORED AS KUDU TBLPROPERTIES ('kudu.num_tablet_replicas' = '1');

# {"uuid": "rpi4_uuid_dcg_20200507180100", "amplitude100": 1.1, "amplitude500": 0.3, "amplitude1000": 0.3, "lownoise": 0.5, "midnoise": 0.2, "highnoise": 0.1, "amps": 0.3, "ipaddress": "192.168.1.171", "host": "rp4", "host_name": "rp4", "macaddress": "9a:e5:28:b5:e0:14", "systemtime": "05/07/2020 14:01:02", "endtime": "1588874462.05", "runtime": "853827.88", "starttime": "04/27/2020 16:50:33", "cpu": 50.4, "cpu_temp": "73.0", "diskusage": "46318.2 MB", "memory": 27.7, "id": "20200507180100_01dd6c24-8a45-4a50-ac09-54f5e35147c0", "temperature": "46.1", "adjtemp": "34.1", "adjtempf": "73.4", "temperaturef": "95.0", "pressure": 1005.2, "humidity": 5.5, "lux": 66.7, "proximity": 0, "oxidising": 51.1, "reducing": 244.5, "nh3": 112.3, "gasKO": "Oxidising: 51130.43 Ohms\nReducing: 244487.80 Ohms\nNH3: 112306.01 Ohms"}

CREATE TABLE energy 
(
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
	diskusage STRING,
 PRIMARY KEY (uuid) ) 
PARTITION BY HASH PARTITIONS 4 
STORED AS KUDU TBLPROPERTIES ('kudu.num_tablet_replicas' = '1');
