extends Node

@onready var tela_abertura = $TelaAbertura
@onready var tela_onboarding = $TelaOnboarding
@onready var login = $Login
@onready var home = $Home
@onready var trilha_carreira = $TrilhaCarreira
@onready var trilha_selecionada = $TrilhaSelecionada
@onready var tema_selecionado = $TemaSelecionado
@onready var tarefa = $Tarefa



func _ready():
	Events.show_home.connect(_on_show_home)
	Events.show_trilha.connect(_on_show_trilha)
	Events.show_trilha_sel.connect(_on_show_trilha_sel)
	Events.show_tema_sel.connect(_on_show_tema_sel)
	Events.show_tarefa.connect(_on_show_tarefa)

func _on_entrar_texture_button_pressed():
	hide_all()
	_on_show_home()


func _on_continuar_com_google_button_pressed():
	hide_all()
	_on_show_home()


func _on_criar_nova_conta_button_toggled(button_pressed):
	pass # Replace with function body.


func _on_esqueci_senha_button_toggled(button_pressed):
	pass # Replace with function body.


func _on_texture_button_pressed():
	pass # Replace with function body.

func hide_all():
	tela_abertura.hide()
	tela_onboarding.hide()
	login.hide()
	home.hide()
	trilha_carreira.hide()
	trilha_selecionada.hide()
	tema_selecionado.hide()
	tarefa.hide()
	Events.hide_p_home.emit()
	Events.hide_p_book.emit()

func _on_show_home():
	hide_all()
	Events.show_p_home.emit()
	home.show()

func _on_show_trilha():
	hide_all()
	Events.show_p_book.emit()
	trilha_carreira.show()

func _on_show_trilha_sel():
	hide_all()
	trilha_selecionada.show()

func _on_show_tema_sel():
	hide_all()
	tema_selecionado.show()

func _on_show_tarefa():
	hide_all()
	tarefa.show()

func _on_onboard_texture_button_pressed():
	hide_all()
	login.show()


func _on_trilha_c_texture_button_pressed():
	Events.show_trilha.emit()


func _on_aprender_jogo_texture_button_pressed():
	pass # Replace with function body.

func show_on_boarding():
	hide_all()
	tela_onboarding.show()
