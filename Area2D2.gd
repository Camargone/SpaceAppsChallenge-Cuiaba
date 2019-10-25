extends Area2D


var Elemento = [preload("res://Elemento_E2.tscn"),
				preload("res://Elemento.tscn"),
				preload("res://Elemento_E3.tscn")]
var chao = Vector2(120,651)
var gravidade = 4000.3
var velocidade = Vector2()
var velocidade_pulo = -1200
var modificador_gravidade = 2.3

var tempo = 0.0
var intervalo = 3

func _ready():
	set_position(chao)
	pass
	
func _physics_process(delta):	
	tempo += delta
	
	if tempo >= intervalo:
		tempo = 0
		randomize()
		var c = rand_range(0, Elemento.size())
		get_parent().add_child(Elemento[c].instance())

	if Input.is_action_pressed("pular"):
		velocidade.y += gravidade * delta
	else :
		velocidade.y += gravidade * delta * modificador_gravidade
		
	if Input.is_action_just_pressed("pular") and position == chao:
		velocidade.y = velocidade_pulo
	
	position += velocidade * delta
	
	if get_position().y > chao.y :
		set_position(chao)
		velocidade = Vector2()

func colidiu(area):
	print(area)