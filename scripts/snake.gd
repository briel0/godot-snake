extends Node

@onready var collisions = get_parent().get_node("Walls")
@onready var foodBuild = get_parent().get_node("FoodSpawner")
@onready var ui = get_parent().get_node("UILayer")
@onready var timer = get_parent().get_node("Timer")

const blockSize = 32

func initSnake():
    var head = Sprite2D.new()
    head.position = Vector2(0, 0)
    head.scale = Vector2(1, 1)
    head.texture = preload("res://assets/snake.png")
    add_child(head)
    Info.bodyParts.append(head)
    
func _ready():
    initSnake()
    timer.timeout.connect(on_timeout)

func _input(event: InputEvent):
    var directions = { 
        "up" : Vector2.UP, "down" : Vector2.DOWN,
        "right" : Vector2.RIGHT, "left" : Vector2.LEFT,
    }
    
    for action in directions.keys():
        if(event.is_action_pressed(action) && Info.moveDirection != directions[action] * -1):
            Info.atualAction = action
            Info.moveDirection = directions[action]
            break

func on_timeout():
    var newPosition = Info.bodyParts[0].position + Info.moveDirection * blockSize
    moveTo(newPosition)

    if(collisions.checkFood(newPosition)):
        addPart()
        foodBuild.destroyFood()
        foodBuild.spawnFood()
        
    if(collisions.checkSnake(newPosition) || collisions.checkWall(newPosition)):
        timer.stop()
        ui.onOver()
    
func moveTo(newPosition):
    if(Info.bodyParts.size() > 1):
        var last = Info.bodyParts.pop_back()
        last.position = Info.bodyParts[0].position
        Info.bodyParts.insert(1, last)
    Info.bodyParts[0].position = newPosition
    
func addPart():
    var part = Sprite2D.new()
    part.texture = preload("res://assets/snake.png")
    part.scale = Vector2(0.9, 0.9)
    part.position = Info.bodyParts[-1].position - Info.moveDirection * blockSize
    Info.bodyParts.append(part)
    add_child(part)
