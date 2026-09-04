--////////////////////////////////--
--//         Background         //--
--////////////////////////////////--

--## Name: Turzil
--## Sex: Male
--## Race: Engi
--## Age: 72
--## Job: Fleet General
--## Sponsor: None

--## Turzil was the engi general of the Federation Fleet in FTL.
--## As a general, Turzil turned the tide of many battles and showed particular aptitude in directing large fleets of ships in concert.
--## Before Turzil was warped into the ITB timelines, the Experimental Pseudo-Manned Federation Cruiser was able to defeat the Rebel Flagship, turning the tide of the war. However, the victory was not immediate, and his command cruiser was ambushed in civilian space. The crew, against his wishes, sent him an experimental no-destination fast-warp escape pod as their only hope of getting him out alive. The experimental technology sent into ITB.
--## Turzil remains unsure of the outcome of the galactic war, though signs pointed to Federation victory.

--////////////////////////////////--





--////////////////////////////////--
--//          Character         //--
--////////////////////////////////--

--## Turzil is an experienced veteran, and talks mostly in simple military terms.
--## The one time he will show strong emotion is when interacting with advanced ITB AI, which he finds fascinating both because his mind is partially simulated and because it was an advanced AI unit that was able to turn the tide of the Galactic War.
--## Turzil talks using a unique style of grammar that is adjacent to a programming language:

	--## Parenthesis:
		--## () is standard
		--## {} is agitated
		--## [] is a command
	--## greater quantities indicate greater emphasis or urgency

	--## Subjects:
		--## < indicates self
		--## > indicates ally
		--## ^ indicates hostile
		--## # indicates object (including civilians)
		--## % indicates location
	--## greater quantities indicate greater numbers

	--## Operands:
		--## @ indicates ownership
		--## $ indicates any kind of permanent trait
		--## & indicates any kind of temporary trait
		--## + indicates a good trait
		--## - indicates a bad trait
	--## greater quantities indicate greater emphasis

	--## ? indicates uncertainty
	--## ! indicates inversion
	--## , separate "clauses"
	--## ; separate "sentences"

--////////////////////////////////--





--////////////////////////////////--
--//            Lines           //--
--////////////////////////////////--

return {

----------------
-- Game Start --
----------------

	Gamestart = {
		"([ <>>,&++,@#### ])",
		"(( <>>,&+++,@^^^^^ ))"
	},
	Gamestart_PostVictory = {
		"((( <>>####,&++++,@%%+ )))"
	},


----------------------
-- Combat (General) --
----------------------

	VekKilled_Self = {
		"(( <,&&++,@^ ))"
	},
	VekKilled_Obs = {
		"(( >,&++,@^ ))"
	},
	VekKilled_Vek = {
		"(( ^,&+,@^ ))"
	},
	DoubleVekKill_Self = {
		"(( <,&&+++,@^^ ))"
	},
	DoubleVekKill_Obs = {
		"(( >,&+++,@^^ ))"
	},
	DoubleVekKill_Vek = {
		"(( ^,&?> ))"
	},
	Emerge_Detected = {
		"( ^^,@%% )"
	},
	Emerge_Success = {
		"( ^^ )"
	},
	Emerge_FailedMech = {
		"(^,&!--,@<)"
	},
	Emerge_FailedVek = {
		"(^,&!-,@^)"
	},
	BotKilled_Self = {
		"{{{ ^>,$--,@< ; <,&---- }}}"
	},
	BotKilled_Obs = {
		"{[ ^>,$-- ; >,&!-- ]}"
	},
	Mech_LowHealth = {
		"{( #@<,&-- >>,&+,%< )}"
	},
	Death_Main = {
		"{{[ #@<<,$--- ; <>>,$++ ]}}"
	},
	Death_Response = {
		"{{{ #@>>,$--- }}}"
	},
	Death_Response_AI = {
		"{{ #>,$--- }}"
	},
	Death_Revived = {
		"(( #@<<,$!--- ; #@<<,&+ ))"
	},


------------------------
-- Combat (Elemental) --
------------------------

	Vek_Drown = {
		"( ^,&+++ ; %,&+ )"
	},
	Vek_Fall = {
		"( ^,&+++ ; %,&++ )"
	},
	Vek_Smoke = {
		"( ^,&&+ )"
	},
	Vek_Frozen = {
		"( ^,&++ )"
	},
	Mech_Webbed = {
		"(( #@<,&--,@^ ))"
	},
	Mech_Shielded = {
		"( #@<,@#,&++ )"
	},
	Mech_ShieldDown = {
		"{ #@<,@#,&-- }"
	},
	Mech_Repaired = {
		"(( #@<,&&++ ; ^^^%,&+ ))",
		"(( #@<,&&++ ; >>,@!%% ))",
		"(( #@<,&&++ ))"
	},


--------------------
-- Combat (Level) --
--------------------

	Pilot_Level_Self = {
		"(( <,$+++ ))"
	},
	Pilot_Level_Obs = {
		"(( >,$++ ; <,&+ ))"
	},


--------------------------
-- Combat (Environment) --
--------------------------

	MntDestroyed_Self = {
		"( #,$+,@< )"
	},
	MntDestroyed_Obs = {
		"( #,$+,@> )"
	},
	MntDestroyed_Vek = {
		"( #,$+-,@^ )"
	},
	Bldg_Destroyed_Self = {
		"{{ #,$-- ; <,&-- }}"
	},
	Bldg_Destroyed_Obs = {
		"[[ > ; #,&&-- ]]"
	},
	Bldg_Destroyed_Vek = {
		"( #,$-- )"
	},
	Bldg_Resisted = {
		"(( #,$!-- ))"
	},
	PowerCritical = {
		"{{ #%,&--- }}"
	},
	Gameover_Start = {
		"{{{ #%,$----- ; ####%,$---- }}}"
	},
	Gameover_Response = {
		"{[[ <>>,&%%- ]]}"
	},


-------------------
-- Mech Upgrades --
-------------------

	Upgrade_PowerWeapon = {
		"{[ #@<,@#,$++ ]}"
	},
	Upgrade_NoWeapon = {
		"{[ #@<,&&!-- ]}"
	},
	Upgrade_PowerGeneric = {
		"( #@<,&++ )"
	},


-----------------------
-- Mission (General) --
-----------------------

	MissionStart = {
		"[[ ^^^ ; <>>,&### ]]"
	},
	Mission_ResetTurn = {
		"( %<>>,@%%%%%% )"
	},
	MissionEnd_Retreat = {
		"( ^^^,&%%+ )"
	},
	MissionEnd_Dead = {
		"(( ^^^,&%%++ ))"
	},

	PodIncoming = {
		"( #>,&%%% )"
	},
	PodResponse = {
		"[[ #>,$+++ ]]"
	},

	PodCollected_Self = {
		"( <,@#> )"
	},
	PodDestroyed_Obs = {
		"{ #>,&-- }"
	},
	Secret_DeviceSeen_Mountain = {
		"(( ?#,&?% ))"
	},
	Secret_DeviceSeen_Ice = {
		"(( ?#,&?% ))"
	},
	Secret_DeviceUsed = {
		"(( ?#,&+ ))"
	},
	Secret_Arriving = {
		"(( #?>,&%%% ))"
	},
	FTL_Found = {
		"((( >,$$??> )))"
	},
	Mission_Train_TrainStopped = {
		"(( ##,$$- ))"
	},
	Mission_Train_TrainDestroyed = {
		"(( ##,$--- ))"
	},
	Mission_Block_Reminder = {
		"[ ^^^,!&% ]"
	},


-----------------------
-- Mission (Archive) --
-----------------------

	Mission_Airstrike_Incoming = {
		"(( >>,@%% ))"
	},
	Mission_Repair_Start = {
		"{ <>>,?&--- }"
	},
	Mission_Tanks_Activated = {
		"(( ##,&&++ ))"
	},
	Mission_Tanks_PartialActivated = {
		"{{ #,&++ ; #,!&+ }}"
	},
	Mission_Dam_Reminder = {
		"[ #,&--- ]"
	},
	Mission_Dam_Destroyed = {
		"( #,$$++ )"
	},
	Mission_Satellite_Destroyed = {
		"(( #,$-- ))"
	},
	Mission_Satellite_Imminent = {
		"[[ #,&+ ; ^^^,!&++ ]]"
	},
	Mission_Satellite_Launch = {
		"( #,&++ )"
	},
	Mission_Mines_Vek = {
		"( ^,&++ ; ###,$+ )"
	},


-------------------
-- Mission (RST) --
-------------------

	Mission_Terraform_Destroyed = {
		"(( #,$--- ))"
	},
	Mission_Terraform_Attacks = {
		"( >,&+ ; ^^,$++ )"
	},
	Mission_Cataclysm_Falling = {
		"(( %%,&&&- ))"
	},
	Mission_Lightning_Strike_Vek = {
		"( ^,&+++ ; %,$+ )"
	},
	Mission_Solar_Destroyed = {
		"{{ #,$--- }}"
	},
	Mission_Force_Reminder = {
		"[ ###,&-- ]"
	},
	Mission_Wind_Mech = {
		"( <,@% )"
	},


------------------------
-- Mission (Pinnacle) --
------------------------

	Mission_Freeze_Mines_Vek = {
		"( ^,&++ )"
	},
	Mission_Factory_Destroyed = {
		"{{{ #,$$---- }}}"
	},
	Mission_Factory_Spawning = {
		"[[ ^>,&--- ; <>>,!&- ]]"
	},
	Mission_Reactivation_Thawed = {
		"( ^^,&&- )"
	},
	Mission_Hacking_NewFriend = {
		"((( >,&&&++++ ; <>>,@> )))"
	},
	Mission_Shields_Down = {
		"( #,$$++ )"
	},
	Mission_SnowStorm_FrozenVek = {
		"( ^,&++ )"
	},
	Mission_SnowStorm_FrozenMech = {
		"{{ <,&-- }}"
	},


------------------------
-- Mission (Detritus) --
------------------------

	Mission_Disposal_Destroyed = {
		"(( #,$--- ))"
	},
	Mission_Disposal_Activated = {
		"( >,&+ ; ^^,$++ )"
	},
	Mission_ACID_Storm_Start = {
		"{ %%<>>,&-- }"
	},
	Mission_ACID_Storm_Clear = {
		"( %%,&++ )"
	},
	Mission_Barrels_Destroyed = {
		"( #,$$+ )"
	},
	Mission_Power_Destroyed = {
		"{{ #,$--- }}"
	},
	Mission_Teleporter_Mech = {
		"( <,@%% )"
	},
	Mission_Belt_Mech = {
		"{ <,@% }"
	},


--------------------
-- Mission (Hive) --
--------------------

	MissionFinal_Start = {
		"[[ ^^^^ ; <>>,@##### ]]"
	},
	MissionFinal_StartResponse = {
		"( <,&- ; ###,&++ )"
	},
	MissionFinal_FallResponse = {
		"{{{ #,&&&- }}}"
	},
	MissionFinal_Bomb = {
		"{{ #,$$--- ; <>>,&&?- }}"
	},
	MissionFinal_CaveStart = {
		"[[ ^^^^^ ; #,@<>> ]]"
	},
	MissionFinal_BombArmed = {
		"((( #,&&&+ )))"
	},
	TimeTravel_Win = {
		"(( <>>#####,$$++ ; ^^^,$$-- ))"
	},


------------
-- Impact --
------------

	Mech_Heal = {
		"( #@<,$+ )"
	},
	Mech_Boost = {
		"(( #@<,&++ ))"
	},
	Mech_Supply = {
		"( #@<,@##,&!-- )"
	},
	Mech_Deplete = {
		"{ #@<,@##,&-- }"
	},
	Mech_SelfDamage = {
		"{{ #@<,@#&-- }}"
	}
}

--////////////////////////////////--
