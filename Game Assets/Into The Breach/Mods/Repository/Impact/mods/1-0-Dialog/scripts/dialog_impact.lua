--////////////////////////////////--
--//       Impact Dialogs       //--
--////////////////////////////////--

-- By WitheredPlate

return {

    --------------
    -- Template --
    --------------

    Template = {
        Mech_Heal = {
            -- This Pilot's Mech is Healed when below maximum health by a source other than a Repair skill. --
            -- 15% Chance. --
            -- Typically has 2-3 Lines. --
            "",
            ""
        },
        Mech_Boost = {
            -- This Pilot's Mech is Boosted when it was not previously. --
            -- 20% Chance. --
            -- Typically has 3-4 Lines. --
            "",
            "",
            ""
        },
        Mech_Supply = {
            -- This Pilot's Mech is successfully Supplied. --
            -- 30% Chance. --
            -- Typically has 2-3 Lines. --
            "",
            ""
        },
        Mech_Deplete = {
            -- This Pilot's Mech uses the last remaining use of a piece of equipment. --
            -- 50% Chance if it leaves the Mech with no uses on any piece of equipment. --
            -- Otherwise, 20% Chance if the depleted weapon had 2 or more maximum uses. --
            -- Otherwise, 10% Chance. --
            -- Typically has 2-3 Lines. --
            "",
            ""
        },
        Mech_SelfDamage = {
            -- This Pilot's Mech uses and is damaged by a self-damaging piece of equipment, but not dropped to or below 1 health. --
            -- 5% Chance. --
            -- Typically has 2-3 Lines. --
            "",
            ""
        }
    },


    ----------------
    -- Artificial --
    ----------------

    Artificial = {
        Mech_Heal = {
            "Update: Hull Mending",
            "Update: Mech Stabilizing"
        },
        Mech_Boost = {
            "Status: Weaponry potecy surging",
            "Status: Weaponry potecy at 125%"
        },
        Mech_Supply = {
            "Update: Munitions restored",
            "Status: Ammunition acquired"
        },
        Mech_Deplete = {
            "Warning: Munitions depleted",
            "Warning: Munitions capacity at 0%"
        },
        Mech_SelfDamage = {
            "Warning: Hull damaged by volatile weaponry",
            "Equipment: Caused chassis damage"
        }
    },


    -----------------
    -- Corporation --
    -----------------

    Archive = {
        Mech_Heal = {
            "Hull's getting mended.",
            "Hull restoration underway.",
            "My #self_mech's chassis is getting restored."
        },
        Mech_Boost = {
            "I'm reading a weaponry power surge. Let's put it to use.",
            "Theoretical payload rising... is this safe?",
            "My weapon readings are absurd - Off the charts."
        },
        Mech_Supply = {
            "I've got new ammunition loading here!",
            "Just like the Archive autoloaders.",
            "I've never even seen munitions this large."
        },
        Mech_Deplete = {
            "Munitions have dried up. Anyone got a refill?",
            "I'm out."
        },
        Mech_SelfDamage = {
            "Somebody really needs to cap the energy output on this thing!",
            "Weaponry this volatile would've never passed safety checks back in the day.",
            "The stress this is causing can't be worth it."
        }
    },

    Detritus = {
        Mech_Heal = {
            "The integrity of #self_mech's coming back.",
            "Hull's sealing.",
            "Readouts are stabilizing."
        },
        Mech_Boost = {
            "I've got a power spike here.",
            "Weapon potency's spiking. Let's handle this carefully.",
            "I hope I can deal with the output of this surge."
        },
        Mech_Supply = {
            "Out with the old, in with the new.",
            "Gotta keep ammo reserves topped.",
            "New ammo loaded up."
        },
        Mech_Deplete = {
            "I'm fresh out.",
            "Anyone got some spare ammo?",
            "Ammo's gone."
        },
        Mech_SelfDamage = {
            "This thing would not pass a safety inspection.",
            "Who thought weapons hazardous to their users was a good idea?",
            "Hull's been warped by stress."
        }
    },

    Pinnacle = {
        Mech_Heal = {
            "[ This unit is regaining hull composition ]",
            "[ Damage to Mech is being abated ]"
        },
        Mech_Boost = {
            "[ Outlier power readings detected ]",
            "[ Improvements to unit weapon potecy expected ]"
        },
        Mech_Supply = {
            "[ New materiel acquired ]",
            "[ Unit has regained future weapon functionality ]"
        },
        Mech_Deplete = {
            "[ Materiel depleted ]",
            "[ Unit has lost weapon functionality ]",
            "[ This unit is in need of a restock ]"
        },
        Mech_SelfDamage = {
            "[ Unit sustained damage from volatile weaponry ]",
            "[ Unit damaged by excessive output ]",
            "[ Weapon output excessive. Hull damage sustained ]"
        }
    },

    Rust = {
        Mech_Heal = {
            "Hull integrity rising.",
            "That'll let me take another hit",
            "That should keep me in the fight."
        },
        Mech_Boost = {
            "Weaponry power readings rising fast.",
            "Recalculating payload... the Vek better watch out.",
            "Love this power boost."
        },
        Mech_Supply = {
            "I'm cycling to fresh ammunition, commander.",
            "New munitions loaded.",
            "Fresh ammo... headed straight towards the Vek."
        },
        Mech_Deplete = {
            "Ammo reserves depleted.",
            "I'm dry on ammo here, commander.",
            "Ammunition well-spent."
        },
        Mech_SelfDamage = {
            "This is risky to use, but hopefully it's lethal to them.",
            "Extreme stress sustained. I can take it.",
            "That better be worth it."
        }
    },


    ------------
    -- Unique --
    ------------

    Aquatic = {
        Mech_Heal = {
            "Hull mending underway, though the work is sub-par",
            "An adequate hull reconstruction job.",
            "Acceptable repair work for a system other than my own."
        },
        Mech_Boost = {
            "This excessive power seems unnecessary, no?",
            "The risk posed by this power surge is far from worth its benefit.",
            "My power network is at a hazardous risk of shorting."
        },
        Mech_Supply = {
            "My available munitions supply has been expanded.",
            "My armaments are refilled, though that does not necessitate their use.",
            "I am pleased to report that my armaments have been reloaded."
        },
        Mech_Deplete = {
            "I am unfortunately lacking in munition supplies.",
            "The primary function of my armaments has been compromised.",
            "I regret to inform you all that my munition bays are emptied."
        },
        Mech_SelfDamage = {
            "This armament is not outfitted with proper safety measures.",
            "The hazardous design of this weapon causes me to question the mental stability of its creators.",
            "Engaging this weapon at this output is surely an unneccessary risk."
        }
    },

    Arrogant = {
        Mech_Heal = {
            "Get up #self_mech, you know I love you.",
            "No falling apart now, #self_mech.",
            "At least I didn't have to do it."
        },
        Mech_Boost = {
            "Yeah, go ahead and crank up the power. I've handled it a thousand times.",
            "Power rising.",
            "And right back up we go.",
            "This isn't new.",
            "One time this went wrong, actually. Sparks everywhere and third degree burns.",
            "Oh look, this surge is 7% stronger than the average power surge strength."
        },
        Mech_Supply = {
            "What was that saying? Fresh from the juice? I don't remember.",
            "Ammo coming in hot.",
            "Neat, more ammunition for slaughtering Vek."
        },
        Mech_Deplete = {
            "Welp. I'm out.",
            "That's everything I had.",
            "It always sucks when you run out of ammo, but I'll be fine."
        },
        Mech_SelfDamage = {
            "I remember this weapon. It's actually kind of fun.",
            "Hull's warping. I'm not worried yet.",
            "Do not go gentle into that good night, I guess."
        }
    },

    Assassin = {
        Mech_Heal = {
            "Unnecessary."
        },
        Mech_Boost = {
            "Even a razor can be honed.",
            "This will do well.",
            "You should fear me, Vek."
        },
        Mech_Supply = {
            "Even the deadliest armies must eat.",
            "Fuel for the fire."
        },
        Mech_Deplete = {
            "I see little use in a weapon so reliant a resource so limited.",
            "It wasn't needed."
        },
        Mech_SelfDamage = {
            "I share your pain, Vek, but not your weakness.",
            "Worth the pain.",
            "The pain only makes victory sweeter."
        }
    },

    Caretaker = {
        Mech_Heal = {
            "#self_mech just needed a bit of love.",
            "There you go, #self_mech!",
            "That buffed out just fine."
        },
        Mech_Boost = {
            "Power spiking, let #self_first take point!",
            "Don't worry about the reactor spike, kids! #self_first can handle it!",
            "Better! Stronger! I love it!"
        },
        Mech_Supply = {
            "I wish they would let me use these fabricators to bake some sweets!",
            "These munitions are huge!",
            "Chunk. Chunk. Chunk! Right into place. So satisfying!"
        },
        Mech_Deplete = {
            "I'm out, but #self_first's always got a backup!",
            "Don't worry about me darlings, I'll be fine without!"
        },
        Mech_SelfDamage = {
            "Ouch. I'm gonna need to patch that one up.",
            "This weapon kicks like a mule, but #self_first can handle it.",
            "You're a rowdy one, #self_mech, but #self_first loves you anyway."
        }
    },

    Chemical = {
        Mech_Heal = {
            "Hang in there, #self_mech. Just a little longer.",
            "At least it's not me doing the repairs.",
            "Cleaner than if I had done it.",
            "A little better than duct tape. Not quite up to nano-adhesive. Somewhere in the middle, I think."
        },
        Mech_Boost = {
            "I'm sure glad they let me outfit the cabin with radiation shielding.",
            "I should probably get a cancer spall scan after this.",
            "The comforting hum of machinery is turning into a bit more of a roar.",
            "I shouldn't comfortable with the way the reactor spikes when I boost it like this.",
            "Reactor surge.",
            "Biomass furnaces running on high.",
            "I don't like that this has become my thing. I really should know better than to tango with radiation."
        },
        Mech_Supply = {
            "Too bad command ordered me to stop modifying my ammunition. The gyro-rocket designs were promising.",
            "Nice. Extra ammunition coming in hot.",
            "Reloading... Ready!"
        },
        Mech_Deplete = {
            "Ah shit. I'm out.",
            "Fresh out here. Anyone got a refill?"
        },
        Mech_SelfDamage = {
            "Y'know... you have to realize someone made the concious decision to design this weapon like this.",
            "I am going to make myself a nuisance to whoever configured this weapon's output so high.",
            "My #self_mech is getting some hull warping!"
        }
    },

    Delusional = {
        Mech_Heal = {
            "Get me a sturdier Mech.",
            "I don't need the repairs."
        },
        Mech_Boost = {
            "My power only grows.",
            "This power is below me... but I shall accept it nonetheless.",
            "Father Time has granted me strength!"
        },
        Mech_Supply = {
            "Do you really believe I need this aid?",
            "The chosen one has no need for material posessions.",
            "Father Time grants me all I need to bring salvation. No more is needed."
        },
        Mech_Deplete = {
            "I have no need for weapons that cannot deal judgement unconditionally.",
            "This scrap proves its lack of worth yet again.",
            "This weapon is now useless"
        },
        Mech_SelfDamage = {
            "The chosen one can withstand any trial!",
            "Just like the Vek, this Mech is incapable of withstanding my power.",
            "A crude armament, but it will suffice."
        }
    },

    Genius = {
        Mech_Heal = {
            "I'm pretty sure the hull will stay intact now.",
            "Hull breaches are sealing.",
            "I hope that'll be good enough."
        },
        Mech_Boost = {
            "I'm getting power surge readings here!",
            "Hopefully this doesn't overload anything.",
            "This chassis can take the surge. I think."
        },
        Mech_Supply = {
            "Freshly-manufactured ammunition.",
            "Here's hoping to avoid any misfires.",
            "Fabricators running overtime here!"
        },
        Mech_Deplete = {
            "I've bottomed out my reserves!",
            "Does anyone have some spare ammunition?"
        },
        Mech_SelfDamage = {
            "Nnh! Surely someone can put a limiter on this weapon?",
            "I refuse to believe someone intentionally designed a weapon like this...",
            "My Mech can't deal with this stress!"
        }
    },

    Hotshot = {
        Mech_Heal = {
            "Glad I didn't have to do it.",
            "Niiice. I wish never had to fix this thing."
        },
        Mech_Boost = {
            "With this surge, the Vek stand no chance!",
            "Powered up! The rest of you try to keep up, okay?",
            "Power surge! The best? Just got better.",
            "Ohoho! We've got a power surge - nothing I can't handle."
        },
        Mech_Supply = {
            "Locked and Loaded!",
            "Fresh ammo - gotta make sure my Mech can keep up with me, after all.",
            "Ammo rolling in hot!"
        },
        Mech_Deplete = {
            "I can do without.",
            "Out of ammo. I guess my Mech couldn't keep up!"
        },
        Mech_SelfDamage = {
            "Hahaaaa! Love this weapon!",
            "Exaaactly my style. Dangerous and powerful!",
            "High output?! Sounds like fun to me!"
        }
    },

    Leader = {
        Mech_Heal = {
            "That'll hold for now.",
            "Sustained damage is abating.",
            "Hull's repaired. Time to get in there."
        },
        Mech_Boost = {
            "Power's spiked! Time to do some damage.",
            "Getting a power spike. Should be usable for offense tactics.",
            "Ready to provide some heavy firepower."
        },
        Mech_Supply = {
            "Ammunition cycled! Ready to tangle.",
            "New ammunition - crucial for sustained firepower."
        },
        Mech_Deplete = {
            "Ammunition depleted - switching tactics.",
            "My weaponry's out of ammo...",
            "Running dry was going to happen eventually..."
        },
        Mech_SelfDamage = {
            "This weapon's output is too much!",
            "Have to have a talk with maintenance crews about the stress caused by this weapon...",
            "Need to put in an order to lower the output of this weapon..."
        }
    },

    Medic = {
        Mech_Heal = {
            "That h-h-helped a bit.",
            "That should b-buy me some time.",
            "I w-wish I had the time to do p-p-proper safety checks."
        },
        Mech_Boost = {
            "C-Can #self_mech handle this p-power?",
            "...Is th-this much reactor power dangerous?",
            "I-I've seen n-nuclear reactors that g-generate less than this.",
            "I d-don't think #self_mech was built for this much p-power."
        },
        Mech_Supply = {
            "G-got supplies h-here.",
            "Redirecting materiel f-f-from the runoff b-banks.",
            "I h-h-hope this is enough f-for another shot.",
            "D-Distribution systems running o-o-overtime."
        },
        Mech_Deplete = {
            "I'm out of m-m-materiel!",
            "M-Munitions have been depleted!",
            "My fabricator b-b-banks are empty."
        },
        Mech_SelfDamage = {
            "M-My #self_mech d-d-doesn't have the stress capacity for this!",
            "Stress s-s-scaffolds are holding, b-but not for long!",
            "The i-impact's being absorbed, b-b-but not without damage."
        }
    },

    Miner = {
        Mech_Heal = {
            "#self_mech hull has been reinforced.",
            "Maintenance to #self_mech underway"
        },
        Mech_Boost = {
            "Environmental impact of current reactor output beyond safe threshold.",
            "Current energy production levels unauthorized."
        },
        Mech_Supply = {
            "Ammunition acquired.",
            "Munitions distribution in progress."
        },
        Mech_Deplete = {
            "Ammunition depleted.",
            "Logging depletion of munitions."
        },
        Mech_SelfDamage = {
            "Hull integrity depleted due to armament stress.",
            "Mech reinforcement structure failing."
        }
    },

    Original = {
        Mech_Heal = {
            "Hopefully, no risk of falling apart now.",
            "This machine'll hold together for a bit longer."
        },
        Mech_Boost = {
            "Weaponry readings spiking.",
            "Time to kill some bastards.",
            "The Vek are about to get it.",
            "Come get some."
        },
        Mech_Supply = {
            "New ammo rolling in.",
            "Got fresh ammo here.",
            "Vek got another thing coming."
        },
        Mech_Deplete = {
            "Don't sweat it, #squad. I can operate without.",
            "Used up.",
            "Each munition used means another munition downrange."
        },
        Mech_SelfDamage = {
            "Gah. Always hated the volatile ones.",
            "I wish weapons like this weren't as effective as they are.",
            "Taking stress damage here!"
        }
    },

    Recycler = {
        Mech_Heal = {
            "My Mech has been nourished.",
            "Mech sown with functioning components.",
            "My Mech has been adequately tended to."
        },
        Mech_Boost = {
            "Detecting enhancements to gardening implements.",
            "Logging temporary acceleration of Vekticide protocols.",
            "My Mech has been fertilized."
        },
        Mech_Supply = {
            "My Mech is becoming nutrient-rich.",
            "Ammunition reserves are ready for harvest.",
            "Harvested material has been recycled."
        },
        Mech_Deplete = {
            "Ammunition reserves have been fully harvested.",
            "I shall require ammunition for effective Vekticide efforts.",
            "My Mech is lacking in nutrient density."
        },
        Mech_SelfDamage = {
            "My Mech is undergoing abscission.",
            "Expected cladoptosis observed."
        }
    },

    Repairman = {
        Mech_Heal = {
            "I could've done it better manually.",
            "At least I'm not on a time crunch.",
            "Shoddy work."
        },
        Mech_Boost = {
            "Power levels rising above standardized capacities!",
            "This Mech shouldn't be able to circulate this much power - Best to output it quickly.",
            "I'm surprised this Mech's reactor can handle this..."
        },
        Mech_Supply = {
            "This fabrication technology uses hundreds of thousands of manipulators to produce munitions.",
            "Fresh munitions. Highest quality one can come by.",
            "These fabricators can be reconfigured to produce anything from power lines to shoelaces."
        },
        Mech_Deplete = {
            "Bottomed out! Need some new materiel.",
            "Reserves are dry. No runoff in the banks, either."
        },
        Mech_SelfDamage = {
            "Isn't it the Vek's job to make work for me?",
            "Safety limitations exist for a reason."
        }
    },

    Soldier = {
        Mech_Heal = {
            "Hull's mending - I'm still in the fight.",
            "My #self_mech is mending!",
            "Hull should last for now."
        },
        Mech_Boost = {
            "Reactor power surging.",
            "Commander, I'm getting abnormally high power readings.",
            "Power elevated but remaining stable."
        },
        Mech_Supply = {
            "Munitions primed, commander.",
            "Reloading complete.",
            "Munitions switched."
        },
        Mech_Deplete = {
            "I'm out, commander.",
            "Weapon needs a reload.",
            "I need some covering fire here!"
        },
        Mech_SelfDamage = {
            "This damn weapon's output is too high.",
            "Hull can't handle this stress!",
            "I'm struggling to manage the output on this thing, commander!"
        }
    },

    Warrior = {
        Mech_Heal = {
            "Malfunctioning components have been reeducated promptly.",
            "Treasonous components have been excised and replaced.",
            "Components unfit for battle have been discharged and replaced with fresh recruits.",
            "Components presenting sub-par performance have been dealt with."
        },
        Mech_Boost = {
            "My components are displaying improvements to performance.",
            "Combat efficacy temporarily improved.",
            "Unsafe power levels detected in multiple sub-systems.",
            "Current elevated power levels are not workplace compliant."
        },
        Mech_Supply = {
            "Armament ammuniton reserve refilled.",
            "Intaking new shipment of supplies.",
            "Workplace supply distribution in effect."
        },
        Mech_Deplete = {
            "Armament ammuniton reserve depleted.",
            "Ammunition reserves depleted. Appropriate discipline scheduled.",
            "Workplace supply distribution required."
        },
        Mech_SelfDamage = {
            "Armament sub-systems causing harm to other components.",
            "Armaments reaching unacceptable levels of output. Related systems will be disciplined.",
            "Multiple workplace safety doctrines in violation.",
            "Stress mitigation components will be honored for their bravery."
        }
    },

    Youth = {
        Mech_Heal = {
            "Up and at 'em!",
            "My #self_mech's feeling better!",
            "All Better, #self_mech?"
        },
        Mech_Boost = {
            "My #self_mech's ready to rumble!",
            "Ooo. Little #self_mech is feeling dangerous.",
            "Come at me, uglies!"
        },
        Mech_Supply = {
            "Eat up, #self_mech!",
            "I wonder if that tastes yummy!",
            "Just a quick snack!"
        },
        Mech_Deplete = {
            "Need some more snacks.",
            "#self_mech's a bit hungry."
        },
        Mech_SelfDamage = {
            "Ow! I wish we could be a little more careful!",
            "Ouch! That hurt #self_mech!"
        }
    },


    -----------
    -- Alien --
    -----------

    Mantis = {
        Mech_Heal = {
            "Ckt'kt, #self_reverse."
        },
        Mech_Boost = {
            "Jjk'ch'vk; K'tch!"
        },
        Mech_Supply = {
            "Jjk'kt."
        },
        Mech_Deplete = {
            "Kc'cht! Jjk'kt'cht?.."
        },
        Mech_SelfDamage = {
            "Kc'ccccht! TCH'K'TCH!"
        }
    },

    Rock = {
        Mech_Heal = {
            ":: HnnNH. ::"
        },
        Mech_Boost = {
            ":: HnnNH! Hn-hrnn. ::"
        },
        Mech_Supply = {
            ":: HnnrrnH. ::"
        },
        Mech_Deplete = {
            ":: ...nhrnn-Nr-Hnh... ::"
        },
        Mech_SelfDamage = {
            ":: Nnhrn-hrn. Hnh. ::"
        }
    },

    Zoltan = {
        Mech_Heal = {
            "/ -:.:- \\"
        },
        Mech_Boost = {
            "// ..---:: \\\\"
        },
        Mech_Supply = {
            "/ ..:::.- \\"
        },
        Mech_Deplete = {
            "| ::..:-- |"
        },
        Mech_SelfDamage = {
            "\\ ::*...*:** /"
        }
    }
}
