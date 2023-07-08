const MOD_DIR_PATH: = "user://runs/"

func _init():
	dir_check(MOD_DIR_PATH)

static func log_run(content_to_write:String, string_name:String)->void:
	_write_to_log_file(string_name + ": " + content_to_write)
	


static func _write_to_log_file(string_to_write:String)->void :
	var log_file: = File.new()

	if not log_file.file_exists(MOD_DIR_PATH+"run_"+GameWorld.runId+".log"):
		var error: = log_file.open(MOD_DIR_PATH+"run_"+GameWorld.runId+".log", File.WRITE)
		if not error == OK:
			assert (false, "Could not open log file, error code: %s" % error)
		log_file.store_string("%s Created log" % _get_date_time_string())
		log_file.store_string("\n" + "Version: %s" % GameWorld.version)
		log_file.store_string("\n" + "RunID: %s" % GameWorld.runId)
		log_file.close()

	var error: = log_file.open(MOD_DIR_PATH+"run_"+GameWorld.runId+".log", File.READ_WRITE)
	if not error == OK:
		assert (false, "Could not open log file, error code: %s" % error)
		return 

	log_file.seek_end()
	log_file.store_string("\n" + string_to_write)
	log_file.close()


func dir_check(path) -> void:
	var dir = Directory.new()
	if not dir.dir_exists(path):
		dir.make_dir(path)
		

static func _get_date_string()->String:
	var date_time: = Time.get_datetime_dict_from_system()
	return "%s-%02d-%02d" % [date_time.year, date_time.month, date_time.day]
	
static func _get_time_string()->String:
	var date_time: = Time.get_datetime_dict_from_system()
	return "%02d:%02d:%02d" % [date_time.hour, date_time.minute, date_time.second]

static func _get_date_time_string()->String:
	return "%s_%s" % [_get_date_string(), _get_time_string()]
