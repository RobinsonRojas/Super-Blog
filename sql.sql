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
