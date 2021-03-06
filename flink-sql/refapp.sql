INSERT INTO global_iot_events 
(uuid, systemtime, amplitude100, amplitude500 , amplitude1000 , lownoise , 
midnoise ,highnoise , amps , ipaddress , host ,host_name ,macaddress , endtime , runtime , starttime , 
cpu , cpu_temp , diskusage , memory , 
id , temperature , adjtemp , adjtempf , temperaturef , pressure , humidity , lux , proximity , 
oxidising ,reducing , nh3 , gasko,`current`, voltage ,`power` ,`total`,deviceId,alias ,devname,iconhash,relaystate,ontime,activemode, 
feature,updating,rssi,ledoff,latitude,longitude,`index`,zonestr,tzstr ,dstoffset,
currentconsumption ,devicetime ,ledon ,fanstatus,image_filename)
SELECT 
	scada.uuid, 
	scada.systemtime ,  
scada.amplitude100 , 
scada.amplitude500 , 
scada.amplitude1000 , 
scada.lownoise , 
scada.midnoise ,
scada.highnoise , 
scada.amps , 
scada.ipaddress , 
scada.host ,
scada.host_name ,
scada.macaddress , 
scada.endtime , 
scada.runtime , 
scada.starttime , 
scada.cpu , 
scada.cpu_temp , 
scada.diskusage , 
scada.memory , 
scada.id , 
scada.temperature , 
scada.adjtemp , 
scada.adjtempf , 
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
energy.deviceId, 
energy.alias ,
energy.devname,
energy.iconhash,
energy.relaystate,
energy.ontime,
energy.activemode, 
energy.feature,
energy.updating,
energy.rssi,
energy.ledoff,
energy.latitude,
energy.longitude,
energy.`index`,
energy.zonestr,
energy.tzstr ,
energy.dstoffset,
energy.currentconsumption ,
energy.devicetime ,
energy.ledon ,
energy.fanstatus,
airun.image_filename

FROM energy,
     airun,
     scada
WHERE
    energy.systemtime = airun.systemtime 
AND
    scada.systemtime = energy.systemtime;
