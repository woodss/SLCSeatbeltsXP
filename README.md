# SLCSeatbeltsXP
X-Plane cockpit seatbelt sign switch compatibility script for Self-Loading Cargo

## INSTRUCTIONS ##

1) Ensure FlyWithLua is installed in your X-Plane plugins folder

2) Copy **SLCSeatbelts.lua** into:
**~\YourXplaneFolder\Resources\Plugins\FlyWithLUA\Scripts**

3) Copy and paste the following four lines of code to the BOTTOM of your 
**XPUIPCOffsets.cfg** file which can be found in your **xplane/resources/plugins/xpuipc** folder.

<pre>
# SELF-LOADING CARGO DECLARATIONS
# Declarations of all Seatbelt Datarefs
Dataref SLCSeatbeltDetection sim/cockpit2/switches/fasten_seat_belts int
Offset    0x341d    UINT8    1    rw    $SLCSeatbeltDetection 0 > 
</pre>

### That's it!! ###
Enjoy your working seatbelt signs with Self-Loading Cargo in your X-Plane aircraft :)

### Copyright ###
For use with Self-Loading Cargo ( www.selfloadingcargo.com )
Copyright (C)2023 Lanilogic Technology Solutions Ltd - All Rights Reserved

### Trademarks ###
"Self Loading Cargo" is a UK registered trademark (N<sup>o</sup> UK00003962453) of Lanilogic Technology Solutions Ltd
