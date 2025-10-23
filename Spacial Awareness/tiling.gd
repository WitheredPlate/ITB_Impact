extends Node

enum {WHOLE,BROKEN,DESTROYED}
enum {RESISTANCE,VULNERABILITY,IMMUNITY,TEMPORARY,REGENERATIVE,THORNED,MECHANICAL,GENERATIVE,PRODUCTIVE,CONSUMPTIVE}
enum {IMPLANT,LATCH,BLAST,LINE,FORCE}
enum {PHYSICAL,BRUTALITY,HEAT,ELECTRICITY,SUFFOCATION,HEAL,REPAIR}
enum {SHIELD,SHIELD_SURGE}
enum {EMPTY,OPEN,SOLID}
enum {CONSTANT,STAGED,AMMUNITION,SEQUENCE_OVERLAY}
enum {LAUNCH_PROJECTILE,LAUNCH_ENTITY,MAINTAIN_SHIELD,GENERATE_POWER,GENERATE_POWER_BLOCK,GENERATE_OXYGEN,THRUST,RECOIL,COAST,SHIFT,DRIFT}
enum {FORWARDS,BACKWARDS,LEFT,RIGHT}

class system:
	var display:String
	var identifier:String
	var maximum_health:int
	var break_point:int
	var tiling:Array
	var pattern:Array
	var animation_data:Array
	var clip:Array
	var traits:Array
	var health:int
	var status:int
	func _init(
		temp_display:String,
		# "Name"
		temp_identifier:String,
		# "Identifier"
		temp_maximum_health:int,
		temp_break_point:int,
		temp_tiling:Array,
		# [Power Requirement, Coordinate Space: y*[x1`,x2`,...]]
		# ` uses EMPTY, OPEN, and SOLID
		temp_pattern:Array,
		# [Turn 1: [Pattern Effect 1: [Effect Type`, Effect Value 1, Effect Value 2, ...], Pattern Effect 2: [...], ...], Turn 2: [...], ...]
		# ` uses LAUNCH_PROJECTILE ("Projectile Identifier"), LAUNCH_ENTITY ("Entity Identifier"), MAINTAIN_SHIELD (Shield Type``, Shield Area, Value), GENERATE_POWER (Value), GENERATE_POWER_BLOCK (Block Size, Value), GENERATE_OXYGEN (Value), THRUST (Thrust Type```, Value), COAST (Value), SHIFT (Value), or DRIFT (Value)
		# `` uses SHIELD or SHIELD_SURGE
		# ``` uses FORWARDS, BACKWARDS, LEFT, or RIGHT
		temp_animation_data:Array,
		# [Animation Type`, Duration, Animation Trait 1: [Trait Type``, Trait Contents], Animation Trait 2: [...], ...]
		# ` uses CONSTANT or STAGED
		# `` uses AMMUNITION (Value) or SEQUENCE_OVERLAY ([List of Pattern Turns to Increment Sequence on])
		temp_clip:Array=[],
		# ["Ammunition Name",Slots]
		temp_traits:Array=[[IMMUNITY,HEAL],[IMMUNITY,BRUTALITY],[IMMUNITY,SUFFOCATION],[TEMPORARY,HEAT],[TEMPORARY,ELECTRICITY]],
		# [Trait 1: [Trait Type`, Trait Contents], Trait 2: [...], ...]
		# ` uses RESISTANCE (Damage Type, Value), VULNERABILITY (Damage Type, Value), IMMUNITY (Damage Type), TEMPORARY (Damage Type), REGENERATIVE (Value), THORNED (Value), MECHANICAL (Value), GENERATIVE (Value), PRODUCTIVE (Value), or CONSUMPTIVE (Value)
		temp_health:int=temp_maximum_health,
		temp_status:int=WHOLE
		# uses WHOLE, BROKEN, and DESTROYED
	):
		display=temp_display
		identifier=temp_identifier
		maximum_health=temp_maximum_health
		break_point=temp_break_point
		tiling=temp_tiling
		pattern=temp_pattern
		animation_data=temp_animation_data
		clip=temp_clip
		traits=temp_traits
		health=temp_health
		status=temp_status
	func health_change(value:int,type:int):
		var temp_value:int=value
		for x in traits:
			if x[0]==RESISTANCE:
				if x[1]==type:
					temp_value-=x[2]
			if x[0]==VULNERABILITY:
				if x[1]==type:
					temp_value-=x[2]
			if x[0]==IMMUNITY:
				if x[1]==type:
					temp_value=0
		if type==HEAL or type==REPAIR:
			temp_value*=-1
		health-=min(health,temp_value)
		if health<=0:
			health=0
			status=2
		elif health<=break_point:
			status=1
		else:
			status=0

class projectile:
	var display:String
	var identifier:String
	var duration:int
	var impact:Array
	var tiling:Array
	var maximum_health:int
	var systems:Array
	var clip:Array
	var traits:Array
	var health:int
	var status:int
	func _init(
		temp_display:String,
		# "Name"
		temp_identifier:String,
		# "Identifier"
		temp_duration:int,
		temp_impact:Array,
		# [[Damage Profile 1: [Damage Type', Damage], Damage Profile 2: [...], ...], Traits: [Trait 1: [Trait Type``, Trait Contents], Trait 2: [...], ...]]
		# ` uses PHYSICAL, BRUTALITY, HEAT, ELECTRICITY, SUFFOCATION, HEAL, SHIELD, or SHIELD_SURGE
		# `` uses IMPLANT (-), LATCH (Value), BLAST (Value), LINE (Value), or FORCE (Value)
		temp_tiling:Array=[],
		# [Power Requirement, Coordinate Space: y*[x1`,x2`,...]]
		# ` uses EMPTY, OPEN, and SOLID
		temp_maximum_health:int=9999,
		temp_systems:Array=[],
		# [System Identifier 1, System Identifier 2, ...]
		temp_clip:Array=[],
		# ["Ammunition Name",Slots]
		temp_traits:Array=[[IMMUNITY,HEAL],[IMMUNITY,BRUTALITY],[IMMUNITY,SUFFOCATION],[TEMPORARY,HEAT],[TEMPORARY,ELECTRICITY]],
		# [Trait 1: [Trait Type`, Trait Contents], Trait 2: [...], ...]
		# ` uses RESISTANCE (Damage Type, Value), VULNERABILITY (Damage Type, Value), IMMUNITY (Damage Type), TEMPORARY (Damage Type), REGENERATIVE (Value), THORNED (Value), MECHANICAL (Value), GENERATIVE (Value), PRODUCTIVE (Value), or CONSUMPTIVE (Value)
		temp_health:int=temp_maximum_health,
		temp_status:int=WHOLE
		# uses WHOLE, BROKEN, and DESTROYED
	):
		display=temp_display
		identifier=temp_identifier
		duration=temp_duration
		impact=temp_impact
		tiling=temp_tiling
		maximum_health=temp_maximum_health
		systems=temp_systems
		clip=temp_clip
		traits=temp_traits
		health=temp_health
		status=temp_status

var projectile_templates:=[
	projectile.new("Bullet","bullet",
	1,
	[[[PHYSICAL,1]]]),

	projectile.new("Revolving Bullet","bullet_revolving",
	1,
	[[[PHYSICAL,2]]]),

	projectile.new("Precision Slug","slug_precision",
	1,
	[[[PHYSICAL,3],[BRUTALITY,1]]]),

	projectile.new("Rail Slug","slug_rail",
	0,
	[[[PHYSICAL,8]],
	[FORCE,2]]),

	projectile.new("Shot","shot",
	2,
	[[[PHYSICAL,1]]]),

	projectile.new("Missile","missile",
	2,
	[[[PHYSICAL,1]],
	[[[BLAST,2]]]],
	[[SOLID]],
	1,
	["engine"]),

	projectile.new("Cluster Missile","missile_cluster",
	2,
	[[[PHYSICAL,1]],
	[[BLAST,4]]],
	[[SOLID],
	[SOLID]],
	3,
	["booster"]),

	projectile.new("Micro Missile","torpedo_micro",
	2,
	[[[PHYSICAL,2]]],
	[[SOLID]],
	1),

	projectile.new("Torpedo","torpedo",
	2,
	[[[PHYSICAL,6]]],
	[[SOLID],
	[SOLID],
	[SOLID]],
	2,
	["engine_rcs","engine_rcs_m"],[],
	[[RESISTANCE,PHYSICAL,1],
	[IMMUNITY,HEAL],[IMMUNITY,BRUTALITY],[IMMUNITY,SUFFOCATION],[TEMPORARY,HEAT],[TEMPORARY,ELECTRICITY]])
]

var system_templates:=[

	system.new("Rifle","rifle",4,1,[1,
	[SOLID]],
	[0,0,[[LAUNCH_PROJECTILE,"bullet_revolving"]]],
	[STAGED,3,[AMMUNITION,9]],
	["Bullet",1]),

	system.new("Dual Rifle","rifle_dual",8,2,[2,
	[SOLID,SOLID]],
	[0,0,[[LAUNCH_PROJECTILE,"bullet_revolving"],[COAST,1],[LAUNCH_PROJECTILE,"Revolving Bullet"]]],
	[STAGED,3,[AMMUNITION,18]],
	["Bullet",2]),

	system.new("Assault Rifle","rifle_assault",12,3,[3,
	[SOLID,SOLID],
	[SOLID,EMPTY]],
	[0,[[LAUNCH_PROJECTILE,"bullet_revolving"]],[[LAUNCH_PROJECTILE,"Revolving Bullet"]],[[LAUNCH_PROJECTILE,"Revolving Bullet"]]],
	[STAGED,4,[AMMUNITION,18],[SEQUENCE_OVERLAY,[2,3,4]]],
	["Bullet",2]),
	system.new("Assault Rifle","rifle_assault_m",12,3,[3,[SOLID,SOLID],[EMPTY,SOLID]],[0,[[LAUNCH_PROJECTILE,"bullet_revolving"]],[[LAUNCH_PROJECTILE,"Revolving Bullet"]],[[LAUNCH_PROJECTILE,"Revolving Bullet"]]],[STAGED,4,[AMMUNITION,18],[SEQUENCE_OVERLAY,[2,3,4]]],["Bullet",2]),

	system.new("Engine","engine",4,1,[1,
	[SOLID]],
	[0,[[THRUST,FORWARDS,1]]],
	[STAGED,2]),

	system.new("Booster","booster",8,2,[2,
	[SOLID],
	[SOLID]],
	[0,[[THRUST,FORWARDS,2]]],
	[STAGED,2]),

	system.new("RCS Engine","engine_rcs",4,1,[1,
	[SOLID]],
	[0,[[THRUST,RIGHT,1]]],
	[STAGED,2]),
	system.new("RCS Engine","engine_rcs_m",4,1,[1,[SOLID]],[0,[[THRUST,LEFT,1]]],[STAGED,2]),

	system.new("Generator","generator",8,2,[0,
	[SOLID,SOLID]],
	[[[GENERATE_POWER,4]]],
	[CONSTANT]),
	system.new("Generator","generator_t",8,2,[0,[SOLID],[SOLID]],[[[GENERATE_POWER,4]]],[CONSTANT]),
	
	system.new("Heavy Generator","generator_heavy",16,4,[0,
	[SOLID,SOLID],
	[SOLID,SOLID]],
	[[[GENERATE_POWER,8]]],
	[CONSTANT]),
	
	system.new("Micro Reactor","reactor_micro",4,1,[0,
	[SOLID]],
	[[[GENERATE_POWER_BLOCK,3,1]]],
	[CONSTANT]),
	
	system.new("Life Support","life_support",4,1,[1,
	[SOLID]],
	[[[GENERATE_OXYGEN,20]]],
	[CONSTANT]),

	system.new("Life Support Complex","life_support_complex",16,4,[4,
	[EMPTY,SOLID],
	[SOLID,SOLID],
	[SOLID,EMPTY]],
	[[[GENERATE_OXYGEN,100]]],
	[CONSTANT]),
	system.new("Life Support Complex","life_support_complex_t",16,4,[4,[SOLID,SOLID,EMPTY],[EMPTY,SOLID,SOLID]],[[[GENERATE_OXYGEN,100]]],[CONSTANT]),
	system.new("Life Support Complex","life_support_complex_m",16,4,[4,[SOLID,EMPTY],[SOLID,SOLID],[EMPTY,SOLID]],[[[GENERATE_OXYGEN,100]]],[CONSTANT]),
	system.new("Life Support Complex","life_support_complex_tm",16,4,[4,[EMPTY,SOLID,SOLID],[SOLID,SOLID,EMPTY]],[[[GENERATE_OXYGEN,100]]],[CONSTANT])
]
