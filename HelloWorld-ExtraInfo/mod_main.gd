extends Node

const MOD_LOG = "HelloWorld-ExtraInfo"
const MOD_DIR = MOD_LOG + "/"

var dir = ""
var ext_dir = "extensions/"
var trans_dir = "" # "translation/"
var yaml_dir = "" # "yaml/"
var languages = [] # ["en"]
var elementsToUnlock = []
var mode = 1 # 0-default / 1-Allow prestig / 2-Allow prestig+posting

################################
### Edit only above fragment ###
################################

func _init(modLoader = ModLoader):
	ModLoaderLog.info("Init", MOD_LOG)
	dir = ModLoaderMod.get_unpacked_dir() + MOD_DIR
	ext_dir = dir + ext_dir
	
	# Install all gd files in "extensions/" directory and subdirecotries
	get_dir_contents(ext_dir)
	
	# Add translation if exists
	if trans_dir != null:
		trans_dir = dir + trans_dir
		for lang in languages:
			ModLoaderMod.add_translation(trans_dir + MOD_LOG.to_lower() + "text." + lang + ".translation")
	else:
		pass
	
	match mode:
		1:
			CONST.PRESTIGE_WHITELIST_MOD_IDS.append(MOD_LOG)
			CheatDetection.confirmedCheaters.append(Steam.getSteamID())
		2:
			CONST.PRESTIGE_WHITELIST_MOD_IDS.append(MOD_LOG)
		_:
			pass

func get_dir_contents(rootPath: String) -> Array:
	var files = []
	var directories = []
	var dir = Directory.new()

	if dir.open(rootPath) == OK:
		dir.list_dir_begin(true, false)
		_add_dir_contents(dir, files, directories)
	else:
		push_error("An error occurred when trying to access the path.")

	return [files, directories]
	
func _add_dir_contents(dir: Directory, files: Array, directories: Array):
	var file_name = dir.get_next()

	while (file_name != ""):
		var path = dir.get_current_dir() + "/" + file_name

		if dir.current_is_dir():
			#print("Found directory: %s" % path) #Uncomment for debbuging
			var subDir = Directory.new()
			subDir.open(path)
			subDir.list_dir_begin(true, false)
			directories.append(path)
			_add_dir_contents(subDir, files, directories)
		else:
			if path.get_extension() == "gd": # For potential bug prevention
				#print("Installing: %s" % path) #Uncomment for debbuging
				ModLoaderMod.install_script_extension("%s" % path)

		file_name = dir.get_next()

	dir.list_dir_end()
	
func _ready():
	ModLoaderLog.info("Done", MOD_LOG)
	add_to_group("mod_init")

func modInit():
	if yaml_dir != "":
		var pathToModYaml : String = ModLoaderMod.get_unpacked_dir() + MOD_DIR + yaml_dir
		Data.parseUpgradesYaml(pathToModYaml + "upgrades.yaml")
		
	for e in elementsToUnlock:
		GameWorld.unlockElement(e)
		
	#This signal can be used to test the mod
	#StageManager.connect("level_ready", self, "testMod")
	pass

