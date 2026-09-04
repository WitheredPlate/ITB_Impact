--////////////////////////////////--
--//         Background         //--
--////////////////////////////////--

--## Name: Evelyn Moore
--## Sex: Female
--## Race: Human
--## Age: 53
--## Job: Wartime Ambassador
--## Sponsor: Harmony Reclamation

--## Evelyn Moore is a middle-aged wartime, terrorist, and general conflict ambassador.
--## She has experience in, was trained in, and is comfortable real combat.
--## She has successfully negotiated numerous hostage situations, brokered several treaties, and played a significant part in the end of at least one major war.
--## She is well-known through a variety of avenues, but particularly so within her sponsor corporation, Harmony Reclamation.
--## Evelyn was present on Harmony Reclamation before the Vek Outbreak to hash out the details of a hostile raider land division deal with CEO Powell.

--////////////////////////////////--





--////////////////////////////////--
--//          Character         //--
--////////////////////////////////--

--## Evelyn speaks in a very sophisticated tone, and often makes use of a large vocabulary.
--## In times of stress or that require focus, Evelyn sometimes reverts back to curt military lingo.
--## She is curious, capable of viewing things in both a scientific and military context, but serious in most any situation, especially those that require it.
--## Due partially to her background an partially to personal mentality, Evelyn values civilian lives above almost all else, and has extreme difficulty mentally reconciling player actions that result in the death of civilians.
--## Evelyn does not view machine life as a real form of life, and does not generally take actions to protect it.
--## Evelyn has a moderate hatred towards vek due to their destructive nature that often leads to the death of innocents. She regularly refers to them as "beasts."

--////////////////////////////////--





--////////////////////////////////--
--//            Lines           //--
--////////////////////////////////--

return {

----------------
-- Game Start --
----------------

	Gamestart = {
		"These islands represent the only remaining barrier between the Vek and the world. I will not let them fall.",
		"I already made one mistake. I cannot and will not make another.",
		"We must rally, and we must fight, lest this timeline become a graveyard for humanity."
	},
	Gamestart_PostVictory = {
		"I have already rectified one mistake. Allow me to do the same once more.",
		"This timeline will survive as well. I will make sure of it.",
		"Humanity's safety must be assured. I have already done so before. I plan to do so again."
	},


----------------------
-- Combat (General) --
----------------------

	VekKilled_Self = {
		"Vek exterminated.",
		"Excellent.",
		"Your motives justify your demise.",
		"Beast's dead.",
		"Vek down. It poses no threat to civilians."
	},
	VekKilled_Obs = {
		"Excellent job, #main_second."
	},
	VekKilled_Vek = {
		"The beasts cannot even distinguish between ally and enemy.",
		"Excellent. Pitting them against each other is a fine tactic.",
		"Sometimes it seems the beasts have no concept of what is in front of them."
	},
	DoubleVekKill_Self = {
		"Swarm exterminated.",
		"Excellent. Truly excellent.",
		"The beasts are dead.",
		"Two Vek dead means two Vek unable to threathen lives."
	},
	DoubleVekKill_Obs = {
		"I admit, #main_full, I am rather impressed with your performance.",
		"Superb performance, #main_second.",
		"This contribution to the effort will be remembered, #main_second."
	},
	DoubleVekKill_Vek = {
		"The beasts cannot even distinguish between allies and enemies.",
		"Excellent. Pitting them against each other is a fine tactic.",
		"Ironically, that Vek has now likely saved more lives than it has taken."
	},
	Emerge_Detected = {
		"Vek attempts to surface have been detected.",
		"Vek incoming. Prepare for heavy conflict."
	},
	Emerge_Success = {
		"Vek attempt to surface successful. Don't let them near the cities.",
		"Another Vek detected on sensors.",
		"Stop the Vek. Use your mech as bait if you have to."
	},
	Emerge_FailedMech = {
		"I'm blocking this Vek's attempts to emerge.",
		"I'm preventing this Vek from surfacing. Hopefully the #self_mech can withstand until it stops trying.",
		"This Vek is attempting to surface. Not if I have anything to say on the matter."
	},
	Emerge_FailedVek = {
		"Excellent. The best way to prevent a Vek from surfacing is with another Vek.",
		"The beasts appear to care little what blocks their path when emerging."
	},
	BotKilled_Self = {
		"Machine destroyed.",
		"You lost your right to live when you threatened lives.",
		"I do not care what Zenith tells us, these things are a threat to civilians."
	},
	BotKilled_Obs = {
		"It was neccesary, #main_second.",
		"Good judgement, #main_second."
	},
	Mech_LowHealth = {
		"My Mech's hull is close to failing.",
		"I do not fear death.",
		"As useful as the #self_mech is, it can be repaired. If I go down, so be it."
	},
	Death_Main = {
		"I have a letter at HQ. Take care that it is delivered.",
		"I made an impact. Continue my legacy.",
		"I regret to inform #squad that my mech is failing. I will no longer be available to combat the Vek."
	},
	Death_Response = {
		"Your legacy will not be forgotten.",
		"You will be remembered, #main_second.",
		"Rest well, #main_full, you saved lives and that is not a feat to be taken lightly."
	},
	Death_Revived = {
		"Command, cancel the order on that letter.",
		"I am available to fight Vek once more.",
		"I will not be cowed by the threat of death. If I am to fight on the edge of oblivion, so be it."
	},
	Death_Response_AI = {
		"That unit is no longer available to fight Vek.",
		"That equipment is crucial. We cannot lose more."
	},


------------------------
-- Combat (Elemental) --
------------------------

	Vek_Drown = {
		"I've heard drowning is one of the most unpleasant ways to die.",
		"A fitting end for such a violent beast.",
		"Nature claims the beast, as it has every right to.",
		"Vek has been drowned."
	},
	Vek_Fall = {
		"We can seal that fissure after the battle, though I doubt the Vek survived the fall.",
		"The fall likely killed the Vek instantly. More merciful than it deserves.",
		"Nature claims the beast, as it has every right to.",
		"Vek has been buried."
	},
	Vek_Smoke = {
		"The Vek's been hit by a smokescreen. I doubt it can see through that, so don't worry about retaliation.",
		"I doubt such a beast can see through that haze.",
		"Vek has been smoked."
	},
	Vek_Frozen = {
		"Fascinating. That's quite a precipitious drop in temperature.",
		"The Vek's been frozen solid. Be careful, it can still be knocked into civilian structures.",
		"Vek has been frozen. Avoid freeing it."
	},
	Mech_Webbed = {
		"Vek's hit me with webs. At least it's not going after the cities.",
		"Beast has me tangled up.",
		"Servos have ceased action. I might require some assistance.",
		"I've been webbed. I'm attempting to break free as we speak."
	},
	Mech_Shielded = {
		"Pinnacle shield, activating.",
		"Shield has been activated.",
		"Shield technology, powering up."
	},
	Mech_ShieldDown = {
		"The shield has served its purpose.",
		"The shield's lost power. It did what it was intended to.",
		"Hull looks to be undamaged from the attack. It seems the shield took the hit."
	},
	Mech_Repaired = {
		"It has been quite some time since I had lessons on field repairs.",
		"I mended what I could.",
		"That will allow me to take another hit."
	},


--------------------
-- Combat (Level) --
--------------------

	Pilot_Level_Self = {
		"I'm unsure why an ambassador would require a military field promotion, but so be it.",
		"I have an inkling on how to improve my combat performance. It might require some testing."
	},
	Pilot_Level_Obs = {
		"Excellent work, #main_full, you deserve it.",
		"If this was peacetime, #main_second, I'd advocate you get a medal."
	},


--------------------------
-- Combat (Environment) --
--------------------------

	MntDestroyed_Self = {
		"Mountain demolished.",
		"Mountain cleared. These armaments are regretfully impressive."
	},
	MntDestroyed_Obs = {
		"Mountain demolished.",
		"Mountain cleared. Those armaments are regretfully impressive, #main_second."
	},
	MntDestroyed_Vek = {
		"It gives us more maunevering room, I suppose.",
		"The beasts cannot even distinguish between a foe and a pile of rubble."
	},
	Bldg_Destroyed_Self = {
		"...Please...",
		"I... I can't do this.",
		"That... can't have been me. It can't have.",
		"I... have become the very thing I was to destroy."
	},
	Bldg_Destroyed_Obs = {
		"#main_full! Do not, under any circumstances, kill civilians. You will become as bad as the beasts we fight.",
		"#main_full, if I have any say in the matter, after this conflict, you will be stripped of title, rank, and privelege.",
		"Stop! #main_second, I WILL put you down. Do NOT attack civilians.",
		"What do you think you're doing! STOP! Now!"
	},
	Bldg_Destroyed_Vek = {
		"Damnnit... I could've saved them...",
		"...You WILL pay for that, Vek.",
		"I'm sorry. I'm sorry. I should've done better. I could have saved you.",
		"...Fuck. All those lives..."
	},
	Bldg_Resisted = {
		"Oh thank god. The building took the hit.",
		"What a miracle... We're getting reports that everyone survived.",
		"Someone give a medal to the engineers that made that. They just saved lives.",
		"What a relief. I almost thought..."
	},
	PowerCritical = {
		"The grid is getting close to collapsing. We... can't let that happen.",
		"No! ... #squad, focus on maintaining the grid. If we fall, this world falls.",
		"The grid's failing on us. Do everything possible to prevent that from happening."
	},
	Gameover_Start = {
		"The grid... No... What?",
		"The grid is down. How do we fight... Think. Think.",
		"The grid's collapsing; my mech is stalled... What options do we have, Commander?"
	},
	Gameover_Response = {
		"I... We... No, Please.",
		"I can't... I can't do this again.",
		"We... Lost? We can't have lost. No. We can't."
	},


-------------------
-- Mech Upgrades --
-------------------

	Upgrade_PowerWeapon = {
		"Excellent.",
		"Armaments to fend off the beasts? Color me intruiged.",
		"This should prove useful.",
		"Powered and operational.",
		"To think an armament for a war machine might save so many lives..."
	},
	Upgrade_NoWeapon = {
		"As much as I like a challenge, I'd much prefer I enter the battlefield armed.",
		"...",
		"Is this really the wisest descision, Commander?"
	},
	Upgrade_PowerGeneric = {
		"Excellent.",
		"Just what the #self_mech required.",
		"This should provide a valuable edge.",
		"Modified and engaged.",
		"To think an upgrade to a war machine might save so many lives..."
	},


-----------------------
-- Mission (General) --
-----------------------

	MissionStart = {
		"Contact.",
		"Prioritize evacuation. Civilian lives are paramount.",
		"The mission is secondary. Nobody dies. That's final.",
		"#squad, engage Vek.",
		"Prepare your weapons. Vek emergence spotted."
	},
	Mission_ResetTurn = {
		"Activation of localized breach went through. Let's make of it the most we can.",
		"We need to recalculate. We can't make another mistake.",
		"#squad, remember the Vek's actions. They're quite predictable.",
		"Good call, Commander."
	},
	MissionEnd_Retreat = {
		"Sometimes conflict is neccessary. In this case, we saved hundreds of lives.",
		"A victory does not require annihilation. We saved lives, and that's what matters.",
		"I worry the beasts will return to threaten civilians again.",
		"The Vek are retreating. Excellent work, #squad."
	},
	MissionEnd_Dead = {
		"The Vek have been fully exterminated. Excellent work, #squad.",
		"Dispatch a scout to nearby cities. Make sure nobody was injured. That combat was quite heavy.",
		"As much as I have a distaste for war, exterminating vek that threaten civilians does bring a certain satisfaction.",
		"No traces of local Vek. We wiped them out."
	},
	PodIncoming = {
		"Curious. Aid from another timeline incoming.",
		"Tachyon emmisions are detected. Looks as if we're getting some help from another timeline.",
		"A Time Pod's been detected. Clear the landing zone of civilians."
	},
	PodResponse = {
		"Remember, the contents of the Pod are secondary. It contains at most a single life.",
		"The Pod's contents could prove useful, but don't let yourselves prioritize it. Civilians come first.",
		"If it doesn't endanger civilians, grab the Pod."
	},
	PodCollected_Self = {
		"Pod acquired. Focus on saving lives.",
		"I have the Pod.",
		"I've picked up the pod."
	},
	PodDestroyed_Obs = {
		"Pod's destroyed. Focus on saving lives.",
		"The Pod has been destroyed. Unfortunate.",
		"Hopefully nobody was inside the craft."
	},
	Secret_DeviceSeen_Mountain = {
		"It appears something was trapped within the mountain."
	},
	Secret_DeviceSeen_Ice = {
		"It appears something was trapped underneath the ice."
	},
	Secret_DeviceUsed = {
		"I am unsure what the device was, but it seems to have activated."
	},
	Secret_Arriving = {
		"An incoming craft has been detected. But it seems to be... unusual."
	},
	FTL_Found = {
		"Curious. The unusual craft has a just as unusual passenger."
	},
	Mission_Train_TrainStopped = {
		"The locomotive has been damaged. I'm receiving reports that the crew is still alive.",
		"The train has been derailed. If possible, we need to prevent any further damage."
	},
	Mission_Train_TrainDestroyed = {
		"The locomotive has been demolished. Unfortunately, I'm not receiving any reports of survivors.",
		"The crew's lives were lost in senseless war of a magnitude they could not fathom.",
		"The train has been destroyed. Focus your efforts on the Vek."
	},
	Mission_Block_Reminder = {
		"#squad, take care to stop the Vek from fully emerging.",
		"#squad, place objects on top of the emergence points. Ideally, more Vek.",
		"#squad, assure the vek do not reach the surface. Use your mech chassis if you have to."
	},


-----------------------
-- Mission (Archive) --
-----------------------

	Mission_Airstrike_Incoming = {
		"An antique bomber is flying by for an airstrike. Clear the targeted area.",
		"Air support incoming.",
		"Look out for the sky. We have an Archive bomber incoming."
	},
	Mission_Repair_Start = {
		"My Mech is in horrible condition. Are Archive mechanics not adequately fulfilling their duties?",
		"Are these Repair Platforms intended to make up for this horrific maintenance job?",
		"Our Mechs are in terrible condition, #squad, try to activate these Platforms."
	},
	Mission_Tanks_Activated = {
		"The antique tanks appear to be fully activated. I hope they can provide adequate firepower.",
		"The tanks appear to be running hot. Soldiers, fire at will.",
		"We appear to have a couple more mobile cannons at our disposal."
	},
	Mission_Tanks_PartialActivated = {
		"The intact antique tank appears to be fully activated. I hope it can provide adequate firepower.",
		"The remaining tank appears to be running hot. Soldier, fire at will.",
		"Though we lost one, it appears the surviving battle tank is at our disposal."
	},
	Mission_Dam_Reminder = {
		"The dam remains intact. If we can spare the firepower, it's an important target to demolish.",
		"Though the loss of power generation is regretful, the dam needs to be destroyed.",
		"I hate to demolish a relic of peacetime, but that dam needs to be destroyed."
	},
	Mission_Dam_Destroyed = {
		"Fascinating. The water pressure behind that dam must've been immense.",
		"I hope the civilians in the area can survive fine without the extra power generation.",
		"Quite an impressive geographical transformation. It serves as an excellent barrier against the Vek."
	},
	Mission_Satellite_Destroyed = {
		"One of the satellites has been destroyed. We need to prevent the same from happening to the second.",
		"A shame. It was a valuable tool for science and combating the Vek effort alike."
	},
	Mission_Satellite_Imminent = {
		"It appears the satellite is prepared to launch. Clear the area.",
		"Incoming rocket exhaust. Watch your positioning, #squad.",
		"If we can get the beasts near the launch site, it should prove quite deadly."
	},
	Mission_Satellite_Launch = {
		"The satellite has launched. Focus on protecting civilians.",
		"The satellite is in the air. Hopefully it will prove itself valuable.",
		"Launch sequence has finalized. Good work, #squad."
	},
	Mission_Mines_Vek = {
		"I worry such explosives will prove dangerous to the nearby populace.",
		"Excellent. The detonation took out the Vek.",
		"Better than fighting it with more conventional weaponry, I suppose."
	},


-------------------
-- Mission (RST) --
-------------------

	Mission_Terraform_Destroyed = {
		"Terraformer has been demolished. Regretful.",
		"That's a shame. It would have proven very valuable for environmental recovery.",
		"The terraforming platform has been demolished. Unfortunately, I'm not receiving any reports of survivors."
	},
	Mission_Terraform_Attacks = {
		"A shame to desecrate such fertile land, but the sacrifice was not in vain.",
		"An impressive technology, to say the least. The terrain is unrecognizable.",
		"If only we could equip the same technology on more mobile assets."
	},
	Mission_Cataclysm_Falling = {
		"The ground is rapidly shifting. Look out below.",
		"It appears we're fighting on unstable terrain. Watch your step, #squad.",
		"I'm getting spikes in seismic readings. Beware of localized earthquakes."
	},
	Mission_Lightning_Strike_Vek = {
		"Imagine the electrical energy required to instantly kill a creature that massive. Incredible.",
		"The Vek's been hit by the storm. Surprisingly, it appears to be down for good.",
		"Nature claims the beast, as it has every right to."
	},
	Mission_Solar_Destroyed = {
		"The local populace will suffer for the loss of power. Regrettable",
		"Solar farm has been demolished. At least it wasn't staffed."
	},
	Mission_Force_Reminder = {
		"An unbroken mountain range is a breeding ground for Vek. We need to take it down.",
		"The mountains remain intact. If we can spare the firepower, they're important targets to demolish.",
		"It may seem strange, but the mountains are high priority target."
	},
	Mission_Wind_Mech = {
		"A gale of wind forceful enough to move a machine the size of #self_mech?... Makes me glad RST is being terraformed.",
		"I suppose using wind to traverse ground was on my travel agenda.",
		"Does the Square-Cube Law mean nothing to this gust? How is it possibly shifting such an immense quantity of mass?"
	},


------------------------
-- Mission (Pinnacle) --
------------------------

	Mission_Freeze_Mines_Vek = {
		"Such a precipitious drop in temperature unleashed by a small device. Fascinating.",
		"I appreciate these devices. They're largely nonlethal, but they deal with the vek all the same.",
		"Vek's been frozen by the cryo-mine. Don't let it escape."
	},
	Mission_Factory_Destroyed = {
		"Though it was interfering with our efforts, the destruction of that fabricator is ultimately going to prove problematic.",
		"The damage to the factory has halted production. The local populace will suffer without a means of fabrication.",
		"The factory was in a fixable state. A shame we couldn't take advantage of that."
	},
	Mission_Factory_Spawning = {
		"The pace of production on these fabricators is frankly absurd.",
		"The factory is releasing a malfunctioning machine again. Divert fire before it activates.",
		"Imagine the value these factories could contribute to a prospering city."
	},
	Mission_Reactivation_Thawed = {
		"Localized temperatures are high enough for the local Vek to be actively thawing.",
		"It's difficult to tell whether the Vek are breaking out, the ice is thawing, or both.",
		"The Vek are breaking free. Divert fire."
	},
	Mission_Hacking_NewFriend = {
		"I struggle to call it an ally, but the hacked bot seems to now be under our control.",
		"The bot seems to be accepting our orders now. Let's hope it keeps doing so."
	},
	Mission_Shields_Down = {
		"The Shield Generator is down. Good. It was protecting us, but simultaneously guarding the beasts.",
		"I'm seeing coordinated shield failure. Likely for the best.",
		"The protective measures for ourselves were not worth the resilience granted to the beasts."
	},
	Mission_SnowStorm_FrozenVek = {
		"Imagine the ferocity of blizzard required to instantly freeze so much mass. Incredible.",
		"I suppose even the Vek can't fight back against a storm of that magnitude.",
		"That Vek's been frozen solid by the storm. Don't let it escape."
	},
	Mission_SnowStorm_FrozenMech = {
		"I've got ice locking up my systems. I can get free, but it will take time.",
		"In retrospect, I should've prioritized staying out of the cold front.",
		"Hopefully this ice can take a hit for me."
	},


------------------------
-- Mission (Detritus) --
------------------------

	Mission_Disposal_Destroyed = {
		"Disposal unit has been demolished. Regretful.",
		"I'm unsure how much value such a device would have provided long-term. Regardless, a shame.",
		"The disposal dump has been demolished. Unfortunately, I'm not receiving any reports of survivors."
	},
	Mission_Disposal_Activated = {
		"The speed which that A.C.I.D. dissoves the vek seems almost impossible.",
		"Stay clear of that A.C.I.D. pool. It melts the Vek, it'll melt you just fine.",
		"I wish the disposal unit had more precision. I question its efficacy for civilian use.",
		"If only we could equip the same technology on more mobile assets."
	},
	Mission_ACID_Storm_Start = {
		"I hate to question such an established conglomerate, but really, #corp? A machine to generate an acidic storm? Why?",
		"They manufactured a machine to generate an A.C.I.D. storm, and now they need it destroyed? What a surprise."
	},
	Mission_ACID_Storm_Clear = {
		"The absurd Storm Generator has been destroyed. Good riddance.",
		"I hope the surge of acidic material hasn't caused harm to local infrastructure."
	},
	Mission_Barrels_Destroyed = {
		"A.C.I.D. has been released. Hopefully it eats at subterranean Vek.",
		"The vat has been breached. Stay clear of the spill zone."
	},
	Mission_Power_Destroyed = {
		"The local populace will suffer for the loss of power. Regrettable.",
		"Power plant has been demolished. At least it wasn't staffed."
	},
	Mission_Teleporter_Mech = {
		"Instant translocation of mass. If you told me a decade ago I wouldn't believe you.",
		"I will remember the sacrifice of the previous Evelyn."
	},
	Mission_Belt_Mech = {
		"Reminds me of airport travelators.",
		"I'm surprised these belts are rated for weights so high."
	},


--------------------
-- Mission (Hive) --
--------------------

	MissionFinal_Start = {
		"We only have one chance at this. But if we succeed, billions of lives are saved.",
		"Deploying to final operation now.",
		"Stay vigilant, #squad, we cannot allow the Vek to halt our progress."
	},
	MissionFinal_StartResponse = {
		"Remote power pylons dropping in. Engage weapons.",
		"Pylons are dropping. Ready yourselves."
	},
	MissionFinal_FallResponse = {
		"A fissure is opening beneath us. Engage impact pistons. We're going in.",
		"The ground is breaking up. The hive is the target, #squad, don't forget that."
	},
	MissionFinal_Bomb = {
		"I regret to say this, Commander, but our current armaments are insufficient to demolish the hive. We need something bigger.",
		"This hive is massive. We need heavier weaponry to take it down."
	},
	MissionFinal_CaveStart = {
		"The bomb takes priority. If it's destroyed before it can detonate, this timeline is doomed."
	},
	MissionFinal_BombArmed = {
		"The bomb is armed. I sure hope it's capable of bringing down this hive.",
		"Tachyon emmisions from Renfield's device spiking. The detonation process has started."
	},
	TimeTravel_Win = {
		"The Vek have been defeated. It's time to engage another timeline.",
		"We won. We can win again.",
		"We've saved a world, but there's always more lives at stake. Let us depart."
	},


------------
-- Impact --
------------

	Mech_Heal = {
		"That will allow me to take another hit.",
		"Likely a better job than I could have accomplished manually.",
		"Hull's mending rapidly."
	},
	Mech_Boost = {
		"I'm spotting quite an abrupt spike in energy readings.",
		"Output projections in armaments at 154% and rising rapidly.",
		"My reactor is above safe thresholds, but I believe I'll be able to handle it.",
		"Weaponry potency spiking."
	},
	Mech_Supply = {
		"Supply caches kept on hand always seem to prove useful.",
		"Proper munition conservation can keep heavy armaments running much longer than one would expect.",
		"Armaments loaded.",
		"Munition banks filled.",
		"Supplies distributed and integrated.",
		"Reloading."
	},
	Mech_Deplete = {
		"I be able to scrounge up enough materiel for one more shot.",
		"#squad, cover me. I believe I can access a supply cache.",
		"My armaments are spent, though I might be able to solve that.",
		"Munition banks emptied."
	},
	Mech_SelfDamage = {
		"This armament is warping #self_mech's hull, though I have a handle on it.",
		"I suppose one may need an absurdly high weaponry output to combat the beasts.",
		"I'm reading significant stress warping due to armaments."
	}
}

--////////////////////////////////--
