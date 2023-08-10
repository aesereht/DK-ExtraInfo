tool
extends Node2D

func _ready():
	pass

func _draw() -> void:
	var points = PoolVector2Array()
	for i in range(0, 50, 1):
		var x = round(pow(2, ((i - 1) * 0.06)) * i * (13 + 1) + 3)/100
		points.append(Vector2(i, x))
	draw_polyline(points,Color.aqua,1.0)
	print(points.size())
