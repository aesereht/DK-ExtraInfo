extends HudElement

var Collector = load("res://mods-unpacked/HelloWorld-RunLogger/logger/collector.gd").new()
var bestrun

func _ready():
	#Loads although it is uning ingex name instead of runs
	var runs = Collector.collectAllRuns()
	var bestscore
	
	for r in runs[Level.loadout.modeConfig.get(CONST.MODE_CONFIG_PRESTIGE_VARIANT, "")]:
		if not bestscore:
			bestscore = r["total_score"]
			bestrun = r
		else:
			if bestscore < r["total_score"]:
				bestrun = r
	print(bestrun)

func _process(delta: float) -> void:
	print(bestrun.has("cobalt_multi"))
	print(bestrun["cobalt_multi"].size())
	print(Data.of("monsters.cycle"))
	if bestrun.has("cobalt_multi") and bestrun["cobalt_multi"].size() > Data.of("monsters.cycle"):
		($"%Viewer" as Label).text = String(
		bestrun["cobalt_multi"][Data.of("monsters.cycle")]+
		" x "+
		bestrun["iron_multi"][Data.of("monsters.cycle")]
		)
	else:
		pass
  # do fallback
	
