const MOD_LOG_PATH: = "user://logs/runs.log"


static func log_run(content_to_write:String, string_name:String)->void:
	_write_to_log_file(GameWorld.runId.substr(0,8) + " " + string_name + ": " + content_to_write)

static func _write_to_log_file(string_to_write:String)->void :
	var log_file: = File.new()

	if not log_file.file_exists(MOD_LOG_PATH):
		var error: = log_file.open(MOD_LOG_PATH, File.WRITE)
		if not error == OK:
			assert (false, "Could not open log file, error code: %s" % error)
		log_file.store_string("%s Created log" % _get_date_string())
		log_file.close()

	var error: = log_file.open(MOD_LOG_PATH, File.READ_WRITE)
	if not error == OK:
		assert (false, "Could not open log file, error code: %s" % error)
		return 

	log_file.seek_end()
	log_file.store_string("\n" + string_to_write)
	log_file.close()

static func _get_date_string()->String:
	var date_time: = Time.get_datetime_dict_from_system()
	return "%s-%02d-%02d" % [date_time.year, date_time.month, date_time.day]
