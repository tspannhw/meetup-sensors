INSERT INTO speeding_driver_alerts
SELECT windowEnd, driverAvgSpeed.driverId, driverAvgSpeed.driverName, driverAvgSpeed.route,
       driverAvgSpeed.driverAvgSpeed
FROM
(
  SELECT TUMBLE_END(geo_events.event_time, INTERVAL '3' MINUTE) as windowEnd,
       geo_events.driverId,geo_events.driverName,geo_events.route,
       avg(speed_events.speed) as driverAvgSpeed
  FROM
    truck_geo_events as geo_events,
    truck_speed_events as speed_events
  where
    geo_events.driverId = speed_events.driverId AND
    geo_events.event_time BETWEEN 
        speed_events.event_time - INTERVAL '1' SECOND AND 
        speed_events.event_time + INTERVAL '1' SECOND
  GROUP BY
    TUMBLE(geo_events.event_time, INTERVAL '3' MINUTE),
    geo_events.driverId,
    geo_events.driverName,
    geo_events.route
) driverAvgSpeed
WHERE
driverAvgSpeed.driverAvgSpeed > 80;
