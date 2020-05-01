CREATE EXTERNAL TABLE IF NOT EXISTS `sensors` (`uuid` STRING, `amplitude100` DOUBLE, 
`amplitude500` DOUBLE, `amplitude1000` DOUBLE, `lownoise` DOUBLE, `midnoise` DOUBLE,
`highnoise` DOUBLE, `amps` DOUBLE, `ipaddress` STRING, `host` STRING, `host_name` STRING,
`macaddress` STRING, `systemtime` STRING, `endtime` STRING, `runtime` STRING, `starttime` STRING, 
`cpu` DOUBLE, `cpu_temp` STRING, `diskusage` STRING, `memory` DOUBLE, `id` STRING, 
`temperature` STRING, `adjtemp` STRING, `adjtempf` STRING, `temperaturef` STRING, 
`pressure` DOUBLE, `humidity` DOUBLE, `lux` DOUBLE, `proximity` BIGINT, 
`oxidising` DOUBLE, `reducing` DOUBLE, `nh3` DOUBLE, `gasko` STRING)
STORED AS ORC
LOCATION '/tmp/sensors';

