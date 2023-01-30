@tool
extends EditorNode
@onready var quest_name = $Quest_Name
@onready var quest_details = $Quest_Details

var group_node = null
var meta_data_node = null
var group = ""
var meta_data_id = ""
var steps = []
#returns an array with both the stored data and node position and name data
func get_data():
	var data = {
		"quest_id" : id,
		"quest_name" : quest_name.text,
		"quest_details" : quest_details.text,
		"completed" : false,
		"failed" : false,
		"step_index" : 0,
		"steps" : steps,
		"group" : group,
		"meta_data" : meta_data_id
	}
	return data

func set_data(data):
	id = data["quest_id"]
	quest_name.text = data.quest_name
	quest_details.text = data.quest_details
	steps = data["steps"]
	group = data["group"]
	meta_data_id = data["meta_data"]
	
func update_group_data():
	group = ""
	if is_instance_valid(group_node):
		group = group_node.get_data()

func update_meta_data():
	meta_data_id = ""
	if meta_data_node:
		meta_data_id = meta_data_node.id

func clear_meta_data():
	meta_data_id = ""
	meta_data_node = null
func clear_group():
	group = ""
	group_node = null
