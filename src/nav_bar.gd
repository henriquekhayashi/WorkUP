extends PanelContainer
@onready var tex_purple_home = $MarginContainer/HBoxContainer/TextureRect/TextureRect
@onready var tex_purple_book = $MarginContainer/HBoxContainer/TextureRect2/TextureRect

func _ready():
	Events.show_p_home.connect(_on_show_p_home)
	Events.show_p_book.connect(_on_show_p_book)
	Events.hide_p_home.connect(_on_hide_p_home)
	Events.hide_p_book.connect(_on_hide_p_book)

func _on_home_button_pressed():
	print("shome")
	Events.show_home.emit()
	Events.show_p_home.emit()
	


func _on_book_button_pressed():
	print("sbook")
	Events.show_trilha.emit()
	Events.show_p_book.emit()

func _on_show_p_home():
	tex_purple_home.show()

func _on_show_p_book():
	tex_purple_book.show()

func _on_hide_p_home():
	tex_purple_home.hide()

func _on_hide_p_book():
	tex_purple_book.hide()
