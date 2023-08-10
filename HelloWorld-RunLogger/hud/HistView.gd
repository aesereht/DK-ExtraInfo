extends HudElement

#Load collector functions
var Collector = load("res://mods-unpacked/HelloWorld-RunLogger/logger/collector.gd").new()
var bestrun

func _ready():

	var runs = Collector.collectAllRuns()
	var bestscore
	
	for r in runs[Level.loadout.modeConfig.get(CONST.MODE_CONFIG_PRESTIGE_VARIANT, "")]:
		if not bestscore:
			bestscore = r["total_score"]
			bestrun = r
		else:
			if bestscore < r["total_score"]:
				bestrun = r
				
	# To get the highest value if starting contiue runs outside range
	if bestrun.has("cobalt_multi"):
		($"%Viewer" as Label).text = String(
		bestrun["cobalt_multi"][bestrun["cobalt_multi"].size()]+
		" x "+
		bestrun["iron_multi"][bestrun["iron_multi"].size()]
		)
	else:
		pass
	#For testing
	#print(bestrun)

func _process(delta: float) -> void:
	if bestrun.has("cobalt_multi") and bestrun["cobalt_multi"].size() > Data.of("monsters.cycle"):
		($"%Viewer" as Label).text = String(
		bestrun["cobalt_multi"][Data.of("monsters.cycle")]+
		" x "+
		bestrun["iron_multi"][Data.of("monsters.cycle")]
		)
	else:
		pass
  # do fallback
	
