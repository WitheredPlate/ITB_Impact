--////////////////////////////////--
--//         Background         //--
--////////////////////////////////--

--## Name: Averruncus (Formerly Marcus Thorn)
--## Sex: Male
--## Race: Mechanical (Formerly Human)
--## Age: 95
--## Job: Experimental Physicist, Cult Leader
--## Sponsor: Harmony Reclamation

--## Averruncus is the uploaded intelligence of Marcus Thorn, an infamous scientist and cult leader.
--## The mind uploading process was destructive, and killed Marcus in the process. He was aware of this consequence and willingly submitted to the procedure regardless.
--## Not all of Marcus Thorn's mind could be properly simulated, and portions were replaced by advanced artificial intelligence.
--## Before uploading, Marcus was a award-winning physicist that ran a highly secretive cult that worshipped the heat death of the universe.
--## Much of his cult's goal was simply to persist to observe as much of the process as possible. To that end, Marcus pursued various means of immortality.
--## Seamus Powell, Irene Powell's grandfather and the original discoverer of the Relics, was given an enormous sum of money to allow Marcus access to Relic technology, which was then used to perform the destructive brain scan.
--## From that point, Averruncus continued to manage his cult and kept his public presence as minimal as possible.
--## In the interest of being as close to immortality as possible, Averruncus has numerous remote bunkers dubbed "mind vaults" connected through wired connections that are capable of reproducing a copy of his mind and body. He must make contact with the network every half decade to update the state of the mind, or his body will be assumed destroyed or impotent and self-destruct if it isn't destroyed already and the network will print a new version. Nobody but Averruncus, who maintains the network himself, knows if this network has ever been engaged.
--## Averruncus maintains tenuous connections to Harmony Reclamation and has a mind vault on the island, where he was, performing maintenance, when the Vek outbreak began.

--////////////////////////////////--





--////////////////////////////////--
--//          Character         //--
--////////////////////////////////--

--## Averruncus speaks in a sophisticated manner and often switches between english and latin in conversation.
--## He believes himself immortal, and views any threat to his life as amusing.
--## He believes humanity to be a doomed species and regularly highlights human failures and imperfections, but will fight for their survival as a whole due to their usefulness as a resource network.
--## He views vek as an unintelligent but nevertheless fascinatingly resilient species.
--## He views most other machine life as highly flawed, but makes exceptions for certain extremely advanced intelligences such as Pinnacle or Archimedes.
--## Averruncus is not wholly as unfeeling as he would like to be due to his mind in large part being human. He will form bonds with other pilots he fights alongside, revel in their victories, and mourn their death, despite the fact that he makes a sizeable effort to hide these emotions.

--////////////////////////////////--





--////////////////////////////////--
--//            Lines           //--
--////////////////////////////////--

return {

----------------
-- Game Start --
----------------

	Gamestart = {
		"You are all blasphemous heathens, but saving you from the Vek incursion furthers my goals.",
		"Humanity, your inevitable demise shall be delayed. But make no mistake, this is not an act of charity. I expect generous compensation.",
		"The Vek incursion threatens to cause the destruction of humanity. Though not inherently problematic, it is premature. It must be halted."
	},
	Gamestart_PostVictory = {
		"It is a shame I must continue to serve as a savior of humanity. In another timeline, I would just as easily be an executioner.",
		"This timeline shall be drawn from the abyss, just as has been done before.",
		"Humanity, your virtues are minimal and your flaws many. But luckily for you, just as before, your continued existence serves my goals well."
	},


----------------------
-- Combat (General) --
----------------------

	VekKilled_Self = {
		"Vale in praesens, Vek.",
		"Death is silence. And for you, it is now.",
		"The Vek has been squashed.",
		"Vek, Non desideraberis.",
		"The Vek falls, as they always do."
	},
	VekKilled_Obs = {
		"Your performance is acceptable, #main_full.",
		"Spectaculum spei fallax, Vek.",
		"Not ideal, #main_full, but adequately done."
	},
	VekKilled_Vek = {
		"An amusing display of idiocy.",
		"Oblectans. The Vek prove their inferiority.",
		"An efficient use of resources."
	},
	DoubleVekKill_Self = {
		"The Vek fall, as they always do.",
		"Another swarm eradicated.",
		"Id quod sequitur timere debes, Vek.",
		"Your size does not elevate you above the status of vermin. Conteraris."
	},
	DoubleVekKill_Obs = {
		"Your contribution to the slaughter will be recorded, #main_full.",
		"An admirable display of violence, #main_full.",
		"Though I prefer to work alone, #main_full, I do not deny your sizeable contributions."
	},
	DoubleVekKill_Vek = {
		"In a perverse manner, your idiotic actions have made a sizeable contribution, Vek.",
		"A traitorous Vek, perhaps. Sed transfugae supplicio afficiendi sunt.",
		"Were the Vek not so uncontrollable, this display proves their theoretical use as bioweaponry."
	},
	Emerge_Detected = {
		"Vek are attempting to emerge from their nascent tunnels.",
		"Mild tremors detected. A common harbinger of emerging Vek."
	},
	Emerge_Success = {
		"And it rises.",
		"The Vek has arisen from the abyss.",
		"Ah. A new comedian has walked onto my stage.",
		"You may wish to reburrow, Vek. Quod deinde accidet, tibi non placebit."
	},
	Emerge_FailedMech = {
		"Your attempts to emerge amuse me, Vek.",
		"Your tunnel is blocked, imbecile.",
		"Were you more than common vermin, you might have the idea to simply burrow to another location.",
		"Non transibis."
	},
	Emerge_FailedVek = {
		"Using Vek as a tunnel obstruction. A fine tactic.",
		"Such a dim creature. Can't you see it's an ally that obstructs your path?"
	},
	BotKilled_Self = {
		"The foul algorithm has been terminated.",
		"The vile machine has been decomissioned.",
		"Faithless device halted. The world should enjoy the lack of it's fetid presence."
	},
	BotKilled_Obs = {
		"Adequate decomissioning job, #main_full.",
		"I appreciate the blow to heathenistic technology, #main_full."
	},
	Mech_LowHealth = {
		"You cannot kill me, Vek. You simply lack the means.",
		"For me, mors fieri non potest.",
		"My hull is failing, but pay it no mind. The destruction of #self_mech in no way means the same of my own.",
		"The hull stability of my shell is critical. An inconvenience at worst."
	},
	Death_Main = {
		"Ne erretis, redibo, vermes.",
		"The destruction of this shell is merely a minor setback.",
		"Mortem meam ne curaveris; mortem enim eiusque multa insignia superavi."
	},
	Death_Response = {
		"While your unfaithful life had little inherent value, I do not deny that the absence is felt.",
		"Bene vive in vita altera, #main_full. Honeste obiisti atque ad causam adiuvandam contulisti.",
		"Opera tua desiderabitur, #main_full."
	},
	Death_Response_AI = {
		"A regrettable loss.",
		"It appears #main_mech will be unable to aid us further in this fight."
	},
	Death_Revived = {
		"Vek, the schedule of your demise has been accelerated. Ante me metu sta.",
		"Redii. Perish.",
		"My rise from the abyss signals your fall into the same."
	},


------------------------
-- Combat (Elemental) --
------------------------

	Vek_Drown = {
		"A shameful weakness for a creature otherwise so resilient.",
		"Ungues maris clementiores sunt quam illi abyssi. Count yourself lucky, Vek.",
		"The Vek sinks.",
		"Mare alium sibi vindicat."
	},
	Vek_Fall = {
		"The Vek perished instantly. I would not be so merciful.",
		"Ab ipsa re, quam domum vocat, interfectum.",
		"And it falls."
	},
	Vek_Smoke = {
		"The Vek's been blinded. Clementius est non videre quae ventura sunt.",
		"A single sense lost should not hinder a perfected creature. Unfortunately for you, Vek, perfect you are not.",
		"Blinded. Had it complex thought, it would rely on its other senses."
	},
	Vek_Frozen = {
		"Entombed in frost.",
		"Gelu inclusus. I doubt the Vek has the strength to free itself.",
		"I admit, it's remarkable the Vek is resilient enough to survive unscathed despite the gelid temperatures."
	},
	Mech_Webbed = {
		"Vek, my freedom from your webbing is both inevitable and accompanies your demise.",
		"Haec retia me in aeternum tenere non possunt.",
		"I've been immobilized by webs. I doubt it will ultimately prove problematic.",
		"I'm caught in Vek webbing. Obex ad tempus tantum est."
	},
	Mech_Shielded = {
		"Raising pinnacle shielding.",
		"This shield serves no purpose to myself, though I won't say the same for #self_mech."
	},
	Mech_ShieldDown = {
		"Pinnacle shielding disengaged.",
		"My shield's been lost. Praesidiis non egeo.",
		"The loss of a single barrier brings me no closer to my demise."
	},
	Mech_Repaired = {
		"Though I am no stranger to manual maintenance, I would nonetheless prefer it be administered by someone more specialized.",
		"I've mended the hull of #self_mech. It should intact for a short while longer, at minimum.",
		"I've done what I can for #self_mech. Ad gradum immortalitatis meae perveniendum multo plura requirerentur.",
		"My hull has been mended to the best of this form's ability."
	},


--------------------
-- Combat (Level) --
--------------------

	Pilot_Level_Self = {
		"Though assuredly my performance needed no improvement, I've just properly hybridized a portion of my intelligence.",
		"Vis mea crescit. I severly doubt you heathens will be able to match.",
		"I should check the integrity of the Harmony vault. An error in my integration slipped through. Promptly squashed, of course."
	},
	Pilot_Level_Obs = {
		"You prove your worth, #main_full.",
		"Your performance will never rival my own, #main_full, but at least my allies fulfill a base level of competence."
	},


--------------------------
-- Combat (Environment) --
--------------------------

	MntDestroyed_Self = {
		"Mons deletus est.",
		"Terrain poses little oposition to the crude might of #self_mech.",
		"Mountain shattered."
	},
	MntDestroyed_Obs = {
		"Mons deletus est.",
		"Terrain has little to protect itself from the flailings of #main_mech.",
		"Mountain shattered."
	},
	MntDestroyed_Vek = {
		"Can the Vek not even distinguish between an inhabited building and inanimate terrain?",
		"The dim-witted Vek has shattered the mountain. Oblectans."
	},
	Bldg_Destroyed_Self = {
		"They stood in my way. Their deaths mean nothing.",
		"Nullius momenti es.",
		"The loss of grid is regrettable. The loss of life is not."
	},
	Bldg_Destroyed_Obs = {
		"Pay them no mind, #main_full. Their deaths are meaningless.",
		"Worry not, #main_full. Fecisti quod necesse erat."
	},
	Bldg_Destroyed_Vek = {
		"Keep the Vek from demolishing the grid, aut omnes moriemini.",
		"The grid is a valuable resource. We would do well to prevent the Vek from wasting it.",
		"The loss of life is easily manegable. The loss of grid is not."
	},
	Bldg_Resisted = {
		"The building held. Exemplum mirabilis firmitatis.",
		"Surprisingly, the building withstood the hit.",
		"Against all odds, the building has survived the Vek attack unscathed.",
		"In a showcase of deceptive resilience, the building remains undamaged."
	},
	PowerCritical = {
		"The grid has dropped to a critical level. Any further loss will result in a collapse.",
		"The power grid is nearing irreversible destruction. Omnes vitae praeter meam in discrimine versantur.",
		"Id quod nos sustinet morti proximum est. I suggest you all make an effort to prevent further grid damage."
	},
	Gameover_Start = {
		"The grid has collapsed. Factum infectum fieri non potest.",
		"The power grid has fallen. The humanity of this timeline is forefit."
	},
	Gameover_Response = {
		"Factum infectum facere non possumus. Open the Maw.",
		"I suppose another timeline's resources will have to do. The Maw awaits."
	},


-------------------
-- Mech Upgrades --
-------------------

	Upgrade_PowerWeapon = {
		"It will do.",
		"Telum bellicum.",
		"Have no doubt I will employ it to the fullest extent.",
		"There is a beauty in brutality.",
		"A weapon of war. It shall serve."
	},
	Upgrade_NoWeapon = {
		"You believe me incapable of wielding weaponry, heathen?",
		"Do you question my efficacy?",
		"Sine armis pugnare non possum.",
		"Where is your faith?"
	},
	Upgrade_PowerGeneric = {
		"A serviceable improvement.",
		"I appreciate the enhancement.",
		"Potestas mea est.",
		"I have no doubt I can make use of such an upgrade."
	},


-----------------------
-- Mission (General) --
-----------------------

	MissionStart = {
		"Your end has arrived, Vek. It is myself, if your dim minds could not comprehend such a statement.",
		"Into the fray we go.",
		"Damnum inferam victoriamque obtinebo."
	},
	Mission_ResetTurn = {
		"We have travelled through The Maw.",
		"Count yourselves lucky you were not consumed in the breach."
	},
	Mission_ResetTurn_Martyr = {
		"Invoco vires supernas, QUAE PLORANT, QUAE TORQUENTUR, QUAE LACERANT.",
		"Audi preces meas et postula, ATQUE MUNDUM DISCINDE.",
		"Proficiscere, atque INSANIUM pectoribus mentibusque multorum inimicorum meorum insere.",
		"Prex mea, et supplex et MINAX, tibi proponitur. FRANGE animos eorum quos ante me vides.",
		"Conice mentes bestiarum, quas per hunc mundum incedentes vides, in ABYSSUM inscientiae proice.",
		"COGITATIONES OMNIUM EORUM, qui mihi meisve cupiditatibus obsisterent, comminuam et dilacerabo."
	},
	MissionEnd_Retreat = {
		"And they flee. Ignavos.",
		"A display of cowardice on the part of the Vek. Finis eorum meritus erit.",
		"Only a poltronous fool does not finish a fight they started."
	},
	MissionEnd_Dead = {
		"The Vek have been slain. Hopefully they have learned their lesson.",
		"A superiore quodam penitus victus. Not an atypical happenstance for Vek.",
		"The Vek, of course, have been thoroughly slaughtered."
	},
	PodIncoming = {
		"A Time Pod has been detected cleaving the sky.",
		"A gift from the Maw. Iam descendens.",
		"A cleft in the atmosphere spotted. Likely a Time Pod."
	},
	PodResponse = {
		"Collection isn't crucial, but the technology could prove valuable.",
		"A gift from the Maw should seldom be ignored.",
		"Ars technica alterius temporis. We would do well to collect it."
	},
	PodCollected_Self = {
		"I've gathered the gift.",
		"Pod gathered.",
		"The Maw's gift has been secured."
	},
	PodDestroyed_Obs = {
		"The Pod is gone. Regrettable. Turn your mind elsewhere.",
		"Donum abiit. It matters not now."
	},
	Secret_DeviceSeen_Mountain = {
		"That mountain appears to have been containing an unusal device."
	},
	Secret_DeviceSeen_Ice = {
		"That ice sheet appears to have been containing an unusal device."
	},
	Secret_DeviceUsed = {
		"I've communed with the device. I'm not wholly confident of the consequence."
	},
	Secret_Arriving = {
		"Anomalous capsule descending. Respondent to the device, perhaps?"
	},
	FTL_Found = {
		"An alien lifeform. Quite the discovery. I admit, I'm quite curious to know more, though we share no language."
	},
	Mission_Train_TrainStopped = {
		"The train has been derailed. Damage is severe, but perhaps within the capabilities #corp to mend.",
		"Heavy damage dealt to the train. It's immobile, but likely recoverable."
	},
	Mission_Train_TrainDestroyed = {
		"There's very little remaining of the train. Animum alio converte.",
		"The train is a lost cause. Focus on other objectives."
	},
	Mission_Block_Reminder = {
		"The Vek's rise remains unimpeded. We would be wise to change that.",
		"The Vek continue to surface uncontested. Without our interference, the consequences will make themselves known.",
		"Recall, we've been directed to impede Vek Emergence. Id praecipuum facito, infidels."
	},


-----------------------
-- Mission (Archive) --
-----------------------

	Mission_Airstrike_Incoming = {
		"The Archive bombing craft is coming around for a run. Clear the area or face the consequences.",
		"Stay out of the bombing zone, heathens."
	},
	Mission_Repair_Start = {
		"Remarkable. Our Mechs appear to somehow be in worse condition than we left them.",
		"#corp, do I need to have a word about quality of the repairs we're receiving?"
	},
	Mission_Tanks_Activated = {
		"I almost wish we hadn't the aid of these faithless machines, but both Old Earth tanks are online.",
		"Both vile machines have risen. I have little faith they will prove valuable."
	},
	Mission_Tanks_PartialActivated = {
		"I almost wish we hadn't the aid of this faithless machine, but an Old Earth tank is online.",
		"A single tank has risen. Likely as much help as both, aut neuter, would have been."
	},
	Mission_Dam_Reminder = {
		"#squad, the dam remains intact. Its destruction will impede Vek burrows.",
		"Murus aquarius integer est. I suggest you heathens make its destruction a priority.",
		"If that dam doesn't fall, Vek burrows could prove a threat to the grid structures in this area."
	},
	Mission_Dam_Destroyed = {
		"Ira oceani soluta est.",
		"I suppose we've just formed a new river. A novel thought."
	},
	Mission_Satellite_Destroyed = {
		"We've just lost a rocket. Unfortunate.",
		"A satellite has been shattered. Caelos non iam scrutabitur."
	},
	Mission_Satellite_Imminent = {
		"The rocket is preparing for takeoff. You infidels would do well to clear the area promptly.",
		"Satellite launch sequence priming. Flammae te in scoriam liquefacient.",
		"The device appears to be ready to rend the sky."
	},
	Mission_Satellite_Launch = {
		"Satellite launch successful. Procede et caelum discinde.",
		"The rocket has arisen. It is crude, but nevertheless a remarkable display."
	},
	Mission_Mines_Vek = {
		"Dim Vek. Even a wild animal knows to avoid an obvious trap.",
		"The mines are crude, but they obviously perform adequately.",
		"It's amusing to me that #corp mines don't even need to be concealed. The Vek are simply that unintelligent."
	},


-------------------
-- Mission (RST) --
-------------------

	Mission_Terraform_Destroyed = {
		"Regrettably, the world-shaping device has been demolished.",
		"A shame. Numquam posthac vim eius trementem sentiemus."
	},
	Mission_Terraform_Attacks = {
		"Finally, an armament worthy of my respect. If only it could be mobilized.",
		"Impressive. Even the shape of the world itself is subject to the whims of this technology.",
		"Spectaculum magnificum. My complements to the #corp operators and engineers."
	},
	Mission_Cataclysm_Falling = {
		"The earth makes an effort to claim us. Watch your step, heathens.",
		"Terra in abyssum cadit. Move, or be subject to the wrath of the earth.",
		"This ground is remarkably unstable. Take care in where you step... Or fall, it makes little difference to me."
	},
	Mission_Lightning_Strike_Vek = {
		"Fulmine percussus. They say it never happens twice. Of course, they're right, because you're dead.",
		"The Vek is incinerated by the sky.",
		"I'm hardly surprised the Vek lack the intelligence to avoid obvious, massive storm fronts."
	},
	Mission_Solar_Destroyed = {
		"The solar farm has been shattered. The power it could provide would have been valuable, but what's done is done.",
		"Devorator solis deletus est. Turn your mind elsewhere."
	},
	Mission_Force_Reminder = {
		"The mountain ranges remain standing. Their destruction should be forefront in your minds, infidels.",
		"The earthen spires yet stand. Suadeo ut id corrigas, #squad.",
		"The Vek make nests within these mountains. They could return to threaten the grid."
	},
	Mission_Wind_Mech = {
		"Vento translatus sum.",
		"I've been displaced. I suppose only the sky is responsible."
	},


------------------------
-- Mission (Pinnacle) --
------------------------

	Mission_Freeze_Mines_Vek = {
		"Dim Vek. Even a wild animal knows to avoid an obvious snare.",
		"These glacial mines are mildly impressive. Their performance is obviously adeqaute.",
		"It's amusing to me that #corp mines don't even need to be concealed. The Vek are simply that unintelligent."
	},
	Mission_Factory_Destroyed = {
		"Good. That fabricator was simply an obstacle.",
		"I have no doubt #ceo_full will feel differently, but the destruction of that vile fabricator was a favor."
	},
	Mission_Factory_Spawning = {
		"This revolting factory refuses to calm.",
		"The vile factory continues to fabricate opposition.",
		"Fabricator munere fungi pergit. I suggest its immediate destruction."
	},
	Mission_Reactivation_Thawed = {
		"The Vek's biology proves its resilience. They break free of their glacial tombs.",
		"It appears our foes have the strength to free themselves of the ice."
	},
	Mission_Hacking_NewFriend = {
		"This vile machine is claiming to be our ally. I would much prefer that that not be the case.",
		"I refuse to call this machine an ally. You will have difficulty preventing me from dismantling it after this battle.",
		"This algorithim is making contact, claiming to have changed its alliegance. I have my doubts."
	},
	Mission_Shields_Down = {
		"The shield was not a required protection anyhow.",
		"Vek, you are now vulnerable. Infirmitatem tuam non habeo."
	},
	Mission_SnowStorm_FrozenVek = {
		"Entombed in frost.",
		"Gelu inclusus. I doubt the Vek has the strength to free itself.",
		"The gelid storm has claimed another."
	},
	Mission_SnowStorm_FrozenMech = {
		"I've been immobilized by the storm. I can free myself in time.",
		"Tempestas praesentiam suam manifestat. Assistance is unnecessary."
	},


------------------------
-- Mission (Detritus) --
------------------------

	Mission_Disposal_Destroyed = {
		"Regrettably, the wrathful device has been demolished.",
		"A shame. Numquam posthac eius iram acriorem sentiemus."
	},
	Mission_Disposal_Activated = {
		"Finally, an armament worthy of my respect. If only it could be mobilized.",
		"Impressive. This technology could dissolve even the toughest of foes in an instant.",
		"Spectaculum magnificum. My complements to the #corp operators and engineers."
	},
	Mission_ACID_Storm_Start = {
		"The malfunction of the Storm Generator may be to our advantage. It corrodes without distinction.",
		"The Storm Generator certainly makes things more interesting. It must be destroyed, but said destruction need not be immediate."
	},
	Mission_ACID_Storm_Clear = {
		"The storm weaver's been destroyed. It's almost a shame.",
		"The destruction of the Storm Generator is mildly regretful. If nothing else, it was fascinating technology."
	},
	Mission_Barrels_Destroyed = {
		"The acid consumes all that resides below.",
		"An unparalleled level of corrosion. Certainly an impressive chemical.",
		"In cuniculis vestris ardete, Vek."
	},
	Mission_Power_Destroyed = {
		"The power plant has been razed. The energy it could provide would have been valuable, but what's done is done.",
		"Custos fulminis deletus est. Turn your mind elsewhere."
	},
	Mission_Teleporter_Mech = {
		"Instant mass translocation. #corp, you have outdone yourself.",
		"#corp, could I speak to the Teleporter Pad engineers? I'd like to compare notes."
	},
	Mission_Belt_Mech = {
		"I have been shifted.",
		"I've been conveyed."
	},


--------------------
-- Mission (Hive) --
--------------------

	MissionFinal_Start = {
		"While each Vek is an unintelligent individual, it's inarguably impressive what they can accomplish.",
		"Do try to avoid your demise, #squad. I've already mapped some resources I'd like to harvest and it would be a shame to have to repeat the process.",
		"We're here. Our final battle commences."
	},
	MissionFinal_StartResponse = {
		"Pylons cleaving the sky.",
		"Pylons incoming. Their trajectory is accurate enough."
	},
	MissionFinal_FallResponse = {
		"The earth means to claim us. I see little alternative."
	},
	MissionFinal_Bomb = {
		"Quite an impressive hive. Unfortunately, I doubt my ability to demolish it with the armaments provided.",
		"The hive is quite a sight. I severely doubt we have the resources to make it fall."
	},
	MissionFinal_CaveStart = {
		"The bomb is our first priority, heathens.",
		"Ensure the bomb survives. Your insiginificant lives pale in the face of its importance."
	},
	MissionFinal_BombArmed = {
		"The bomb appears to be ready to fulfill its purpose."
	},
	TimeTravel_Win = {
		"I admit. I am surprised by your performance, #squad. I'll make sure to extend an invitation if I see you again.",
		"This timeline is soon to be clear of Vek. Make no mistake, Redibo.",
		"I am your savior. I will be back, et exspecto ut mundus ante me genua flectat."
	},


------------
-- Impact --
------------

	Mech_Heal = {
		"#self_mech's hull is regaining composition.",
		"Automated maintenance underway.",
		"#self_mech has regained significant fortitude. Ad gradum immortalitatis meae perveniendum multo plura requirerentur."
	},
	Mech_Boost = {
		"Vek, your demise is imminent.",
		"Ah, a power surge. Had I a mouth, this would bring a smile to my face.",
		"My reactor is rapidly surging. I have no doubt in my ability to harness it.",
		"Potestas modum rationabilem excedens, in manu mea sita."
	},
	Mech_Supply = {
		"Ammunition reserves have been fed.",
		"#self_mech hungers. Fortuna bona, pastum est.",
		"Ammunition routed and loaded."
	},
	Mech_Deplete = {
		"My weaponry has been depleted. Supplies would be timely but not crucial.",
		"I can function adequately without, but my armaments have failed me."
	},
	Mech_SelfDamage = {
		"What's the point of immortality if you don't take advantage of it?",
		"A weapon of war, no matter how volatile, can be wielded.",
		"#self_mech is sustaining stress damage. Res paulo excitantiores reddimus."
	}
}

--////////////////////////////////--
