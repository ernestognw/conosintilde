

str = """

afonía	distraído	mármol
ágil	dócil	mástil
agonía	dólar	Méndez
álbum	Domínguez	Néstor
alcancía	dormía	observaría
alegría	dúo	orografía
alegría	ecología	Óscar
analogía	egoísta	podría
ángel	Elías	poesía
antología	energía	policía
apología	estéril	poliéster
árbol	éter	portátil
automóvil	etología	prócer
azúcar	fácil	psicología
bahía	Félix	púber
biología	fémur	récord
cadáver	Filosofía	reía
camaradería	flúor	revólver
cáncer	fórceps	río
carácter	frágil	Rodríguez
cerrajería	fútbol	rugía
césar	Geología	Sánchez
césped	grúa	sandía
cirugía	hábil	símil
clímax	haría	Suárez
cómic	Hernández	tóner
cóndor	heroína	tórax
Cortázar	inverosímil	trébol
cráter	ítem	túnel
cría	kétchup	versátil
Cristóbal	lápiz	vigía
dátil	líder	volátil
débil	línea	zoología

abanico	consume	mochila
abasto	corre	muestra
abeja	cortinas	nube
abrigo	cuaderno	ojos
abuela	cuanto	ombligo
acuarela	cuchara	Organiza
adorno	cuello	oso
agua	cuenta	pantera
aire	desordena	parlante
alfombra	diente	pelo
amarillo	disco	pera
Amazonas	domingo	perro
antes	elefante	pestañas
arena	ensalada	piedra
Argentina	espera	pierna
asume	estadio	plancha
atento	estima	playa
avispa	estrellas	pluma
banana	estructura	pone
banco	figura	puerto
banquero	fruta	redacta
bota	fuente	remera
buena	galaxias	resumen
busca	ganado	revisa
caballo	gato	rinoceronte
cabello	genio	roca
cable	gordo	rompe
cachetes	gusano	ropa
calzado	hormigas	saludo
caminata	ingenio	santo
colcha	jirafa	silla
colmillo	juega	suerte
come	jugo	superpone
conjuro	mesa	tapado

"""

words = str.split()
array = """			<array>
				"""
for i in range(0, len(words)) :
    temp = """<array>
					"""
    temp += "<string>" + words[i][:-2] + "</string>"
    temp += """
					"""
    temp += "<string>" + words[i][-2:] + "</string>"
    temp += """
				</array>
				"""
    array += temp

array += """
			"""

print(array)


agudasPath = "/Users/rodrigocasale/Documents/Tec/semestre 6/iOS/conosintilde/scripts/graves.txt"
f = open(agudasPath, "w")
f.write(array)
f.close()

#open and read the file after the appending:
f = open(agudasPath, "r")
print(f.read())