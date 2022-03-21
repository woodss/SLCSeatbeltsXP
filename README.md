# SLCSeatbeltsXP
X-Plane cockpit seatbelt sign switch compatibility script for Self-Loading Cargo

## INSTRUCTIONS ##
1) Copy **SLCSeatbelts.lua** into:
**~\YourXplaneFolder\Resources\Plugins\FlyWithLUA\Scripts**

2) Copy and paste the following four lines of code to the BOTTOM of your 
**XPUIPCOffsets.cfg** file which can be found in your **xplane/resources/plugins/xpuipc** folder.

<pre>
# SELF-LOADING CARGO DECLARATIONS
# Declarations of all Seatbelt Datarefs
Dataref SLCSeatbeltDetection sim/cockpit2/switches/fasten_seat_belts int
Offset    0x341d    UINT8    1    rw    $SLCSeatbeltDetection 0 > 
</pre>

### That's it!! ###
Enjoy your working seatbelt signs with SLC in your X-Plane aircraft :)
