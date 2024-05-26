extends Area2D

var es_pot_moure = true

# Called when the node enters the scene tree for the first time.
func _ready():
	$abaix.start()
	position.y = -64
	position.x = 32*(randi_range(0,24))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if es_pot_moure == true:
		if position.y < 1175:
			if Input.is_action_pressed("baixar"):
				position.y+=32
				es_pot_moure= false 
				$costats.start()
		if position.x <=750: 
			if Input.is_action_pressed("dreta"):
				position.x+=32
				es_pot_moure= false
				$costats.start()
		if position.x >=32:
			if Input.is_action_pressed("esquerra"):
				position.x+=-32
				es_pot_moure= false
				$costats.start()

func _on_costats_timeout():
	es_pot_moure = true

func _on_abaix_timeout():
	if position.y < 1175:
		position.y += 32
		$abaix.start()
	else:
		$abaix.stop()
		$costats.stop()
		Global.creanovapeça = true
		es_pot_moure = false
