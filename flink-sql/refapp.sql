INSERT INTO global_iot_events
SELECT scada.amplitude100 , 
scada.amplitude500 , 
scada.amplitude1000 , 
scada.lownoise , 
scada.midnoise ,
scada.highnoise , 
scada.amps , 
scada.ipaddress , 
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
scada.gasko 
FROM energy,
     airun,
     scada
WHERE
    energy.systemtime = airun.systemtime 
AND
    scada.systemtime = energy.systemtime;
