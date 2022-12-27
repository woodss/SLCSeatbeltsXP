-- ****************************************************************************
-- X-PLANE AIRCRAFT SEATBELT SIGN COMPATIBILITY FOR SELF-LOADING CARGO!
-- ****************************************************************************
-- 
-- Written by Steve Woods (FPVSteve). 
-- Questions? Email: steve@lanilogic.com
-- Visit www.selfloadingcargo.com to find out more.
-- 
-- Copyright (C)2022 Lanilogic Technology Solutions Ltd, All Rights Reserved.
-- 
-- SUPPLIED WITHOUT WARRANTY OR GUARANTEE OF OPERATION.
-- ****************************************************************************
-- IMPORTANT - THERE IS A PREREQUISITE BIT OF PREP FOR THIS TO WORK!
-- ****************************************************************************
-- 1:
-- Please copy the entirety of this script into:
-- ~\YourXplaneFolder\Resources\Plugins\FlyWithLUA\Scripts
-- 2:
-- Please copy and paste the following four lines of code to the BOTTOM of your 
-- XPUIPCOffsets.cfg file in your xplane/resources/plugins/xpuipc folder, then 
-- remove the "-- " characters from the start of each line).
--
-- vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
-- 
-- # SELF-LOADING CARGO DECLARATIONS
-- # Declarations of all Seatbelt Datarefs
-- Dataref SLCSeatbeltDetection sim/cockpit2/switches/fasten_seat_belts int
-- Offset    0x341d    UINT8    1    rw    $SLCSeatbeltDetection 0 > 
--
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--
-- That's it!!
-- Enjoy your working seatbelt signs with SLC in your X-Plane aircraft :)
-- ****************************************************************************
-- DO NOT MODIFY BELOW THIS LINE UNLESS YOU KNOW WHAT YOU ARE DOING!
-- HERE BE DRAGONS! MIND YOUR HEAD! HIDDEN VERGE! ABANDON HOPE! IT'S A TRAP!
-- ****************************************************************************

dataref("baseSeatbeltDataRef1", "sim/cockpit/switches/fasten_seat_belts", "writeable")
dataref("baseSeatbeltDataRef2", "sim/cockpit2/switches/fasten_seat_belts", "writeable")
dataref("baseSeatbeltDataRef3", "sim/cockpit2/annunciators/fasten_seatbelt", "writeable")

define_shared_DataRef("FlyWithLua/SLCSeatbelts", "Int")
dataref("SeatbeltMonitor", "FlyWithLua/SLCSeatbelts", "writable")

function checkSeatbeltSwitch()

	local aircraft = {
		["A306"] = function()	-- for Inibuilds A306
			dataref("A306SB", "sim/cockpit2/switches/fasten_seat_belts", "readonly")
			if A306SB == 1 then
				SeatbeltMonitor = 1
			else
				SeatbeltMonitor = 0		
			end
		end,
		["A310"] = function()	-- for Inibuilds A310
			dataref("A310SB", "sim/cockpit2/switches/fasten_seat_belts", "readonly")
			if A310SB == 1 then
				SeatbeltMonitor = 1
			else
				SeatbeltMonitor = 0		
			end
		end,
		["A319"] = function()	-- for Toliss A319
			dataref("tolissA319SB", "AirbusFBW/SeatBeltSignsOn", "readonly")
			if tolissA319SB == 1 then
				SeatbeltMonitor = 1
			else
				SeatbeltMonitor = 0
			end
		end,
		["A321"] = function()	-- for Toliss A321
			dataref("tolissA321SB", "AirbusFBW/SeatBeltSignsOn", "readonly")
			if tolissA321SB == 1 then
				SeatbeltMonitor = 1
			else
				SeatbeltMonitor = 0
			end
		end,
		["A333"] = function()	-- for Laminar Airbus A330
			dataref("laminarA333", "laminar/A333/switches/fasten_seatbelts", "readonly")
			if laminarA333 == 2 then
				SeatbeltMonitor = 1
			else
				if laminarA333 == 1 then
				if ELEVATION >= 3048 then
						SeatbeltMonitor = 0
					else
						SeatbeltMonitor = 1
					end
				else
					SeatbeltMonitor = 0
				end		
			end
		end,
		["A346"] = function()	-- for Toliss A340-600
			dataref("tolissA346", "AirbusFBW/SeatBeltSignsOn", "readonly")
			if tolissA346 == 1 then
				SeatbeltMonitor = 1
			else
				SeatbeltMonitor = 0
			end
		end,
		["A359"] = function()	-- for FlightFactor A350
			dataref("ffA359SB", "1-sim/12/switch", "readonly")
			if ffA359SB == 1 then
				SeatbeltMonitor = 1
			else
				SeatbeltMonitor = 0
			end
		end,
		["B722"] = function()	-- for FlyJSim B727
			dataref("fjs722SB", "FJS/727/lights/FastenBeltsSwitch", "readonly")
			if fjs722SB == 1 then
				SeatbeltMonitor = 1
			else
				SeatbeltMonitor = 0
			end
		end,
		["B738"] = function()	-- for Zibo 737 (supports auto mode above 10,000ft)
			dataref("ZiboSB", "laminar/B738/toggle_switch/seatbelt_sign_pos", "readonly")
			if ZiboSB == 2 then
				SeatbeltMonitor = 1
			else
				if ZiboSB == 1 then
				if ELEVATION >= 3048 then
						SeatbeltMonitor = 0
					else
						SeatbeltMonitor = 1
					end
				else
					SeatbeltMonitor = 0
				end		
			end
		end,
		["B739"] = function()	-- for Zibo 737 (supports auto mode above 10,000ft)
			dataref("ZiboSB", "laminar/B738/toggle_switch/seatbelt_sign_pos", "readonly")
			if ZiboSB == 2 then
				SeatbeltMonitor = 1
			else
				if ZiboSB == 1 then
				if ELEVATION >= 3048 then
						SeatbeltMonitor = 0
					else
						SeatbeltMonitor = 1
					end
				else
					SeatbeltMonitor = 0
				end		
			end
		end,
		["B747"] = function()	-- for Laminar 747 (supports auto mode above 10,000ft)
			dataref("Lam747SB", "laminar/B747/safety/seat_belts/sel_dial_pos", "readonly")
			if Lam747SB == 2 then
				SeatbeltMonitor = 1
			else
				if Lam747SB == 1 then
					if ELEVATION >= 3048 then
						SeatbeltMonitor = 0
					else
						SeatbeltMonitor = 1
					end
				else
					SeatbeltMonitor = 0
				end		
			end
		end,
		["CL60"] = function()	-- HotStart Challenger 650 (thanks to M.E.)
			dataref("CL650SB", "CL650/overhead/signs/seatbelt_value", "readonly")
			if CL650SB == 1 then
				SeatbeltMonitor = 1
			else
				if CL650SB == -1 then
					if ELEVATION >= 3048 then
						SeatbeltMonitor = 0
					else
						SeatbeltMonitor = 1
					end
				else
					SeatbeltMonitor = 0
				end		
			end
		end,
		["CONC"] = function()	-- for Colimata-Concorde
			dataref("CONCSB", "Colimata/CON_RP_LIGHT_sw_fasten_seatblts_i", "readonly")
			if CONCSB == 1 then
				SeatbeltMonitor = 1
			else
				SeatbeltMonitor = 0		
			end
		end,
		["DH8D"] = function()	-- for FJS Q4XP 
			dataref("Q4XPSB", "sim/cockpit/switches/fasten_seat_belts", "readonly")
			if Q4XPSB == 1 then
				SeatbeltMonitor = 1
			else
				SeatbeltMonitor = 0		
			end
		end,
		["E170"] = function()	-- for SSG Embraer 170
			dataref("E170SB", "SSG/EJET/SIGNS/fasten_belts_sw", "readonly")
			if E170SB == 1 then
				SeatbeltMonitor = 1
			else
				SeatbeltMonitor = 0		
			end
		end,
		["E195"] = function()	-- for SSG Embraer 195
			dataref("E195SB", "SSG/EJET/SIGNS/fasten_belts_sw", "readonly")
			if E195SB == 1 then
			SeatbeltMonitor = 1
			else
				SeatbeltMonitor = 0		
			end
		end,
		["MD80"] = function()	-- for ROTATE MD-80 (supports auto mode above 10,000ft)
			dataref("MD80SB", "Rotate/md80/systems/seatbelts_switch", "readonly")
			if MD80SB == 1 then
				SeatbeltMonitor = 1
			else
				if MD80SB == -1 then
					if ELEVATION >= 3048 then
						SeatbeltMonitor = 0
					else
						SeatbeltMonitor = 1
					end
				else
					SeatbeltMonitor = 0
				end		
			end
		end,
	}
	
	local actionableAircraftResult = aircraft[PLANE_ICAO]
	if (actionableAircraftResult) then
		--	We found a aircraft that we recognise, run the associated method.
		actionableAircraftResult()
	else				
		--	For all default aircraft.
		dataref("dEFaulTSPbVE", "sim/cockpit2/switches/fasten_seat_belts", "readonly")
		if dEFaulTSPbVE == 1 then
			SeatbeltMonitor = 1
		else
			if dEFaulTSPbVE == 2 then
				if ELEVATION >= 3048 then
					SeatbeltMonitor = 0
				else
					SeatbeltMonitor = 1
				end
			else
				SeatbeltMonitor = 0
			end
		end
	end

	-- ******************************************************
	-- UPDATE SEATBELT MONITOR FLAG AND ALL RELEVANT DATAREFS
	-- WITH NEW SWITCH VALUE IF IT HAS CHANGED.
	-- THEN TOGGLE THE SEATBELT SIGN COMMAND WITHIN X-PLANE.
	-- ******************************************************
	if baseSeatbeltDataRef1 ~= SeatbeltMonitor then
		baseSeatbeltDataRef1 = SeatbeltMonitor
		baseSeatbeltDataRef2 = SeatbeltMonitor
		baseSeatbeltDataRef3 = SeatbeltMonitor
		command_once("sim/systems/seatbelt_sign_toggle")
	end
	-- *******************************************************	
end



do_often("checkSeatbeltSwitch()")
