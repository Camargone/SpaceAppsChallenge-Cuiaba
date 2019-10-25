extends Area2D

onready var capivara = get_parent().get_node("Capivara")

var chao = Vector2(1344,682)
var velocidade = Vector2(-500,0)
var tempo_vida = 5

func _ready():
	set_position(chao)
	
	connect("area_entered", capivara, "colidiu")
	pass

func _physics_process(delta):
	set_position(get_position() + velocidade * delta)
	
	tempo_vida = tempo_vida - delta
	
	if tempo_vida <= 0:
		print("morri")
		queue_free()