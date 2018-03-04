extends RigidBody2D

onready var firedelay = get_node("../firedelay")
var once = 0
var latch = false
onready var pulltime = get_node("../pulltime")
# class member variables go here, for example:
# var a = 2 
var gameover
signal reset
var combopts= 0  
onready var comboText = get_node("../Camera2D/hud/comboText")
var tweenstopped=false
onready var comboTimer = get_node("comboTimer")
signal upping
var comboing

onready var firing = get_node("../firing")
var shot
var letgo
var starting
var firingyawa 
onready var camera = get_node("../Camera2D")
onready var scoreb = get_node("../Camera2D/Label")
var fired 
var tweenplaying
var ob 

# var b = "textvar"
onready var gun = get_node("arm/gun")
onready var gun1 = get_node("arm/gun1")

onready var gun2 = get_node("arm/gun2")
var angleplus = false
var armrot 
var lastrotvel
var best
var lastvel
onready var grab = get_node("grab")
var vector
var score = 0
var mousepoint 
var continues = true
var hit
onready var timer = get_node("../Timer")
onready var tween = get_node("Tween")

onready var tween2 = get_node("Tween2")
var attached = false;
onready var arm = get_node("arm")
onready var claw = get_node("arm/claw")

onready var coll = get_node("arm/colliding")
func _ready(): 
	
	if _load()!= null:
		best = _load()
	else:
		best = 0 
	
	 
	 
	gameover= false
	 
	get_tree().set_auto_accept_quit(false)
	
	 
	
	set_fixed_process(true)
	 
	set_process_input(true)
	gun.set_enabled(true)
	gun1.set_enabled(true)
	gun2.set_enabled(true)
	gun.add_exception(self )
	gun.add_exception(arm)
	gun1.add_exception(self )
	gun1.add_exception(arm)
	
	gun2.add_exception(self )
	gun2.add_exception(arm) 
func firstadd():
	
	while  once <1:
		score+=1
		once+=1
func _fixed_process(delta):  
  
	
	 
		 
	gun1.force_raycast_update ( )
	gun.force_raycast_update ( )
	gun2.force_raycast_update ( )
	
	 
	#scoreb.set_pos(camera.get_pos())
	var position =int( -gun.get_cast_to().y -125)
	
	
	var angle = arm.get_rotd()  
	#print("armpos" + str(gun.get_cast_to().y) + "colllpoint"+  str(gun.get_collision_point().y))
	if  (gun.is_colliding() or gun1.is_colliding() or gun2.is_colliding())   and !tweenstopped:
		#print("1: " + str(gun.is_colliding()) + "2: " + str(gun1.is_colliding()) )
		mousepoint = gun.get_collision_point()
		vector = (mousepoint - get_pos()) 		
		
		var hitpos =  int(-vector.y) 
		
		if tweenplaying :
			
			
			
			comboTimer.start()
			comboing = true 
			combopts +=1
			letgo = true
			if gun.is_colliding():
				
			
				shot = gun.get_collider()
			if gun1.is_colliding():
				shot = gun1.get_collider()
			if gun2.is_colliding()  :
				shot = gun2.get_collider()
			firstadd()
			
			 
	 
			hit = true 
			
			emit_signal("upping")
			tween.stop_all()
			latch = false
		else: 
			
			gameover = true
	 
 
		 
	if !hit   and tweenstopped:
		continues = false
		pass
	#print(str(continues))
	if  continues == false:  
		gameover = true
		
		#get_tree().reload_current_scene() 
	if hit   :
		latch = true
		tweenstopped =true
		tweenplaying= false 
		
	if latch:
		set_pos(shot.get_pos()) 
		
	if tweenstopped:
		
		firingyawa = false
	#comboText.set_text( str(combopts))
	#if comboing :
	#	comboText.set_hidden(false)
		
		 
	#else:
	#	comboText.set_hidden(true)
	#	combopts = 0 
	 
	if gameover:
		if score > best:
			best = score
			save(best)
		
	
		

	
	arm.set_pos(Vector2(0, 0 ))
	 
	rotate()
	
	lastrotvel = arm.get_angular_velocity()
	if fired:
		
		
		pass
	else:
		arm.set_angular_velocity(lastrotvel)
func _input(event):
	if event.type == InputEvent.SCREEN_TOUCH and event.pressed and event.pos.y > 110 or Input.is_action_pressed("spaced"): 
		arm.set_angular_velocity(0)
		if !firingyawa:
			emit_signal("reset")
			starting = true 
			hit = false 
			firingyawa = true
			firedelay.start() 
			fired = true
			ob = Vector2(   -740*sin(arm.get_rot()), -740*cos(arm.get_rot()))
			tweenplaying = true
			tween.interpolate_property(arm, "transform/pos", Vector2(0,0),  ob,0.7, Tween.TRANS_CUBIC, Tween.TRANS_SINE)
			tweenstopped = false
			tween.start() 
			fired = false
			
			 
		 
		
		
		#arm.set_linear_velocity(Vector2(0,0))
		
		

func rotate():
	armrot = arm.get_rotd()  
	if armrot >= 100 and armrot <=110:
		angleplus = true
	if armrot <= -100 and armrot >=-110:
		angleplus = false
	if angleplus and !firingyawa: 
		arm.set_angular_velocity(2)
	elif !angleplus and !firingyawa:
		
		arm.set_angular_velocity(-2)
	#gun.set_rotd(arm.get_rot ())
	
		 

func _on_firedelay_timeout():
	
	
	
	
	
	fired = false
	
	firing.start() 
	
	
	#gun.set_enabled(true) 

func _on_firing_timeout():
	#gun.set_enabled(false)
	if shot!=null and fired == true:
		
		##tween2.interpolate_property(self, "transform/pos", Vector2(0,0),  shot.get_pos(), 3, Tween.TRANS_QUART, Tween.TRANS_SINE)
		##tween2.start() 
		#gun.set_enabled(false)
		pulltime.start()
	else: 
		fired = false
	
 

 

func _on_Tween_tween_complete( object, key ):
	tweenplaying =false
	firingyawa =false
	tweenstopped = true 
	latch = false
	pass # replace with function body

		
func save(content):
	var file = File.new()
	file.open("user://save_game.dat", file.WRITE)
	file.store_var( content)
	
	file.close()		
func _load():
	var content
	var file = File.new()
	file.open("user://save_game.dat", file.READ)
	if file!=null:
		 
	 
		content = file.get_var() 
		 
	
	file.close()
	return content 

func _on_comboTimer_timeout():
	comboing = false 
	pass # replace with function body
