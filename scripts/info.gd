extends Node2D

var atualAction
var moveDirection : Vector2
var bodyParts = []
var walls
var wallPos = {}
var foodInstance

func reset():
    atualAction = null
    moveDirection = Vector2.ZERO
    bodyParts.clear()
    walls = null
    wallPos.clear()
    foodInstance = null
