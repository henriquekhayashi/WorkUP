extends Control


func _on_html_texture_button_pressed():
	Events.show_tarefa.emit()
