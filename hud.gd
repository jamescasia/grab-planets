extends CanvasLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

onready var exit = get_node("exit")

var runonce = 0 
onready var globalpause = false
onready var pausemenu = get_node("pausemenu")
onready var a = get_node("pause")
onready var anim = get_node("gameoveranim")
onready var b = get_node("pause1")
onready var player = get_node("../../player")
onready var gameovermenu = get_node("gameovermenu")
onready var pausebg = get_node("pausebg")
onready var btnpause = get_node("pausing")


#onready var btnplay = get_node("playy")
func _ready():
	pausemenu.set_hidden(true)
	gameovermenu.set_hidden(true)
	
	
	
	
	set_fixed_process(true)
	
	pass 
func _fixed_process(delta):
	if player.get("gameover"):
		showmenu()
		
	else:
		gameovermenu.set_hidden(true)
	
	
	get_tree().set_pause(globalpause)  
	
	if globalpause:
		pausebg.set_hidden(false)
		pausemenu.set_hidden(false)
	else:
		pausemenu.set_hidden(true)
		pausebg.set_hidden(true)
		
	
func _on_pausing_button_up():
	a.set_hidden(false)
	b.set_hidden(true)
	a.set_scale((Vector2(0.4, 0.4)))
	b.set_scale(Vector2(0.4, 0.4))
func _on_pausing_button_down():
	b.set_hidden(false)
	a.set_hidden(true)
	a.set_scale((Vector2(0.36, 0.36)))
	b.set_scale(Vector2(0.36, 0.36))
	pass # replace with function body

func showmenu():
	
	while runonce <1:
		gameovermenu.set_hidden(false)
		anim.play("New Anim")
		globalpause = true
		pausemenu.set_hidden(true)
		pausemenu.set_opacity(0)
		runonce+=1
func _on_pausing_pressed():
	globalpause =true
func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		globalpause = true
		exit.set_hidden(false)
	  