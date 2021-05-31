

str = """

antibiótico	estadístico	sarcástico
árabe	económico	química
brócoli	clásico	satélites
cámaras	cómicos	terrícola
catástrofe	cónyuge	túnica
célebre	cerámica	pájaro
célula	centímetro	página
círculo	milímetro	oxígeno
cópula	nanómetro	geológico
depósito	carátula	gráficas
drástico	caóticos	heterogéneo
ejército	cálido	homogéneo
fanático	aromático	humorístico
fantástico	atlético	humanístico
física	déficit	jurásico
fonética	foráneo	lógico
geográfico	pólvora	mágico
ábaco	utópico	obstáculo
académico	sábado	océano
afónico	párroco	ortográfico
película	héroe	pálido
vándalo	lógica	paréntesis
América	máquina	psíquica
escéptico	fábula	pícaro
ecológico	escuálido	químico
crónicas	inequívoco	rectángulo
ángulo	penúltimo	ridículo
árboles	pirámides	satánico
hipódromo	plástico	teléfono
éxtasis	relámpago	término
tentáculos	rápido	último
vértice	recóndito	vértigo
libélula	sépalo	víbora
números	simpático	vómito
estético	romántico	zodíaco

"""

counter1 = 0
counter2 = 0

words = str.split()
array = """			<array>
				"""
for i in range(0, len(words)) :
    counter1 += 1
    if(len(words[i]) >= 6):
        counter2 += 1
        firstHalf = len(words[i])-4
        print(len(words[i]))
        temp = """<array>
                        """
        temp += "<string>" + words[i][0:firstHalf] + "</string>"
        temp += """
                        """
        temp += "<string>" + words[i][-4:] + "</string>"
        temp += """
                    </array>
                    """
        array += temp

array += """
			"""

print(array)

print(counter1)
print(counter2)


agudasPath = "/Users/rodrigocasale/Documents/Tec/semestre 6/iOS/conosintilde/scripts/esdrujulas.txt"
f = open(agudasPath, "w")
f.write(array)
f.close()

#open and read the file after the appending:
f = open(agudasPath, "r")