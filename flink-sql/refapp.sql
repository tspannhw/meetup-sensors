INSERT INTO global_iot_events
SELECT energy.amplitude100 , 
energy.amplitude500 , 
energy.amplitude1000 , 
energy.lownoise , 
energy.midnoise ,
energy.highnoise , 
energy.amps , 
energy.ipaddress , 
energy.host_name ,
energy.macaddress , 
energy.endtime , 
energy.runtime , 
energy.starttime , 
energy.cpu , 
energy.cpu_temp , 
energy.diskusage , 
energy.memory , 
energy.id , 
energy.temperature , 
energy.adjtemp , 
energy.adjtempf , 
energy.temperaturef , 
energy.pressure , 
energy.humidity , 
energy.lux , 
energy.proximity , 
energy.oxidising , 
energy.reducing , 
energy.nh3 , 
energy.gasko 
FROM energy,
     airun,
     scada
WHERE
    energy.systemtime = airun.systemtime 
AND
    scada.systemtime = energy.systemtime;
