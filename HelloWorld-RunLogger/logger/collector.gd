const RUN_DIR_PATH: = "user://runs/"


func _ready():
	pass

func collectAllRuns():
	var collectedRuns:Dictionary = {
		"none":[],
		CONST.MODE_RELICHUNT: [],
		CONST.MODE_PRESTIGE: [],
		CONST.MODE_COLONIZATION: [],
		CONST.MODE_PRESTIGE_ENDLESS: [],
		CONST.MODE_PRESTIGE_COBALT: [],
		CONST.MODE_PRESTIGE_COUNTDOWN: [],
		CONST.MODE_PRESTIGE_MINER: [],
		CONST.MODE_PRESTIGE_PRO: [],
		CONST.MODE_PRESTIGE_CARNAGE: []
	}
	var runsPaths = list_runs_in_directory(RUN_DIR_PATH)
	for runPath in runsPaths:
		var temp = collectRunData(RUN_DIR_PATH + runPath)
		collectedRuns[temp[0]].append(temp[1])
		#collectedRuns[temp[0]] = temp[1] # For Array approch
	return collectedRuns

func collectRunData(runPath:String): 
	var run_file = File.new()
	var error = run_file.open(runPath, File.READ)
	if error != OK:
		assert (false, "Could not open run log file, error code: %s" % error)
	
	var run_key = get_run_name_from_path(runPath)
	var index:int = 1
	var iron_multi:Array = []
	var cobalt_multi:Array = []
	var wave:int
	var gameMode:String = "none"
	
	
	
	while run_file.get_position() < run_file.get_len() or not run_file.eof_reached():
		var line:String = run_file.get_line()
		if index != 1: #skip n lines
			if line.strip_edges().length() > 1:
				var split = line.split(": ")
				var key = split[0].strip_edges().to_lower()
				var value = split[1].strip_edges()
				
				match key:
					"wave":
						wave = int(value)
					
					"ironmuli":
						iron_multi.insert(wave,value)
					
					"cobaltmuli":
						cobalt_multi.insert(wave,value)
					
					"gamemode":
						gameMode = value
					
					_:
						pass

		else:
			index += 1
	
	run_file.close()
	
	
	var return_data = [
		gameMode,
		{
			"run_key":run_key,
			"iron_multi":iron_multi,
			"cobalt_multi":cobalt_multi,
			"score_per_wave":multiplyArray(iron_multi,cobalt_multi),
			"total_score":cumsum(multiplyArray(iron_multi,cobalt_multi))
		}
	]

#   Array approch
#	
#	var return_data = [
#		run_key,
#		[
#			gameMode
#			iron_multi,
#			cobalt_multi,
#			multiplyArray(iron_multi,cobalt_multi),
#			cumsum(multiplyArray(iron_multi,cobalt_multi))
#		]
#	]
	
	return return_data
	
func list_runs_in_directory(path:String):
	var files = []
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin()
	
	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif file.begins_with("run_"):
			files.append(file)
	dir.list_dir_end()
	return files

func get_run_name_from_path(path:String):
	return path.trim_prefix("user://runs/run_").trim_suffix(".log")

func multiplyArray(array1:Array,array2:Array):
	var newarray:Array = []
	if array1.size() != array2.size():
		assert (false, "Incorrect array dimensions")
	else:
		for n in array1.size():
			newarray.append(int(array1[n])*int(array2[n]))
	
	return newarray

func cumsum(array:Array):
	var sum:int = 0
	for e in array:
		sum += int(e)
	return sum
