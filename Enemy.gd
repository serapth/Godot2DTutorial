extends Node2D

var sprite = null;
const sprites = [ "enemy1_blue.png", "enemy1_green.png",
				"enemy1_red.png", "enemy1_yellow.png",
				"enemy2_blue.png", "enemy2_pink.png",
				"enemy2_red.png", "enemy2_yellow.png"]
				
var speed = 100
onready var explode = preload("res://Explosion.tscn").instance()

func _ready():
	speed = speed + (globals.currentStage * 10)

func _enter_tree():
	sprite = Sprite.new()
	sprite.texture = load("res://assets/graphics/enemies/" + sprites[randi()%sprites.size()])
	add_child(sprite)
	
func _process(delta):
	move_local_x(-delta*speed)

func _on_Area2D_area_entered(area):
	#Hit by bullet
	if(area.get_collision_layer_bit(3)):
		
		explode.set_position(self.get_position())
		get_parent().add_child(explode)
		globals.kills = globals.kills + 1
		queue_free()
