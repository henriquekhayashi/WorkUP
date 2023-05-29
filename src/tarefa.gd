extends Control
@onready var op_1_label = $MarginContainer/VBoxContainer/VBoxContainer/MarginContainer/OpcoesContainer/PMarginContainer/MarginContainer/Op1Label
@onready var op_2_label = $MarginContainer/VBoxContainer/VBoxContainer/MarginContainer/OpcoesContainer/PMarginContainer2/MarginContainer/Op2Label
@onready var op_3_label = $MarginContainer/VBoxContainer/VBoxContainer/MarginContainer/OpcoesContainer/PMarginContainer3/MarginContainer/Op3Label
@onready var op_4_label = $MarginContainer/VBoxContainer/VBoxContainer/MarginContainer/OpcoesContainer/PMarginContainer4/MarginContainer/Op4Label

@onready var op_1_button = $MarginContainer/VBoxContainer/VBoxContainer/MarginContainer/OpcoesContainer/PMarginContainer/Panel1Container/Op1Button
@onready var op_2_button = $MarginContainer/VBoxContainer/VBoxContainer/MarginContainer/OpcoesContainer/PMarginContainer2/Panel2Container/Op2Button
@onready var op_3_button = $MarginContainer/VBoxContainer/VBoxContainer/MarginContainer/OpcoesContainer/PMarginContainer3/Panel3Container/Op3Button
@onready var op_4_button = $MarginContainer/VBoxContainer/VBoxContainer/MarginContainer/OpcoesContainer/PMarginContainer4/Panel4Container/Op4Button


@onready var panel_1_container = $MarginContainer/VBoxContainer/VBoxContainer/MarginContainer/OpcoesContainer/PMarginContainer/Panel1Container
@onready var panel_2_container = $MarginContainer/VBoxContainer/VBoxContainer/MarginContainer/OpcoesContainer/PMarginContainer2/Panel2Container
@onready var panel_3_container = $MarginContainer/VBoxContainer/VBoxContainer/MarginContainer/OpcoesContainer/PMarginContainer3/Panel3Container
@onready var panel_4_container = $MarginContainer/VBoxContainer/VBoxContainer/MarginContainer/OpcoesContainer/PMarginContainer4/Panel4Container

@onready var correct_answer_canvas_layer = $CorrectAnswerCanvasLayer

var op_panel_style = preload("res://assets/theme/option_panel_theme.tres")
var selected_op_panel_style = preload("res://assets/theme/selected_option_panel_theme.tres")
var _selected_op = null

var options = [
	"console.log( ‘ Uau!  Eu adoro aprender’ ) ,",
	"console.log(Uau!  Eu adoro aprender) ;",
	"console.log(Uau!  Eu adoro aprender()) ,",
	"console.log( ‘ Uau!  Eu adoro aprender’ ) ;"
]


var correct_option = "console.log( ‘ Uau!  Eu adoro aprender’ ) ;"

var panels = []
var op_labels = []

func _ready():
	get_tree()
	Events.correct_answer.connect(_on_correct_answer)
	panels = [panel_1_container, panel_2_container, panel_3_container, panel_4_container]
	var buttons = [op_1_button, op_2_button, op_3_button, op_4_button]
	for i in range(buttons.size()):
		buttons[i].set_meta("op_id", i)
		buttons[i].op_pressed.connect(_on_op_pressed)
	
	load_random()	

func load_random():
	reset_panels_style()
	var randomized = options.duplicate()
	randomized.shuffle()
	op_labels = [op_1_label, op_2_label, op_3_label, op_4_label]
	for i in range(op_labels.size()):
		op_labels[i].text = randomized.pop_back()
		
func check_answer(answer):
	_selected_op = null
	if answer == correct_option:
		Events.correct_answer.emit()
		
	else:
		load_random()

func select_option(index):
	panels[index].add_theme_stylebox_override("panel", selected_op_panel_style)
	
func reset_panels_style():
	for panel in panels:
		panel.add_theme_stylebox_override("panel", op_panel_style)
	
func _on_op_pressed(meta):
	reset_panels_style()
	match meta:
		0:
			_selected_op = meta
			select_option(meta)
		1:
			_selected_op = meta
			select_option(meta)
			
		2:
			_selected_op = meta
			select_option(meta)
						
		3:
			_selected_op = meta
			select_option(meta)
			#check_answer(op_4_label.text)

func _on_correct_answer():
	correct_answer_canvas_layer.show()


func _on_continue_texture_button_pressed():
	correct_answer_canvas_layer.hide()
	load_random()


func _on_verificar_texture_button_pressed():
	check_answer(op_labels[_selected_op].text)
