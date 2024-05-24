extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.es_pot_moure == 0 and position.x>=0 and position.x<=864:
		if Input.is_action_pressed("baixar"):
			position.y+=32
			Global.es_pot_moure= 1  
		if Input.is_action_pressed("dreta"):
			position.x+=32
			Global.es_pot_moure= 1 
		if Input.is_action_pressed("esquerra"):
			position.x+=-32
			Global.es_pot_moure= 1


func _on_timer_timeout():
	position.y += 32
	$Timer.start()
