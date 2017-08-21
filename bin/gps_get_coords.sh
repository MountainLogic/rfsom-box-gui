#!/bin/bash

if ($1 = "-q")
then
date
fi

#gpsdata=$( gpspipe -w -n 10 |   grep -m 1 lon )
gpsdata=$( gpspipe -w | grep -m 1 TPV )
lat=$( echo "$gpsdata"  | jsawk 'return this.lat' )
lon=$( echo "$gpsdata"  | jsawk 'return this.lon' )
alt=$( echo "$gpsdata"  | jsawk 'return this.alt' )
dt=$( echo "$gpsdata" | jsawk 'return (this.time).replace("T"," ").slice(0,-5)' )
if ($1 = "-q")
then
echo "$dt"
echo "You are here: $lat, $lon at $alt"
fi

echo $lat > /tmp/gpslat
echo $lon > /tmp/gpslon
echo $alt > /tmp/gpsalt
echo $dt > /tmp/gpstime

