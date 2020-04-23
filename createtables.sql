CREATE TABLE `twitterhive` (
  `msg` STRING,
  `unixtime` STRING,
  `friends_count` STRING,
  `hashtags` STRING,
  `listed_count` STRING,
  `tweet_id` STRING,
  `user_name` STRING,
  `favourites_count` STRING,
  `source` STRING,
  `placename` STRING,
  `media_url` STRING,
  `retweet_count` STRING,
  `user_mentions_name` STRING,
  `geo` STRING,
  `urls` STRING,
  `countrycode` STRING,
  `user_url` STRING,
  `place` STRING,
  `coordinates` STRING,
  `handle` STRING,
  `profile_image_url` STRING,
  `time_zone` STRING,
  `ext_media` STRING,
  `statuses_count` STRING,
  `followers_count` STRING,
  `location` STRING,
  `user_mentions` STRING,
  `user_description` STRING
);

CREATE EXTERNAL TABLE IF NOT EXISTS `twitter` (`msg` STRING, `unixtime` STRING, `friends_count` STRING, `hashtags` STRING, 
                                               `listed_count` STRING, `tweet_id` STRING, `user_name` STRING, 
                                               `favourites_count` STRING, `source` STRING, `placename` STRING, 
                                               `media_url` STRING, `retweet_count` STRING, 
                                               `user_mentions_name` STRING, `geo` STRING,
                                               `urls` STRING, `countrycode` STRING, 
                                               `user_url` STRING, `place` STRING, `coordinates` STRING,
                                               `handle` STRING, `profile_image_url` STRING, `time_zone` STRING,
                                               `ext_media` STRING, `statuses_count` STRING, `followers_count` STRING, 
                                               `location` STRING, `user_mentions` STRING, `user_description` STRING) 
STORED AS ORC
LOCATION '/tmp/cnow3';



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
  
