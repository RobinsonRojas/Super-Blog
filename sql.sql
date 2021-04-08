-- query 1
SELECT
a.name, a.lat, a.lon, b.name, b.lat, b.lon,
(( ACOS( 
        SIN( RADIANS(a.lat ) )* 
        SIN( RADIANS(b.lat) ) + 
        COS( RADIANS(a.lat) ) * 
        COS( RADIANS(b.lat) ) * 
        COS( RADIANS(a.lon) - RADIANS(b.lon) ) 
        ) 
)*6371.01)/1.609 AS pene
FROM fly.airports AS a join
     fly.airports AS b
     on a.lat < b.lat
     
where 

    (( ACOS( 
            SIN( RADIANS(a.lat ) )* 
            SIN( RADIANS(b.lat) ) + 
            COS( RADIANS(a.lat) ) * 
            COS( RADIANS(b.lat) ) * 
            COS( RADIANS(a.lon) - RADIANS(b.lon) ) 
            ) 
    )*6371.01)/1.609 

<= 400 && 

    (( ACOS( 
            SIN( RADIANS(a.lat ) )* 
            SIN( RADIANS(b.lat) ) + 
            COS( RADIANS(a.lat) ) * 
            COS( RADIANS(b.lat) ) * 
            COS( RADIANS(a.lon) - RADIANS(b.lon) ) 
            ) 
    )*6371.01)/1.609 

>= 300


-- query 2

select origin AS Origen, dest AS Destino,  COUNT(origin)
from flights
WHERE distance >= 300 && distance <= 400
GROUP BY origin, dest
HAVING COUNT(origin)/10 > 5000
ORDER BY origin asc


-- query 3
select f.origin, f.dest AS Destino, (COUNT(f.origin)/10) AS promedio_vuelos_ano, SUM(p.seats)/10 AS promedio_sillas_ano, sum(f.arr_delay)/10 AS planesxd
from flights as f

INNER JOIN planes as p
ON f.tailnum = p.tailnum

WHERE f.distance >= 300 && f.distance <= 400
GROUP BY f.origin, f.dest
HAVING COUNT(f.origin)/10 > 5000

ORDER BY SUM(p.seats)/10 desc
--ORDER BY sum(f.arr_delay)/10 desc

