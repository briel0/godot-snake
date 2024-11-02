extends CanvasLayer

var container

var label

func _ready():
	container = get_node("BoxContainer")
	label = get_node("Label")
	var restartButton = $%Restart
	restartButton.pressed.connect(_on_restart_pressed)
	var quitButton = $%Quit
	quitButton.pressed.connect(_on_quit_pressed)
	
func onOver():
	container.visible = true
	label.visible = true
	
func _on_restart_pressed():
	get_tree().reload_current_scene()
	Info.reset()

func _on_quit_pressed():
	get_tree().quit()
