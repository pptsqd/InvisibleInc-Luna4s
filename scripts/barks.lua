local simdefs = include("sim/simdefs")

local T_EVENT = rawget(simdefs,"TA_EVENT_TABLE") and simdefs.TA_EVENT_TABLE.EVENTS or {
	ATTACK_GUN = 8,			-- EV_UNIT_START_SHOOTING
	ATTACK_MELEE = 30,		-- EV_UNIT_MELEE

	GOT_HIT = 57,			-- EV_UNIT_HIT, not trigger on Last Words
	REVIVED = 102,			-- EV_UNIT_HEAL
	HIJACK = 19,			-- EV_UNIT_USECOMP also EV_UNIT_WIRELESS_SCAN for Internationale's wireless hijack got sent here
	INTERRUPTED = 4,		-- EV_UNIT_INTERRUPTED
	PEEK = 18,				-- EV_UNIT_PEEK
	OVERWATCH = 27,			-- EV_UNIT_OVERWATCH
	OVERWATCH_MELEE = 28,	-- EV_UNIT_OVERWATCH_MELEE
	PIN = 111,				-- EV_UNIT_START_PIN -- unused in game --Not anymore -- added by Cyberboy2000 :)

	UNTIE = 36,				-- EV_UNIT_UNTIE
	SAFE_LOOTED = 66,		-- TRG_SAFE_LOOTED -- there's trigger used
	INSTALL_AUGMENT = 62,
	DISGUISE_IN = 129,		-- for Prism's disguise
	CLOAK_IN = 614,			-- for activating cloak

	WIRELESS_SCAN = 100,	-- solely for Wireless Emitter Nerf mod, won't trigger normally

	ATTACK_GUN_KO = 1008,	-- for dartguns
	MEDGEL = 1009,			-- for using medgel on a downed agent
	SHOOT_CAMERA = 1010,
	SHOOT_DRONE = 1011,

	PARALYZER = 1012,		-- Banks have test line
	STIM_SELF = 1013,		-- Rush have test line		-- I just put some placeholders to test. Shirsh
	STIM_OTHER = 1014,		-- Shalem have test line
	SELF_STIMMED = 1015,	-- Rush have test line
	STIMMED_BY = 1016,		-- Rush have test line
	WAKE_OTHER = 1017,		-- Rush have test line
	AWAKENED_BY = 1018,		-- Shalem have test line

	EXEC_TERMINAL_LOOTED = 1019,	-- optional for Exec Terminals
	THREAT_DEVICE_LOOTED = 1020,	-- optional for looting FTM devices with tech (scanner and router)

	RESCUER = 1021,		-- agent who opens detention cell
	BAD_ESCAPE = 1022,	-- Exit teleporter comments
	GOOD_ESCAPE = 1023,
	BLOODY_MISSION = 1024,
	ABANDONING_OTHER = 1025,
	SET_SHOCKTRAP = 1026,
	SAVED_FROM_OW = 2001, -- saved from guard, both currently unused
	AGENT_DEATH = 1027,
	OW_INTERVENTION = 1028, -- save someone from a guard who's on OW
	EVENT_SELECTED = "TA_SELECTED", --now used! fires once per mission per agent
	EV_RESELECTED = "TA_RESELECTED", -- on selected, but used instead of above after rewinding
	SURRENDER = "TA_SURRENDER", --for "surrender" ability from New Corporate Tactics. unused simdefs.TRG_LAST_WORDS
}
local T_PROB = rawget(simdefs,"TA_EVENT_TABLE") and simdefs.TA_EVENT_TABLE.PROBS or {
	p_selected = 1,
	p_gun = 0.7,
	p_gunko = 0.7,
	p_melee = 0.6,
	p_ow = 0.6,
	p_gothit = 0.7,
	p_revived = 0.8,
	p_scan = 0.5,
	p_hj = 0.2,
	p_loot = 0.5,
	p_inter = 0.5,
	p_peek = 0.05,
	p_pin = 0.5,
	p_augm = 0.9,
	p_cloak = 0.8,
	p_medgel = 0.8,
	p_rescuer = 0.8, --0.5
	p_shootcam = 0.7,
	p_shootdrone = 0.7,
	p_badescape = 1, -- 0.9
	p_goodescape = 1,
	p_bloodymission = 1,
	p_abandonedother = 1,
	p_setshocktrap = 0.8,
	p_savefromow = 0.9,
	p_ow_saved = 1, --0.8 --unused
	p_agentdeath = 0.9,
	p_surrender = 1,
	p_hostage_rescue = 1,
}
local _M = {
	GENERIC = "type_guard",
	GENERIC_HUNTING = "type_guard_alerted",
	CFO = "type_cfo",
	SYSADMIN = "type_sysadmin",
	SCIENTIST = "type_scientist",
	DRONE = "type_combatdrone",
	CIVILIAN_FLEE = "type_civilian_flee",
	SEEN_GOOSE = "type_seenGoose",
	SEEN_GOOSE_R = "type_seenFancyGoose",
}

local LUNA4S = {} ------------------------------------------------------------------------------------------

-- LUNA4S[T_EVENT.EVENT_SELECTED] = {T_PROB.p_selected, {
-- }}
-- LUNA4S[T_EVENT.ATTACK_GUN] = {T_PROB.p_gun, {
-- }}
-- LUNA4S[T_EVENT.SHOOT_DRONE] = nil
-- LUNA4S[T_EVENT.SHOOT_CAMERA] = nil
-- LUNA4S[T_EVENT.ATTACK_GUN_KO] = {T_PROB.p_gunko, {
-- }}
LUNA4S[T_EVENT.ATTACK_MELEE] = {T_PROB.p_melee / 2, { -- div 2 due to lack of variety
	"Not cute!",
	"Nuh uh!",
}}
-- LUNA4S[T_EVENT.OVERWATCH] = {T_PROB.p_ow, {
-- }}
-- LUNA4S[T_EVENT.OVERWATCH_MELEE] = {T_PROB.p_ow, {
-- }}

LUNA4S[T_EVENT.GOT_HIT] = {T_PROB.p_gothit, {
	"You jerk-",
	"Hoot!",
}}
-- LUNA4S[T_EVENT.REVIVED] = {T_PROB.p_revived, {
-- }}
-- LUNA4S[T_EVENT.HIJACK] = {T_PROB.p_hj / 2, { -- div 2 due to lack of variety
-- 	"I keep getting the Endians wrong.", -- picross
-- }}
-- LUNA4S[T_EVENT.SAFE_LOOTED] = {T_PROB.p_loot, {
-- }}
-- LUNA4S[T_EVENT.EXEC_TERMINAL_LOOTED] = nil
-- LUNA4S[T_EVENT.THREAT_DEVICE_LOOTED] = nil

-- LUNA4S[T_EVENT.INTERRUPTED] = {T_PROB.p_inter, {
-- }}
-- LUNA4S[T_EVENT.PEEK] = {T_PROB.p_peek, {
-- }}

-- LUNA4S[T_EVENT.PIN] = {T_PROB.p_pin, {
-- }}
-- LUNA4S[T_EVENT.INSTALL_AUGMENT] = {T_PROB.p_augm, {
-- }}
-- LUNA4S[T_EVENT.DISGUISE_IN] = nil
-- LUNA4S[T_EVENT.CLOAK_IN] = {math.min(T_PROB.p_cloak, .6), {
-- }}
-- LUNA4S[T_EVENT.MEDGEL] = {T_PROB.p_medgel, {
-- }}
-- LUNA4S[T_EVENT.WAKE_OTHER] = nil
-- LUNA4S[T_EVENT.UNTIE] = {T_PROB.p_hostage_rescue, {
-- }}

-- LUNA4S[T_EVENT.PARALYZER] = nil
-- LUNA4S[T_EVENT.STIM_SELF] = nil
-- LUNA4S[T_EVENT.STIM_OTHER] = nil
-- LUNA4S[T_EVENT.SELF_STIMMED] = nil
-- LUNA4S[T_EVENT.STIMMED_BY] = nil
-- LUNA4S[T_EVENT.AWAKENED_BY] = nil
-- LUNA4S[T_EVENT.RESCUER] = {T_PROB.p_rescuer, {
-- }}
-- LUNA4S[T_EVENT.BAD_ESCAPE] = {T_PROB.p_badescape, {
-- }}
-- LUNA4S[T_EVENT.GOOD_ESCAPE] = {T_PROB.p_goodescape, {
-- }}
-- LUNA4S[T_EVENT.BLOODY_MISSION] = {T_PROB.p_bloodymission, {
-- }}
-- LUNA4S[T_EVENT.ABANDONING_OTHER] = {T_PROB.p_abandonedother, {
-- }}
-- LUNA4S[T_EVENT.OW_INTERVENTION] = {T_PROB.p_savefromow, {
-- }}
-- LUNA4S[T_EVENT.SAVED_FROM_OW] = nil
-- LUNA4S[T_EVENT.AGENT_DEATH] = {T_PROB.p_agentdeath, {
-- }}
-- LUNA4S[T_EVENT.SURRENDER] = {T_PROB.p_surrender, {
-- }}


local GUARDS = {LINES = {}} ------------------------------------------------------------------------------------------

GUARDS.LINES[_M.GENERIC] = { 
	"I hope she goes overtime. Maybe I'll catch the tail end after my shift.",
	"Wait, do owls have ears?",
	"Time for a Health Check! Too bad I left my water.",
	"I wonder if streaming pays well."
}
GUARDS.LINES[_M.GENERIC_HUNTING] = { 
	"Don't fall for the cute one!",
	"Careful, I heard there's a pirate here!",
}
GUARDS.LINES[_M.CFO] = { 
	"Yes, hello, I need priority support for Live3D…",
	"\"Easier than holorig\", they said. Doesn't feel easy.",
}
GUARDS.LINES[_M.SCIENTIST] = { 
	"I could be at the forefront of motion capture right now…",
}
GUARDS.BANTERS = {
	{
		"I am irrevocably cute.",
		"Ha, it's official!",
	},
	{
		"Do you ever wonder if one of us is secretly a big holotuber?",
		"That'd be an \"unacceptable risk\" according to our NDA.",
		"Relax! It's just a wishful fantasy."
	},
	{
		"<sigh> Why do people stream on weekdays?",
		"Because then creeps like you don't bother her.",
		"For the twentieth time, we're calling her \"cute\" as a running gag!"
	},
	{
		"I have SO much homework to do.",
		"Who's giving you homework?",
		"Oh, it's this puzzle game i've been playing..."
	},
}
GUARDS.BANTERS_HUNTING = {
}


return {
	LUNA4S = LUNA4S,
	GUARDS = GUARDS
}
