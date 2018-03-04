extends RigidBody2D
var posplus;
# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var speed = 30
var posx;
func _ready():
	set_fixed_process(true)
	# Called every time the node is added to the scene.
	# Initialization here
	pass
func _fixed_process(delta):
	speed+= 8*delta
	posx = get_pos().x
	if posx >= 450 and posx <= 475:
		posplus = true;
	elif posx >= 5 and posx <= 30:
		posplus = false;
	if posplus:
		set_linear_velocity( Vector2(-speed, 0))
	else:
		set_linear_velocity(Vector2(speed, 0))
	
	