extends Node

var foodPosition: Vector2

var blockSize = 32

var info

func _ready():
	spawnFood()

func spawnFood():	
	var food = Sprite2D.new()
	food.texture = preload("res://assets/food.png")
	var xPos = round(randi_range(Info.wallPos["left"].x + 32, Info.wallPos["right"].x - 32) / blockSize) * blockSize
	var yPos = round(randi_range(Info.wallPos["down"].y - 32, Info.wallPos["up"].y + 32) / blockSize) * blockSize
	food.position = Vector2(xPos, yPos)
	add_child(food)
	Info.foodInstance = food
	
func destroyFood():
	remove_child(Info.foodInstance)
