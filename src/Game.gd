aextends Node

var vertex = []
var current_vertex
var timer
var text
var counter
var music_player
var moonriver_vertices
var nightwish_vertices
var	takeonme_vertices

func _ready():
	timer = Timer.new()
	timer.connect("timeout",self,"_on_timer_timeout")
	add_child(timer)
	for i in 100:
		vertex.append(Vertex.new())
	current_vertex = vertex[0]
	init_music()
	init_text()
	update_text()
	vertex[64].gameover = true

func _on_Button0_pressed():
	current_vertex = current_vertex.child[0]
	update_music()
	update_text()

func _on_Button1_pressed():
	current_vertex = current_vertex.child[1]
	update_music()
	if current_vertex.gameover:
		get_tree().quit()
	else:
		update_text()
	
func update_music():
	if current_vertex in moonriver_vertices:
		Music.play_moonriver()
	elif current_vertex in nightwish_vertices:
		Music.play_nightwish()
	elif current_vertex in takeonme_vertices:
		Music.play_takeonme()
	else:
		Music.play_lis()
	
func update_text():
	$Button0/Text.set_text("")
	$Button1/Text.set_text("")
	counter = 0
	text = ""
	_on_timer_timeout()
	
func _on_timer_timeout():
	if counter < current_vertex.text.size():
		var current_text = current_vertex.text[counter]
		text = text + current_text + "\n\n"
		$Text.set_bbcode("[center]" + text)
		timer.stop()
		timer.set_wait_time(wait_time(current_text))
		timer.start()
		counter += 1
	else:
		$Button0/Text.set_bbcode("[center]" + current_vertex.textb[0])
		$Button1/Text.set_bbcode("[center]" + current_vertex.textb[1])
		timer.stop()
	
func wait_time(s):
	if $Skip/CheckButton.is_pressed():
		return(0.05)
	else:
		return(1 + s.length() / 30)
	
func init_music():
	moonriver_vertices = [vertex[11]]
	nightwish_vertices = [vertex[39]]
	takeonme_vertices = [vertex[38]]
	
func init_text():
	vertex[0].text.append("Verbindung wird hergestellt...")
	vertex[0].text.append("Nachrichten werden empfangen...")
	vertex[0].text.append("Hallo???")
	vertex[0].text.append("Kann mich jemand hören?")
	vertex[0].textb.append("Ja.")
	vertex[0].textb.append("Nein, aber ich kann deine Nachrichten lesen.")
	vertex[0].child[0] = vertex[1]
	vertex[0].child[1] = vertex[2]
	
	vertex[1].text.append("Puh, Gott sei Dank.")
	vertex[1].text.append("Macht es dir etwas aus, wenn ich dir schreibe?")
	vertex[1].text.append("Du bist die einzige Person, die ich erreichen konnte.")
	vertex[1].text.append("Bist du überhaupt eine Person? Bist du real? Oder rede ich hier etwa schon mit einem Bot?")
	vertex[1].textb.append("Bin real.")
	vertex[1].textb.append("Klar, erzähl mir doch erstmal, was los ist.")
	vertex[1].child[0] = vertex[5]
	vertex[1].child[1] = vertex[4]
	
	vertex[2].text.append("Achso, ja. Entschuldige bitte. Ich bin etwas durch den Wind.")
	vertex[2].text.append("Aber um ehrlich zu sein habe ich auch jeden Grund dazu.")
	vertex[2].text.append("Sicherlich würde es jedem in meiner Situation so gehen.")
	vertex[2].textb.append("Was ist denn eigentlich los?")
	vertex[2].textb.append("Wer bist du überhaupt?")
	vertex[2].child[0] = vertex[4]
	vertex[2].child[1] = vertex[3]
	
	vertex[3].text.append("Huch! Wie unhöflich von mir...")
	vertex[3].text.append("Ich bin - ...")
	vertex[3].text.append("... waaar? ...")
	vertex[3].text.append("Jacob. Jacob Stegemann. Ein kleiner Mathestudent. Vollbart. Langes dunkles Elbenhaar. MLP Fan. Klavierspieler...")
	vertex[3].text.append("Und heute ist übrigens mein Geburtstag.")
	vertex[3].text.append("Nicht, dass ich damit herumprahlen möchte. Aber warum muss sowas denn ausgerechnet heute passieren?")
	vertex[3].text.append("Ich werde heute von meinen Freunden erwartet. Sie sollen sich doch keine Sorgen um mich machen.")
	vertex[3].text.append("Wobei... vielleicht sollten sie das?")
	vertex[3].text.append("Naja.")
	vertex[3].text.append("Und jetzt bin ich einfach nur noch ...")
	vertex[3].textb.append("Ganz ruhig. Was ist los?")
	vertex[3].textb.append("Hör auf dir darüber Gedanken zu machen. Sieh dich einfach mal um.")
	vertex[3].child[0] = vertex[4]
	vertex[3].child[1] = vertex[6]
	
	vertex[4].text.append("Wenn ich das so genau sagen könnte.")
	vertex[4].text.append("Die ganze Welt ist auf einmal verpixelt.")
	vertex[4].text.append("Und... zweidimensional.")
	vertex[4].text.append("Sogar ich... bin... verpixelt und zweidimensional.")
	vertex[4].text.append("Ansich finde ich es ja cool, dass mein Bart jetzt nicht mehr so verwurschtelt ist.")
	vertex[4].text.append("Also wirklich jetzt, der sieht heute verdammt gut aus, wenn ich das mal so behaupten darf.")
	vertex[4].text.append("Aber dieses Gefühl ist unbeschreiblich.")
	vertex[4].text.append("Ich fühle mich sooo... eingesperrt. Eingesperrt in einer Spielkonsole.")
	vertex[4].text.append("Tut mir Leid - ich will dich damit echt nicht belasten...")
	vertex[4].text.append("Aber ich bin echt auf dich angewiesen. Ich weiß nicht, was ich jetzt machen soll.")
	vertex[4].textb.append("Sieh dich doch erstmal um.")
	vertex[4].textb.append("Klar, ich helfe dir. Aber wer bist du eigentlich?")
	vertex[4].child[0] = vertex[6]
	vertex[4].child[1] = vertex[3]
	
	vertex[5].text.append("Ja, ich auch. Naja, wobei...")
	vertex[5].text.append("Ich bin - ...")
	vertex[5].text.append("... waaar? ...")
	vertex[5].text.append("Jacob. Jacob Stegemann. Ein kleiner Mathestudent. Vollbart. Langes dunkles Elbenhaar. MLP Fan. Klavierspieler...")
	vertex[5].text.append("Und heute ist übrigens mein Geburtstag.")
	vertex[5].text.append("Nicht, dass ich damit herumprahlen möchte. Aber warum muss sowas denn ausgerechnet heute passieren?")
	vertex[5].text.append("Ich werde heute von meinen Freunden erwartet. Sie sollen sich doch keine Sorgen um mich machen.")
	vertex[5].text.append("Wobei... vielleicht sollten sie das?")
	vertex[5].text.append("Naja.")
	vertex[5].text.append("Und jetzt bin ich einfach nur noch ...")
	vertex[5].textb.append("Ganz ruhig. Was ist los?")
	vertex[5].textb.append("Hör auf dir darüber Gedanken zu machen. Sieh dich einfach mal um.")
	vertex[5].child[0] = vertex[4]
	vertex[5].child[1] = vertex[6]
	
	vertex[6].text.append("Ja. Super Idee.")
	vertex[6].text.append("Umsehen...")
	vertex[6].text.append("Besser gesagt: Nach vorne und nach hinten sehen. Und wenn man gut gelaunt ist schaut man auch noch nach oben und nach unten.")
	vertex[6].text.append("Denn falls ich es dir noch nicht gesagt habe: Hier ist alles zweidimensional.")
	vertex[6].text.append("Super, oder?")
	vertex[6].text.append("Okay, schon gut. Spaß beiseite.")
	vertex[6].text.append("Also, ich sehe hier einen Computer, ein Klavier und eine verschlossene Tür.")
	vertex[6].text.append("Soll ich vielleicht zur Tür gehen und versuchen sie zu öffnen?")
	vertex[6].text.append("Huch?")
	vertex[6].text.append("Ehm...")
	vertex[6].textb.append("Was???")
	vertex[6].textb.append("Ist dir was passiert?")
	vertex[6].child[0] = vertex[7]
	vertex[6].child[1] = vertex[8]
	
	vertex[7].text.append("Die Tür...")
	vertex[7].text.append("sie hat sich gerade geöffnet.")
	vertex[7].text.append("Einfach so!")
	vertex[7].text.append("Es ist wirklich unheimlich.")
	vertex[7].text.append("Wobei... rational betrachtet ist das wohl nicht das Unheimlichste.")
	vertex[7].text.append("Wahrscheinlich sitzt da gerade jemand vor der Konsole und hat mit einem Klick diese Tür geöffnet.")
	vertex[7].text.append("Bestimmt pikst er mir gleich noch in den Po...")
	vertex[7].text.append("Was soll ich jetzt machen?")
	vertex[7].textb.append("Spiel Klavier.")
	vertex[7].textb.append("Mach etwas anderes.")
	vertex[7].child[0] = vertex[9]
	vertex[7].child[1] = vertex[10]
	
	vertex[8].text.append("Ja, mir ist nichts passiert.")
	vertex[8].text.append("Zumindest noch nicht.")
	vertex[8].text.append("Es ist wirklich unheimlich.")
	vertex[8].text.append("Die Tür hat sich gerade einfach geöffnet.")
	vertex[8].text.append("Wobei... rational betrachtet ist das wohl nicht das Unheimlichste.")
	vertex[8].text.append("Wahrscheinlich sitzt da gerade jemand vor der Konsole und hat mit einem Klick diese Tür geöffnet.")
	vertex[8].text.append("Bestimmt pikst er mir gleich noch in den Po...")
	vertex[8].text.append("Was soll ich jetzt machen?")
	vertex[8].textb.append("Spiel Klavier.")
	vertex[8].textb.append("Mach etwas anderes.")
	vertex[8].child[0] = vertex[9]
	vertex[8].child[1] = vertex[10]
	
	vertex[9].text.append("Klavier spielen??")
	vertex[9].text.append("Und was ist mit der Tür?")
	vertex[9].text.append("Das kann ich doch jetzt nicht einfach ignorieren?")
	vertex[9].text.append("Aber vielleicht ist das ja die einzige Möglichkeit, sich gegen dieses Spiel zu wehren?")
	vertex[9].text.append("Vielleicht hat mir ja jemand die Tür geöffnet, weil er will, dass ich dort hindurchgehe.")
	vertex[9].text.append("Und wenn ich mich dagegen wehre, verliert er das Spiel.")
	vertex[9].text.append("Aber warum sollte mich das befreien?")
	vertex[9].text.append("Warum bin ich überhaupt hier?")
	vertex[9].textb.append("Mach lieber doch etwas anderes.")
	vertex[9].textb.append("Worauf wartest du? Spiel endlich!")
	vertex[9].child[0] = vertex[10]
	vertex[9].child[1] = vertex[11]
	
	vertex[10].text.append("Okay. Was soll ich stattdessen machen?")
	vertex[10].textb.append("Geh an den Computer.")
	vertex[10].textb.append("Geh durch die Tür.")
	vertex[10].child[0] = vertex[12]
	vertex[10].child[1] = vertex[13]
	
	vertex[11].text.append("Okay, vielleicht ist das gar keine schlechte Idee.")
	vertex[11].text.append("Dann kann ich mich vielleicht etwas entspannen.")
	vertex[11].text.append("Es gibt da so ein Stück, dass ich mal mit einer Freundin komponiert habe.")
	vertex[11].text.append("Wenn ich das spiele, fühle ich mich vielleicht nicht so verloren.")
	vertex[11].text.append("Es heißt Moonriver.")
	vertex[11].text.append("Pass auf, es geht so:")
	vertex[11].text.append("Dim dim dim dim!")
	vertex[11].text.append("Ja, es geht mir schon deutlich besser. Das hat mir echt geholfen.")
	vertex[11].text.append("Und ich lebe immernoch.")
	vertex[11].text.append("Was soll ich als nächstes machen?")
	vertex[11].textb.append("Geh an den Computer.")
	vertex[11].textb.append("Geh durch die Tür.")
	vertex[11].child[0] = vertex[12]
	vertex[11].child[1] = vertex[13]
	
	vertex[12].text.append("Und was soll ich da machen?")
	vertex[12].text.append("Ein Kapitel Lost Words spielen?")
	vertex[12].text.append("Oder ein Let's Play bei Gronkh schauen? ")
	vertex[12].text.append("Beyond Two Souls?")
	vertex[12].text.append("Skibble.io kann ich hier ja sicherlich nicht ohne Freunde spielen...")
	vertex[12].text.append("Hmm....")
	vertex[12].text.append("Ich hab's!")
	vertex[12].text.append("Das ist genial!")
	vertex[12].text.append("Ich versuche dieses System zu hacken! Vielleicht kann ich mich ja so irgendwie befreien!")
	vertex[12].text.append("Oder kann ich damit vielleicht die ganze Welt auslöschen? Sogar mich selbst?")
	vertex[12].text.append("Ein Versuch sollte es doch Wert sein, oder?")
	vertex[12].textb.append("Geh lieber doch zur Tür!")
	vertex[12].textb.append("Versuche das System zu hacken!")
	vertex[12].child[0] = vertex[13]
	vertex[12].child[1] = vertex[14]
	
	vertex[13].text.append("Okay. Ich gehe jetzt zur Tür.")
	vertex[13].text.append("Schritt für Schritt.")
	vertex[13].text.append("Mein Herz pocht wie wild.")
	vertex[13].text.append("Am liebsten würde ich einfach wieder vor meinem eigenen PC sitzen und ein paar Spielcharaktere durch den Bildschirm jagen.")
	vertex[13].text.append("Oh....")
	vertex[13].text.append("Das ist ja ...")
	vertex[13].textb.append("Ja?")
	vertex[13].textb.append("Hm?")
	vertex[13].child[0] = vertex[15]
	vertex[13].child[1] = vertex[15]
	
	vertex[14].text.append("Okay. Es ist aussichtslos.")
	vertex[14].text.append("Das Ding zeigt mir zwar eine Konsole an, aber wenn man genau hinschaut, ist der Computer nichtmal an.")
	vertex[14].text.append("Auf dem Bildschirm klebt nur eine Folie, die den Computer aussehen lässt, als könnte man jetzt ein bisschen herumprogrammieren.")
	vertex[14].text.append("Eine Folie...")
	vertex[14].text.append("Der Computer hat nichtmal einen Anschaltknopf. Geschweige den ein Stromkabel.")
	vertex[14].text.append("Oh man...")
	vertex[14].text.append("Dann muss ich wohl doch durch diese Tür gehen.")
	vertex[14].text.append("Etwas anderes als graue Haare kriegen kann man hier nämlich garantiert nicht.")
	vertex[14].text.append("Wünsch mir Glück.")
	vertex[14].textb.append("Viel Glück!")
	vertex[14].textb.append("Hals und Beinbruch!")
	vertex[14].child[0] = vertex[13]
	vertex[14].child[1] = vertex[13]
	
	vertex[15].text.append("Ein Luftballon!")
	vertex[15].text.append("Hier ist gerade einfach ein Luftballon durch die Tür geflogen!")
	vertex[15].text.append("Was hat das zu bedeuten?")
	vertex[15].text.append("Soll ich ihn mitnehmen?")
	vertex[15].textb.append("Klar, wieso nicht?")
	vertex[15].textb.append("Mir egal.")
	vertex[15].child[0] = vertex[16]
	vertex[15].child[1] = vertex[17]
	
	vertex[16].text.append("Okay, mache ich.")
	vertex[16].text.append("Jetzt gehe ich aber wirklich durch die Tür.")
	vertex[16].text.append("...")
	vertex[16].text.append("Drei Herzinfarkte später...")
	vertex[16].text.append("Ich bin hier jetzt in einem Gang gelandet.")
	vertex[16].text.append("Und der scheint mein Herzpochen nochmal zu verstärken.")
	vertex[16].text.append("Ich habe wirklich Angst.")
	vertex[16].text.append("Wenn das jetzt ein Horrorfilm wäre, hätte ich mir einfach gewünscht, dass die Person einfach im Zimmer geblieben wäre.")
	vertex[16].text.append("Immerhin habe ich dich. Da fühle ich mich schon viel sicherer. Und diesen Luftballon.")
	vertex[16].text.append("Okay, hier ist der Gang zu Ende.")
	vertex[16].text.append("Soll ich jetzt in den linken oder den rechten Raum gehen?")
	vertex[16].textb.append("Links bringt\'s!")
	vertex[16].textb.append("Rechts zuerst!")
	vertex[16].child[0] = vertex[24]
	vertex[16].child[1] = vertex[18]
	
	vertex[17].text.append("Entschuldige, ich stelle hier echt unnötige Fragen. Ich werde ihn einfach mitnehmen.")
	vertex[17].text.append("Jetzt gehe ich aber wirklich durch die Tür.")
	vertex[17].text.append("...")
	vertex[17].text.append("Drei Herzinfarkte später...")
	vertex[17].text.append("Ich bin hier jetzt in einem Gang gelandet.")
	vertex[17].text.append("Und der scheint mein Herzpochen nochmal zu verstärken.")
	vertex[17].text.append("Ich habe wirklich Angst.")
	vertex[17].text.append("Wenn das jetzt ein Horrorfilm wäre, hätte ich mir einfach gewünscht, dass die Person einfach im Zimmer geblieben wäre.")
	vertex[17].text.append("Immerhin habe ich dich. Da fühle ich mich schon viel sicherer. Und diesen Luftballon.")
	vertex[17].text.append("Okay, hier ist der Gang zu Ende.")
	vertex[17].text.append("Soll ich jetzt in den linken oder den rechten Raum gehen?")
	vertex[17].textb.append("Links bringt\'s!")
	vertex[17].textb.append("Rechts zuerst!")
	vertex[17].child[0] = vertex[24]
	vertex[17].child[1] = vertex[18]
	
	vertex[18].text.append('Wooooow!')
	vertex[18].text.append('All die Uhren und Hebel...')
	vertex[18].text.append('Das sieht aus wie eine... Zeitmaschine!')
	vertex[18].text.append('Lol.')
	vertex[18].text.append('Hier liegt eine Bedienungsanleitung.')
	vertex[18].text.append('Aber wer liest schon Bedienungsanleitungen, oder?')
	vertex[18].text.append('Okay, ich kann sie ja zumindest mal überfliegen, man weiß ja nie.')
	vertex[18].text.append('"In die Vergangenheit und in die Zukunft."')
	vertex[18].text.append('"Hebel umlegen und los."')
	vertex[18].text.append('"Wenn sich der Hebel nicht umlegen lässt, rufen sie Karacare."')
	vertex[18].text.append('Okay, easy peasy lemons squeezy. Oder besser gesagt: Was habe ich schon zu verlieren, oder?')
	vertex[18].text.append('Nächster Halt:')
	vertex[18].textb.append('Vergangenheit!')
	vertex[18].textb.append('Zukunft!')
	vertex[18].child[0] = vertex[19]
	vertex[18].child[1] = vertex[19]
	
	vertex[19].text.append('Häää?')
	vertex[19].text.append('Das ist ja der größte Troll.')
	vertex[19].text.append('Der Hebel...')
	vertex[19].text.append('uff...')
	vertex[19].text.append('der ist verdammt schwergängig.')
	vertex[19].text.append('Ich hänge mich mit aller Kraft an diesen Hebel.')
	vertex[19].text.append('Aber er lässt sich unmöglich umlegen.')
	vertex[19].text.append('Unmöglich.')
	vertex[19].textb.append('Versuch es weiter!')
	vertex[19].textb.append('Dann ruf halt Karacare...')
	vertex[19].child[0] = vertex[20]
	vertex[19].child[1] = vertex[21]
	
	vertex[20].text.append('Nein wirklich, es ist unmöglich.')
	vertex[20].textb.append('Versuch es weiter!')
	vertex[20].textb.append('Go for Karacare!')
	vertex[20].child[0] = vertex[20]
	vertex[20].child[1] = vertex[21]
	
	vertex[21].text.append('Okay, hier ist eine Art Telefonzelle eingebaut.')
	vertex[21].text.append('Man kann keine Nummer wählen, aber es kommt ein ')
	vertex[21].text.append('Tut Tut Tut...')
	vertex[21].text.append('wenn man den Hörer in die Hand nimmt.')
	vertex[21].text.append('Ich wünschte mir gerade so sehr zuhause anrufen zu können. Einfach eine Stimme von einer bekannten Person hören.')
	vertex[21].text.append('Das wäre schön. Ich habe solche Sehnsucht.')
	vertex[21].text.append('...')
	vertex[21].text.append('Okay, keine Zeit zum weinen.')
	vertex[21].text.append('Hier geht auch keiner ran.')
	vertex[21].textb.append('Warte noch ein bisschen.')
	vertex[21].textb.append('Dann geh lieber in den linken Raum.')
	vertex[21].child[0] = vertex[22]
	vertex[21].child[1] = vertex[24]
	
	vertex[22].text.append('Tut Tut Tut sich nichts...')
	vertex[22].textb.append('Geduld...')
	vertex[22].textb.append('Ab in den linken Raum, es ist aussichtslos.')
	vertex[22].child[0] = vertex[23]
	vertex[22].child[1] = vertex[24]
	
	vertex[23].text.append('Tuuuuuuut.')
	vertex[23].text.append('Verbindung unterbrochen.')
	vertex[23].text.append('...')
	vertex[23].text.append('Oh man, ich habe so lange gewartet.')
	vertex[23].text.append('Nicht mal in dieser Welt kann ich die Stimme von jemandem hören.')
	vertex[23].text.append('Ich fühle mich so alleine.')
	vertex[23].text.append('Ich weiß echt nicht, was ich hier machen soll.')
	vertex[23].text.append('Ich möchte so gerne nach Hause zurück.')
	vertex[23].textb.append('Das verstehe ich, versuch doch mal den linken Raum.')
	vertex[23].textb.append('Heul nicht rum und versuche es im linken Raum.')
	vertex[23].child[0] = vertex[24]
	vertex[23].child[1] = vertex[24]
	
	vertex[24].text.append('Okay, wie du meinst.')
	vertex[24].text.append('Ich folge deiner Anweisung einfach mal blind.')
	vertex[24].text.append('Ist ja nicht so, als würde das ein Spielcharakter auch machen und dass ich genau das umgehen wollte.')
	vertex[24].text.append('Nun gut. Ich beschreibe dir mal was ich sehe.')
	vertex[24].text.append('Ich bin in einer großen hohen Halle. ')
	vertex[24].text.append('Hinten an der Wand sind zwei - hahaha wow - verschlossene Türen.')
	vertex[24].text.append('Die eine Tür ist rot und die andere Tür ist blau.')
	vertex[24].text.append('In der Mitte steht ein Tisch.')
	vertex[24].text.append('Und... ach, das war ja klar, das sowas noch kommen musste...')
	vertex[24].textb.append('Nun sag schon!')
	vertex[24].textb.append('Achja? Du weißt also was ab geht?')
	vertex[24].child[0] = vertex[25]
	vertex[24].child[1] = vertex[26]
	
	vertex[25].text.append('Okay, also...')
	vertex[25].text.append('Hier auf dem Tisch ist so eine Art Schaltgerät. Es läuft eigentlich nur darauf hinaus, ob ich mich für den roten oder den blauen Knopf entscheide.')
	vertex[25].text.append('Oh, und hier steht noch etwas:')
	vertex[25].text.append('"Willkommen im GRUB-Menü"')
	vertex[25].text.append('"Wählen Sie zwischen Linux und Windows."')
	vertex[25].text.append('"BLAU: Wähle Linux."')
	vertex[25].text.append('"ROT: Wähle Windows."')
	vertex[25].text.append('Also ich weiß ja, für was ich mich entscheiden würde, aber vielleicht wollen die ja auch von mir, dass ich mich so entscheide, wie ich mich eben entscheiden würde.')
	vertex[25].text.append('Deshalb überlasse ich dir die Wahl.')
	vertex[25].textb.append('Linux')
	vertex[25].textb.append('Windows')
	vertex[25].child[0] = vertex[27]
	vertex[25].child[1] = vertex[30]
	
	vertex[26].text.append('Naja, da hab ich mich vielleicht ungünstig ausgedrückt.')
	vertex[26].text.append('Aber du musst ja nicht direkt so unhöflich werden.')
	vertex[26].text.append('Oh, entschuldige bitte. Ich will den Kontakt zu dir nicht auch noch verlieren.')
	vertex[26].text.append('Okay, whatever.')
	vertex[26].text.append('Hier auf dem Tisch ist so eine Art Schaltgerät. Es läuft eigentlich nur darauf hinaus, ob ich mich für den roten oder den blauen Knopf entscheide.')
	vertex[26].text.append('Oh, und hier steht noch etwas:')
	vertex[26].text.append('"Willkommen im GRUB-Menü"')
	vertex[26].text.append('"Wählen Sie zwischen Linux und Windows."')
	vertex[26].text.append('"BLAU: Wähle Linux."')
	vertex[26].text.append('"ROT: Wähle Windows."')
	vertex[26].text.append('Also ich weiß ja, für was ich mich entscheiden würde, aber vielleicht wollen die ja auch von mir, dass ich mich so entscheide, wie ich mich eben entscheiden würde.')
	vertex[26].text.append('Deshalb überlasse ich dir die Wahl.')
	vertex[26].textb.append('Linux')
	vertex[26].textb.append('Windows')
	vertex[26].child[0] = vertex[27]
	vertex[26].child[1] = vertex[30]
	
	vertex[27].text.append('Yes, da sind meine Linuxfans!')
	vertex[27].text.append('Da bekomme ich schon wieder Bock etwas zu programmieren!')
	vertex[27].text.append('Achja... wie schön die Welt doch im Dreidimensionalen war...')
	vertex[27].text.append('Okay, ich drücke jetzt den Knopf in')
	vertex[27].text.append('3...')
	vertex[27].text.append('2...')
	vertex[27].text.append('1...')
	vertex[27].text.append('Klick! ')
	vertex[27].text.append('Da, die blaue Tür hat sich geöffnet. ')
	vertex[27].text.append('Ich laufe mal schnell hin und sehe nach, was dort ist.')
	vertex[27].textb.append('Warte, nicht so schnell!')
	vertex[27].textb.append('Ja, erzähl mir, was du siehst!')
	vertex[27].child[0] = vertex[28]
	vertex[27].child[1] = vertex[29]
	
	vertex[28].text.append('Worauf soll ich denn warten?')
	vertex[28].text.append('Ich schaue mal kurz nach, was hinter der Tür ist.')
	vertex[28].text.append('Hmmmm... ziemlich dunkel hier.')
	vertex[28].text.append('Ich muss wohl durch die Tür gehen, um etwas zu sehen.')
	vertex[28].text.append('...')
	vertex[28].text.append('Okay, ich stehe jetzt in einem leeren Raum mit blauen Wänden.')
	vertex[28].text.append('Es gibt zwei Gänge, in die ich laufen kann.')
	vertex[28].text.append('Beim linken Gang höre ich leise melodische Gitarrenmusik.')
	vertex[28].text.append('Beim rechten höre ich lauten Metal. ')
	vertex[28].text.append('Oh, das ist ja Nightwish. Da bekommt man ja direkt Partylaune.')
	vertex[28].textb.append('Folge der Gitarrenmusik. Nach links!')
	vertex[28].textb.append('Vielleicht kommt ja gleich Ever Dream! Nach rechts!')
	vertex[28].child[0] = vertex[38]
	vertex[28].child[1] = vertex[39]
	
	vertex[29].text.append('Es ist ziemlich dunkel. Um etwas zu sehen, muss ich durch die Tür gehen.')
	vertex[29].text.append('Sekunde...')
	vertex[29].text.append('Ich stehe jetzt in einem leeren Raum mit blauen Wänden.')
	vertex[29].text.append('Es gibt zwei Gänge, in die ich laufen kann.')
	vertex[29].text.append('Beim linken Gang höre ich leise melodische Gitarrenmusik.')
	vertex[29].text.append('Beim rechten höre ich lauten Metal. ')
	vertex[29].text.append('Oh, das ist ja Nightwish. Da bekommt man ja direkt Partylaune.')
	vertex[29].textb.append('Folge der Gitarrenmusik. Nach links!')
	vertex[29].textb.append('Vielleicht kommt ja gleich Ever Dream! Nach rechts!')
	vertex[29].child[0] = vertex[38]
	vertex[29].child[1] = vertex[39]
	
	vertex[30].text.append('Windows?')
	vertex[30].text.append('Nun ja, jeder trifft mal eine schlechte Entscheidung.')
	vertex[30].text.append('Also gut, dann klicke ich mal den Knopf...')
	vertex[30].text.append('Hoffentlich sieht mich dabei keiner, das ist ja echt peinlich.')
	vertex[30].text.append('Okay...')
	vertex[30].text.append('3...')
	vertex[30].text.append('2...')
	vertex[30].text.append('1...')
	vertex[30].text.append('Go!')
	vertex[30].text.append('Hahahahaha, super!')
	vertex[30].text.append('Rate mal, was passiert ist: Nichts. ')
	vertex[30].text.append('Dann drücke ich einfach nochmal einen Knopf. Welchen?')
	vertex[30].textb.append('Linux')
	vertex[30].textb.append('Windows')
	vertex[30].child[0] = vertex[27]
	vertex[30].child[1] = vertex[31]
	
	vertex[31].text.append('Was? Schon wieder Windows?')
	vertex[31].text.append('Du willst mich doch verapplen...')
	vertex[31].text.append('Wobei, mit iOS würde das ganze nur noch peinlicher werden.')
	vertex[31].text.append('Okay, na dann:')
	vertex[31].text.append('3...')
	vertex[31].text.append('2...')
	vertex[31].text.append('1...')
	vertex[31].text.append('Uuuuund...')
	vertex[31].text.append('...')
	vertex[31].text.append('Wieder nichts.')
	vertex[31].text.append('Soll ich es nochmal versuchen, oder darf ich es endlich mit Linux versuchen?')
	vertex[31].textb.append('Linux')
	vertex[31].textb.append('Windows')
	vertex[31].child[0] = vertex[27]
	vertex[31].child[1] = vertex[32]
	
	vertex[32].text.append('Eyyy, was soll das denn?')
	vertex[32].text.append('Ich bekomme hier Hämorrhoiden und Augenkrebs gleichzeitig.')
	vertex[32].text.append('Und das ist in einer zweidimensionalen Welt bestimmt zwei drittel mal so schädlich im Gegensatz zu deinem Paradies.')
	vertex[32].text.append('Aber okay, ich habe gesagt, dass ich deinem Rat folgen werde.')
	vertex[32].text.append('Also let\'s go.')
	vertex[32].text.append('3...')
	vertex[32].text.append('2...')
	vertex[32].text.append('1...')
	vertex[32].text.append('Zerooo.')
	vertex[32].text.append('Oh, wow. Die Tür hat sich jetzt nicht geöffnet, aber ich höre eine Computerstimme reden.')
	vertex[32].text.append('Ich kann sie nicht ganz orten, sie muss irgendwo von oben kommen.')
	vertex[32].text.append('Sie scheint mich vor etwas warnen zu wollen.')
	vertex[32].textb.append('Was sagt sie denn?')
	vertex[32].textb.append('Drück lieber schnell noch den blauen Knopf!')
	vertex[32].child[0] = vertex[33]
	vertex[32].child[1] = vertex[27]
	
	vertex[33].text.append('"Du fühlst dich im Moment sicher wie Alice im Wunderland, während sie in den Kaninchenbau stürzt, hm?"')
	vertex[33].text.append('Ja, wahrscheinlich hat die Stimme recht.')
	vertex[33].text.append('"Ich kann es in deinen Augen lesen."')
	vertex[33].text.append('"Du siehst aus wie ein Mensch, der das was er sieht hinnimmt, weil er damit rechnet, dass er wieder aufwacht."')
	vertex[33].text.append('"Ironischerweise ist das nah an der Wahrheit… Glaubst du an das Schicksal, Jacob?"')
	vertex[33].textb.append('Ja.')
	vertex[33].textb.append('Nein.')
	vertex[33].child[0] = vertex[34]
	vertex[33].child[1] = vertex[35]
	
	vertex[34].text.append('"Ich weiß ganz genau was du meinst. Ich will dir sagen, wieso du hier bist."')
	vertex[34].text.append('"Bedenke, dass du damit den Sinn dieses Spiel erfahren wirst und ebenso, wie man dieses Spiel gewinnt."')
	vertex[34].textb.append('Rot: Her mit der Wahrheit!')
	vertex[34].textb.append('Blau: Bleibe Sklave dieses Spiels.')
	vertex[34].child[0] = vertex[36]
	vertex[34].child[1] = vertex[27]
	
	vertex[35].text.append('"Warum nicht?"')
	vertex[35].text.append('Mir missfällt der Gedanke, mein Leben nicht unter Kontrolle zu haben.')
	vertex[35].text.append('"Ich weiß ganz genau was du meinst. Ich will dir sagen, wieso du hier bist."')
	vertex[35].text.append('"Bedenke, dass du damit den Sinn dieses Spiel erfahren wirst und ebenso, wie man dieses Spiel gewinnt."')
	vertex[35].textb.append('Rot: Her mit der Wahrheit!')
	vertex[35].textb.append('Blau: Bleibe Sklave dieses Spiels.')
	vertex[35].child[0] = vertex[36]
	vertex[35].child[1] = vertex[27]
	
	vertex[36].text.append('"Du bist nicht hier, weil du wirklich hier bist."')
	vertex[36].text.append('"Das alles hier ist fiktiv. Du bist Teil einer ausgedachten Geschichte."')
	vertex[36].text.append('"Du bist der Spielcharakter eines Spiels, dass über Ostern programmiert wurde."')
	vertex[36].text.append('"Thilo hat den größten Teil des Godot-Parts beigetragen. Die Dialoge wurden von Nicola geschrieben. Das Icon hat ebenfalls Nicola gezeichnet, den Rest hat sie aus ihren Dateinen (Moonriver) und dem Internet geklaut. Außerdem gab es viele hilfreiche Anmerkungen von unseren Testern: Hanoi, Robin (der Herr der Leistungspunkte), Jan Hott, Thilos Eltern, Niklas und Ouborny."')
	vertex[36].text.append('"Ziel des Spiels ist es, dass du am Ende mit deinen Freunden deinen Geburtstag feierst."')
	vertex[36].text.append('"Es geht nicht darum, dem System zu entkommen. Um das Spiel zu gewinnen, musst du deine Geburtstagsfeier finden."')
	vertex[36].text.append('"Du findest die Party, indem du so laut wie möglich feiern lässt."')
	vertex[36].text.append('"Lass dich nicht ablenken."')
	vertex[36].text.append('"Und lass dich von allen Freunden beglückwünschen."')
	vertex[36].text.append('"Befolgst du nicht meinem Rat, ist Game Over."')
	vertex[36].textb.append('Was war das denn bitte?')
	vertex[36].textb.append('Okay, verstanden.')
	vertex[36].child[0] = vertex[37]
	vertex[36].child[1] = vertex[37]
	
	vertex[37].text.append('Oh, sieh mal einer an.')
	vertex[37].text.append('Die rote Tür hat sich einen Spalt geöffnet.')
	vertex[37].text.append('Dann werde ich sie mal passieren.')
	vertex[37].text.append('Uiuiui, die ist aber schwergängig.')
	vertex[37].text.append('Da spürt man noch die Bugs von Windows nach.')
	vertex[37].text.append('So...')
	vertex[37].text.append('Ich stehe jetzt in einem leeren Raum mit roten Wänden.')
	vertex[37].text.append('Es gibt zwei Gänge, in die ich laufen kann.')
	vertex[37].text.append('Beim linken Gang höre ich leise melodische Gitarrenmusik.')
	vertex[37].text.append('Beim rechten höre ich lauten Metal.')
	vertex[37].text.append('Oh, das ist ja Nightwish. Da bekommt man ja direkt Partylaune.')
	vertex[37].textb.append('Folge der Gitarrenmusik. Nach links!')
	vertex[37].textb.append('Vielleicht kommt ja gleich Ever Dream! Nach rechts!')
	vertex[37].child[0] = vertex[38]
	vertex[37].child[1] = vertex[39]
	
	vertex[38].text.append('Waaaas? Ich glaube es einfach nicht.')
	vertex[38].text.append('Hier sitzt einfach Ellie mit ihrer Gitarre.')
	vertex[38].text.append('Oh...')
	vertex[38].text.append('Sie hat aufgehört zu spielen.')
	vertex[38].text.append('Hat sie mich etwa gehört?')
	vertex[38].text.append('"Hey, du kannst mir doch bestimmt helfen, oder?"')
	vertex[38].text.append('"Ich hab hier so eine Aufgabe, bei der ich zeigen muss, dass so eine komische Funktion wohldefiniert ist..."')
	vertex[38].textb.append('Äh, ja klar. Stichwort Repräsentantenunabhängigkeit...')
	vertex[38].textb.append('Nee... ich habe gerade echt andere Probleme.')
	vertex[38].child[0] = vertex[40]
	vertex[38].child[1] = vertex[42]
	
	vertex[39].text.append('"Ever felt away with me"')
	vertex[39].text.append('Well... more than away...')
	vertex[39].text.append('"Just once that all I need"')
	vertex[39].text.append('"Entwined in finding you one day"')
	vertex[39].text.append('"Ever felt away without me"')
	vertex[39].text.append('"My love, it lies so deep"')
	vertex[39].text.append('"Ever dream of me"')
	vertex[39].text.append('Achja, das ist sooo gut. Die Sängerin ist der Hammer.')
	vertex[39].text.append('Soll ich mitsingen?')
	vertex[39].textb.append('Ja, na klar! Sei du selbst!')
	vertex[39].textb.append('Nee, kannst du überhaupt singen?')
	vertex[39].child[0] = vertex[44]
	vertex[39].child[1] = vertex[51]
	
	vertex[40].text.append('"Ahhhhhh, jetzt habe ich es verstanden!"')
	vertex[40].text.append('"Das schreibe ich mir schnell auf."')
	vertex[40].text.append('"Lass uns doch danach noch einen Film schauen. Spirited Away?"')
	vertex[40].text.append('...')
	vertex[40].text.append('Ich bin so froh nicht mehr alleine zu sein.')
	vertex[40].text.append('Gleich schaue ich meinen Lieblingsfilm!')
	vertex[40].text.append('Ich wäre zwar lieber zuhause in meinem Bett, aber mit Ellie abzuhängen ist echt cool.')
	vertex[40].text.append('Ich hoffe, dass es ihr nicht unangenehm ist, dass ich sie kenne, sie mich aber nicht kennt.')
	vertex[40].text.append('Aber woher wusste sie, dass ich ihr in Mathe helfen kann, wenn sie mich nicht kennt. Stehen meine Attribute auf meiner Stirn?')
	vertex[40].text.append('...')
	vertex[40].text.append('"Okay, bin fertig! Wer macht den Film an?"')
	vertex[40].textb.append('Ich!')
	vertex[40].textb.append('Du!')
	vertex[40].child[0] = vertex[41]
	vertex[40].child[1] = vertex[41]
	
	vertex[41].text.append('"Okay, alles klar!"')
	vertex[41].text.append('Der Film geht jetzt los, schade, dass wir kein Popcorn haben.')
	vertex[41].text.append('Ich bin echt aufgeregt!')
	vertex[41].text.append('...')
	vertex[41].text.append('...')
	vertex[41].text.append('Plötzlich hört man ein komisches Klicken aus der Ecke. Soll ich etwas unternehmen? Voll gruselig.')
	vertex[41].text.append('Sehe ich jetzt auch schon Geister? ')
	vertex[41].text.append('Ahhh! Da! Ein Klicker! Als würde er gerade aus der Geisterwelt erscheinen!')
	vertex[41].text.append('Hilfe!!!')
	vertex[41].text.append('Der Klicker zerreißt Ellis Halsader!!')
	vertex[41].text.append('Neeein! Jetzt wurde ich auch gebissen. Ich bin sicherlich nicht immun.')
	vertex[41].text.append('[GAME OVER]')
	vertex[41].textb.append('Nochmal spielen')
	vertex[41].textb.append('Spiel verlassen')
	vertex[41].child[0] = vertex[0]
	vertex[41].child[1] = vertex[64]
	
	vertex[42].text.append('"Oh, was ist denn los?"')
	vertex[42].text.append('Ach, wenn ich das wüsste. Ich weiß ja nichtmal, wo ich hier bin.')
	vertex[42].text.append('"Wir sind in Arcadia Bay. Uns steht ein großer Sturm bevor."')
	vertex[42].text.append('"Ich spiele hier Gitarre, um die letzten Stunden zu genießen. Zum fliehen ist es längst zu spät."')
	vertex[42].text.append('...')
	vertex[42].text.append('Es fängt an zu Regnen. Es donnert. Es blitzt.')
	vertex[42].text.append('Sicherlich erwischt uns bald der Tornado.')
	vertex[42].text.append('Dann werden wir in die Luft katapultiert und dann werden wir sterben.')
	vertex[42].text.append('Ich werde jetzt meine letzten Stunden')
	vertex[42].textb.append('Ellie widmen.')
	vertex[42].textb.append('der Musik widmen.')
	vertex[42].child[0] = vertex[43]
	vertex[42].child[1] = vertex[43]
	
	vertex[43].text.append('Machs gut, und danke, dass du für mich da warst.')
	vertex[43].text.append('Ich werde dich in meiner mir verbleibenden Zeit nicht vergessen.')
	vertex[43].text.append('[GAME OVER]')
	vertex[43].textb.append('Nochmal spielen')
	vertex[43].textb.append('Spiel verlassen')
	vertex[43].child[0] = vertex[0]
	vertex[43].child[1] = vertex[64]
	
	vertex[44].text.append('"Would you do it with me?"')
	vertex[44].text.append('"Heal the scars and change the stars"')
	vertex[44].text.append('...')
	vertex[44].text.append('Ohh, hier singen auf einmal noch mehr Leute mit!')
	vertex[44].text.append('Woher kommen die denn alle?')
	vertex[44].text.append('Da sind ja all meine Freunde!')
	vertex[44].text.append('Naja, in verpixelter Form...')
	vertex[44].text.append('Und sie haben alle Luftballons und Geschenke in der Hand.')
	vertex[44].text.append('Ich bin endlich nicht mehr alleine! Ich fühle mich schon deutlich aufgemunterter!')
	vertex[44].text.append('Oh, und da hinten in der Ecke steht Kara aus Detroit become Human! Aber sie singt nicht mit. In ihrer Ecke scheint es ziemlich leise zu sein.')
	vertex[44].text.append('Es sieht aus, also würde sie sich gerade auf den Weg machen, soll ich versuchen noch schnell mit ihr zu reden?')
	vertex[44].textb.append('Nichts wie hin!')
	vertex[44].textb.append('Willst du dich nicht lieber zu deinen echten Freunden stellen?')
	vertex[44].child[0] = vertex[53]
	vertex[44].child[1] = vertex[45]
	
	vertex[45].text.append('Ja sicher will ich das...')
	vertex[45].text.append('Aber sind das überhaupt meine Freunde? Meine Freunde sind dreidimensional.')
	vertex[45].text.append('Und außerdem die stehen doch gleich immernoch da, Kara will sich bestimmt gleich auf den Weg machen.')
	vertex[45].text.append('Aber wohin will sie überhaupt gehen?')
	vertex[45].textb.append('Na gut, finde es heraus.')
	vertex[45].textb.append('Geh lieber zu deinen Freunden.')
	vertex[45].child[0] = vertex[53]
	vertex[45].child[1] = vertex[46]
	
	vertex[46].text.append('Okay, ist gut.')
	vertex[46].text.append('Du hast mich überzeugt.')
	vertex[46].text.append('Deine Argumente waren unschlagbar.')
	vertex[46].text.append('...nicht.')
	vertex[46].text.append('Hey, da ist ja Nicola!')
	vertex[46].text.append('Soll ich mit ihr reden?')
	vertex[46].textb.append('Ja! Was soll die Frage?')
	vertex[46].textb.append('Nein, sie ist nicht real...')
	vertex[46].child[0] = vertex[56]
	vertex[46].child[1] = vertex[47]
	
	vertex[47].text.append('Was soll das denn bedeuten?')
	vertex[47].text.append('Eben meintest du, dass ich zu meinen Freunden gehen soll.')
	vertex[47].text.append('Und jetzt sagst du mir, dass ich nicht mit ihnen reden soll, weil sie nicht real sind??')
	vertex[47].text.append('Heyyy, da steht ja auch Thilo!')
	vertex[47].text.append('Darf ich denn wenigstens mit ihm reden?')
	vertex[47].textb.append('Na gut, meinetwegen.')
	vertex[47].textb.append('Nein verdammt noch mal, er ist nicht real!')
	vertex[47].child[0] = vertex[59]
	vertex[47].child[1] = vertex[48]
	
	vertex[48].text.append('Okay, ich werde also hier rumstehen und mit niemandem ...')
	vertex[48].text.append('...')
	vertex[48].text.append('"Du willst also nicht mit uns reden, jaa?"')
	vertex[48].text.append('"Wir organisieren dir hier eine Party, und du willst also nicht einmal mit uns reden?"')
	vertex[48].text.append('"Okay, dann rede halt gar nicht mehr."')
	vertex[48].text.append('Jetzt ziehen sie die Pistolen.')
	vertex[48].text.append('Ey, das ist alles deine Schuld!')
	vertex[48].text.append('Deinetwegen habe ich nicht mit ihnen gesprochen!')
	vertex[48].text.append('Ich habe dir vertraut!')
	vertex[48].text.append('Und jetzt ...')
	vertex[48].text.append('[GAME OVER]')
	vertex[48].textb.append('Nochmal spielen')
	vertex[48].textb.append('Spiel verlassen')
	vertex[48].child[0] = vertex[0]
	vertex[48].child[1] = vertex[64]
	
	vertex[49].text.append('Thilo ist echt lieb, aber warum durfte ich nicht mit Nicola reden, ich mache doch quasi schon immer alles mit ihr...')
	vertex[49].text.append('Es gibt quasi kein Modul, das wir nicht zusammengehört haben. Naja, außer die wirklich schlechten. Da hat sie wohl ein gutes Gespür für...')
	vertex[49].text.append('"Du wolltest also nicht mit mir reden, jaa?"')
	vertex[49].text.append('Oh, was ist denn jetzt mit Nicola los?')
	vertex[49].text.append('"Wir organisieren dir hier eine Party, und du willst also nicht einmal mit mir reden?"')
	vertex[49].text.append('"Okay, dann rede halt gar nicht mehr."')
	vertex[49].text.append('Jetzt zieht sie eine Pistole.')
	vertex[49].text.append('Ey, das ist alles deine Schuld!')
	vertex[49].text.append('Deinetwegen habe ich nicht mit ihr gesprochen!')
	vertex[49].text.append('Ich habe dir vertraut!')
	vertex[49].text.append('Und jetzt ...')
	vertex[49].text.append('[GAME OVER]')
	vertex[49].textb.append('Nochmal spielen')
	vertex[49].textb.append('Spiel verlassen')
	vertex[49].child[0] = vertex[0]
	vertex[49].child[1] = vertex[64]
	
	vertex[50].text.append('Ich darf also mit Nicola reden, aber nicht mit Thilo?')
	vertex[50].text.append('Was ist das denn für eine Logik?')
	vertex[50].text.append('"Du wolltest also nicht mit uns reden, jaa?"')
	vertex[50].text.append('Oh, was ist denn jetzt mit Thilo los?')
	vertex[50].text.append('"Wir organisieren dir hier eine Party, und du willst also nicht einmal mit mir reden?"')
	vertex[50].text.append('"Okay, dann rede halt gar nicht mehr."')
	vertex[50].text.append('Jetzt zieht er eine Pistole.')
	vertex[50].text.append('Ey, das ist alles deine Schuld!')
	vertex[50].text.append('Deinetwegen habe ich nicht mit ihm gesprochen!')
	vertex[50].text.append('Ich habe dir vertraut!')
	vertex[50].text.append('Und jetzt ...')
	vertex[50].text.append('[GAME OVER]')
	vertex[50].textb.append('Nochmal spielen')
	vertex[50].textb.append('Spiel verlassen')
	vertex[50].child[0] = vertex[0]
	vertex[50].child[1] = vertex[64]
	
	vertex[51].text.append('Das Lied wird immer leiser.')
	vertex[51].text.append('"Ewer filt avai wiwat mi"')
	vertex[51].text.append('"Me low, it les so dib"')
	vertex[51].text.append('"Ewer dem ov mi"')
	vertex[51].text.append('Das Lied verstummt immer mehr, aber wenn man näher rangeht, hört man auf einmal alles verschwommen.')
	vertex[51].text.append('Es ist, als würde es eine ganz andere Person singen.')
	vertex[51].text.append('Eine gehörlose Person.')
	vertex[51].text.append('Warte mal...')
	vertex[51].text.append('Die Musik wird gar nicht leiser.')
	vertex[51].text.append('Ich glaube, ich verliere gerade mein Gehör!')
	vertex[51].text.append('Hilfe!!!')
	vertex[51].textb.append('Entspann dich, das ist bestimmt eine Illusion.')
	vertex[51].textb.append('Du weißt, was das bedeutet, oder?')
	vertex[51].child[0] = vertex[52]
	vertex[51].child[1] = vertex[52]
	
	vertex[52].text.append('Ich bin...')
	vertex[52].text.append('gehörlos...')
	vertex[52].text.append('Da kommen Leute...')
	vertex[52].text.append('Sie... ich höre sie nicht.')
	vertex[52].text.append('Sie... sie mobben mich...')
	vertex[52].text.append('Sie schubsen mich...')
	vertex[52].text.append('Aua.')
	vertex[52].text.append('Ich habe mir den Kopf aufgeschlagen.')
	vertex[52].text.append('Ich blute...')
	vertex[52].text.append('Ich werde verbluten...')
	vertex[52].text.append('[GAME OVER]')
	vertex[52].textb.append('Nochmal spielen')
	vertex[52].textb.append('Spiel verlassen')
	vertex[52].child[0] = vertex[0]
	vertex[52].child[1] = vertex[64]
	
	vertex[53].text.append('"H.... hi...."')
	vertex[53].text.append('"Ich b... bin Kara..."')
	vertex[53].text.append('"... von Karacare."')
	vertex[53].text.append('"Alles G... G... Gute zum G... G... Geburtstag."')
	vertex[53].text.append('"Tut ... mir Leid, aber ... ich muss jetzt schnell los, sonst ..."')
	vertex[53].text.append('"Sonst... bringt mich die Zeitmaschine zu weit in ... d...die Zuk...kunft."')
	vertex[53].text.append('"Hast d...du sie schon gefunden?"')
	vertex[53].text.append('"Die ... die Zeitmaschine?"')
	vertex[53].textb.append('Ja, das Ding mit den ganzen Uhren und Hebeln.')
	vertex[53].textb.append('Ähhh, nein?')
	vertex[53].child[0] = vertex[54]
	vertex[53].child[1] = vertex[55]
	
	vertex[54].text.append('"Ohh... du warst also sch...schon mal da?"')
	vertex[54].text.append('"U...und? Hast du dich...ich nicht getraut?"')
	vertex[54].text.append('Nein, es hat nicht funktioniert.')
	vertex[54].text.append('"Oh... ja, manchmal will das Ding nicht o...ohne m...ich."')
	vertex[54].text.append('"K...komm mit, ich w...werde dir helfen."')
	vertex[54].text.append('Oh man, jetzt will ich eigentlich gar nicht mehr in der Zeit reisen, ich habe doch gerade meine Freunde gefunden.')
	vertex[54].text.append('Andererseits ist Kara so lieb und so schüchtern, da kann man gar nicht nein sagen. Also was solls...')
	vertex[54].text.append('...')
	vertex[54].text.append('"S...so, da sind wir! Steig e...ein!"')
	vertex[54].text.append('Jetzt gibt es also kein zurück mehr.')
	vertex[54].text.append('"A...also ich muss in die Z...Zuk...kunft. Aber wenn du willst, kann ich dich auch in die V...Vergangenheit sch...icken."')
	vertex[54].textb.append('Reise mit Kara in die Zukunft!')
	vertex[54].textb.append('Reise alleine in die Vergangenheit!')
	vertex[54].child[0] = vertex[62]
	vertex[54].child[1] = vertex[63]
	
	vertex[55].text.append('"N...nein?"')
	vertex[55].text.append('"K...komm mit, ich z...zeige sie... sie dir!"')
	vertex[55].text.append('Da gehe ich auf jeden Fall mit! Eine Zeitmaschine, das ist ja zu verrückt. Das muss ich unbedingt sehen.')
	vertex[55].text.append('Vielleicht bringt die mich ja an einen schöneren Ort als diesen hier...')
	vertex[55].text.append('... auch wenn ich dafür vielleicht meine Freunde verlassen muss.')
	vertex[55].text.append('...')
	vertex[55].text.append('"S...so, da sind wir! Steig e...ein!"')
	vertex[55].text.append('Jetzt gibt es also kein zurück mehr.')
	vertex[55].text.append('"A...also ich muss in die Z...Zuk...kunft. Aber wenn du willst, kann ich dich auch in die V...Vergangenheit sch...icken."')
	vertex[55].textb.append('Reise mit Kara in die Zukunft!')
	vertex[55].textb.append('Reise alleine in die Vergangenheit!')
	vertex[55].child[0] = vertex[62]
	vertex[55].child[1] = vertex[63]
	
	vertex[56].text.append('"Hey Jacob!!!"')
	vertex[56].text.append('"Wir studieren jetzt schon seit dreieinhalb Jahren zusammen Mathematik."')
	vertex[56].text.append('"Und wir haben quasi alles gemeinsam gemacht."')
	vertex[56].text.append('"Aber in der Zeit haben wir nicht nur gelernt, was bipartite Graphen, normale Untergruppen und Manigfaltigkeiten sind."')
	vertex[56].text.append('"(Okay, letzteres verstehe ich zugegebenermaßen immernoch nicht... hehe.)"')
	vertex[56].text.append('"Wir haben uns auch einander kennengelernt, und dafür bin ich unglaublich dankbar."')
	vertex[56].text.append('"Wenn du dabei bist, gibt es immer was zu lachen! Aber du hast auch immer einen neuen guten Song parat."')
	vertex[56].text.append('"Oder zeigst mir mal wieder ein cooles neues Spiel. Oder erklärst mir zum dritten Mal mit voller Geduld den Mapping Space."')
	vertex[56].text.append('"Oder zum achzigsten Mal, was dieses wohldefiniert eigentlich ist."')
	vertex[56].textb.append('Hehe, ja... wohldefiniert...')
	vertex[56].textb.append('Ach komm, das kannst du doch jetzt.')
	vertex[56].child[0] = vertex[57]
	vertex[56].child[1] = vertex[57]
	
	vertex[57].text.append('"Als Dankeschön für deine Geduld..."')
	vertex[57].text.append('"... und dafür dass du mir das Programmieren beigebracht hast..."')
	vertex[57].text.append('"... und einfach nur dafür, dass es dich gibt,..."')
	vertex[57].text.append('"... auf viele weitere Jahre mit dir..."')
	vertex[57].text.append('"... bald hoffentlich auch zum gemeinsamen Programmieren..."')
	vertex[57].text.append('"... und weiterhin zum Zocken..."')
	vertex[57].text.append('"... und auch mal zum Wandern gehen..."')
	vertex[57].text.append('"... alles Gute zum Geburtstag!"')
	vertex[57].textb.append('Aww, dankeschön!')
	vertex[57].textb.append('Das ist aber lieb, danke danke!')
	vertex[57].child[0] = vertex[58]
	vertex[57].child[1] = vertex[58]
	
	vertex[58].text.append('Da geht es einem doch gleich schon viel besser.')
	vertex[58].text.append('Dafür sind Freunde doch da.')
	vertex[58].text.append('Hey, da ist auch Thilo!')
	vertex[58].textb.append('Dann rede doch mit ihm!')
	vertex[58].textb.append('Ignorier ihn besser, genug Geburtstag für heute. Ist eh alles fake.')
	vertex[58].child[0] = vertex[60]
	vertex[58].child[1] = vertex[50]
	
	vertex[59].text.append('"Hallo Jacob!"')
	vertex[59].text.append('"Alles Gute zum Geburtstag."')
	vertex[59].text.append('"Nicola zwingt mich hier einen Text zu schreiben."')
	vertex[59].text.append('"Aber dazu habe ich gar keine Lust, weil ich nicht so gerne Texte schreibe."')
	vertex[59].text.append('"Deswegen schreibt das hier gerade trotzdem Nicola."')
	vertex[59].text.append('"Trotzdem danke für alles und so."')
	vertex[59].text.append('"Und schön, dass du geboren bist."')
	vertex[59].text.append('"Joo..."')
	vertex[59].text.append('"Bis bald mal."')
	vertex[59].textb.append('Haha, danke.')
	vertex[59].textb.append('Lol. Aber danke.')
	vertex[59].child[0] = vertex[49]
	vertex[59].child[1] = vertex[49]
	
	vertex[60].text.append('"Hallo Jacob!"')
	vertex[60].text.append('"Alles Gute zum Geburtstag."')
	vertex[60].text.append('"Nicola zwingt mich hier einen Text zu schreiben."')
	vertex[60].text.append('"Aber dazu habe ich gar keine Lust, weil ich nicht so gerne Texte schreibe."')
	vertex[60].text.append('"Deswegen schreibt das hier gerade trotzdem Nicola."')
	vertex[60].text.append('"Trotzdem danke für alles und so."')
	vertex[60].text.append('"Und schön, dass du geboren bist."')
	vertex[60].text.append('"Joo..."')
	vertex[60].text.append('"Bis bald mal."')
	vertex[60].textb.append('Haha, danke.')
	vertex[60].textb.append('Lol. Aber danke.')
	vertex[60].child[0] = vertex[61]
	vertex[60].child[1] = vertex[61]
	
	vertex[61].text.append('Ich freue mich so über die Glückwünsche.')
	vertex[61].text.append('Und über die Feier von meinen Freunden.')
	vertex[61].text.append('Es ist genauso gut, wie in der dreidimensionalen Welt.')
	vertex[61].text.append('Ich werde die Feier jetzt noch weiter genießen.')
	vertex[61].text.append('Systemnachricht wird empfangen:')
	vertex[61].text.append('Du hast das Spiel gewonnen.')
	vertex[61].text.append('PS.: Wir Windowsnutzer verstehen warum.')
	vertex[61].text.append('[THE END]')
	vertex[61].textb.append('Nochmal spielen')
	vertex[61].textb.append('Spiel verlassen')
	vertex[61].child[0] = vertex[0]
	vertex[61].child[1] = vertex[64]
	
	vertex[62].text.append('"Ok...ay, alles kla...r! Nu...r noch diesen einen H...hebel umlegen..."')
	vertex[62].text.append('Die Uhren drehen sich auf einmal viel schneller. Und noch schneller. Und noch schneller. Sie hören nicht auf sich zu drehen. ')
	vertex[62].text.append('Kara sieht auf einmal beunruhigt aus. Sie beführchtet, dass wir zu lange gebraucht haben.')
	vertex[62].text.append('"Piep. Piep. Piiiep."')
	vertex[62].text.append('"K...eine Sorge, das Geräusch...sch ist normal. Wir werden bald da s...ein."')
	vertex[62].text.append('Und da waren wir. In der Zukunft.')
	vertex[62].text.append('Ein Schatten fliegt über uns hinweg. Ist das vielleicht eine dieser hochmodernen Züge? Äh... im Zweidimensionalen?')
	vertex[62].text.append('Kara sieht immer noch beunruhigt aus. Sie meint, wir sind tatsächlich zu weit gereist. Hier ist sie nicht zuhause. Das jagt mir echt Angst ein.')
	vertex[62].text.append('Und da wird sie von einer Hand aus dem Himmel gegriffen und nach oben gehoben. Sie schreit. Was soll ich nur machen, weglaufen? Sie wird zerdrückt.')
	vertex[62].text.append('Das ist mein Ende... wo sind wir? Da sehe ich einen Eva auf mich zurennen. Aber mich hat jetzt auch eine Hand ergriffen.')
	vertex[62].text.append('[GAME OVER]')
	vertex[62].textb.append('Nochmal spielen')
	vertex[62].textb.append('Spiel verlassen')
	vertex[62].child[0] = vertex[0]
	vertex[62].child[1] = vertex[64]
	
	vertex[63].text.append('"Ok...kay, machs gu...ut."')
	vertex[63].text.append('Die Uhren fangen an sich rückwärts zu drehen.')
	vertex[63].text.append('Sie drehen sich immer schneller...')
	vertex[63].text.append('...und schneller.')
	vertex[63].text.append('Jetzt piept etwas. Was hat das zu bedeuten?')
	vertex[63].text.append('Mist, wäre ich mit Kara zusammen gereist, hätte sie mir sagen können, was das ist. ')
	vertex[63].text.append('Aber vielleicht will ich es gar nicht wissen... Es würde mich bestimmt nur noch mehr beunruhigen.')
	vertex[63].text.append('Oh, jetzt fängt es hier an zu dampfen.')
	vertex[63].text.append('...')
	vertex[63].text.append('Ich bin da! Hier ist... ein Panzerbär? Mit Rüstung. Ich kenne diese Tierchen, ich versuche es mal zu streicheln.')
	vertex[63].text.append('Oh, er hat meine Hand abgebissen. Ich... verblute.')
	vertex[63].text.append('[GAME OVER]')
	vertex[63].textb.append('Nochmal spielen')
	vertex[63].textb.append('Spiel verlassen')
	vertex[63].child[0] = vertex[0]
	vertex[63].child[1] = vertex[64]
