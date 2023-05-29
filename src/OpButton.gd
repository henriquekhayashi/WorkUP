extends Button

signal op_pressed(meta)

func _ready():
	pressed.connect(_on_pressed)
	
func _on_pressed():
	op_pressed.emit(get_meta("op_id"))
