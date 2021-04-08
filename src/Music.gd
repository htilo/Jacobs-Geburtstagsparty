extends AudioStreamPlayer

var lis = load("res://assets/music/lis.wav")
var moonriver = load("res://assets/music/moonriver.wav")
var nightwish = load("res://assets/music/nightwish.wav")
var takeonme = load("res://assets/music/takeonme.wav")
var current_song
var time = 0
#onready var tween_out = get_node("Tween")

func play_lis():
	play_song(lis)

func play_moonriver():
	play_song(moonriver)

func play_nightwish():
	play_song(nightwish)
	
func play_takeonme():
	play_song(takeonme)

func play_song(song):
	if current_song == lis:
		time = get_playback_position()
	if current_song != song:
		stream = song
		play()
		if song == lis:
			seek(time)
		current_song = song
