extends Node

var foodBuild

func _ready():	
	Info.walls = get_node("Walls")
	Info.wallPos = {
		"left" : get_node("leftWall").position,
		"right" : get_node("rightWall").position,
		"up" : get_node("topWall").position,
		"down" : get_node("bottomWall").position
	}

func checkWall(headPosition):
	if(not headPosition):
		return false
	if not Info.atualAction:
		return false
	if headPosition.x == Info.wallPos[Info.atualAction].x and Info.moveDirection.x:
		return true
	if headPosition.y == Info.wallPos[Info.atualAction].y and Info.moveDirection.y:
		return true
	return false

func checkFood(headPosition):
	if(!Info.foodInstance):
		return false
	return headPosition == Info.foodInstance.position

func checkSnake(headPosition):
	var noHead = Info.bodyParts.slice(1, Info.bodyParts.size())
	for block in noHead:
		if block.position == headPosition:
			return true
	return false
