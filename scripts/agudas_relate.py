

str = """
Abarcar	Correr	Preguntar
Abrazar	Disolver	Prescribir
Acabar	Decidir	Proseguir
Acomodar	Decir	Protector
Acusar	Deidad	Quedar
Adaptador	Dental	Querer
Adjuntar	Depositar	Rectangular
Adoptar	Desinflar	Redactar
Aerosol	Editor	Regalar
Afectividad	Emprendedor	Regresar
Afeitar	Encadenar	Rentar
Afinidad	Encantar	Repatriar
Ajusticiar	Entrar	Responder
Amar	Esconder	Retribuir
Ampliar	Escribir	Rezar
Andar	Esencial	Rondar
Arancer	Especial	Salvar
Ascender	Espiritual	Salir
Ascensor	Estipular	Saltar
Atril	Explotar	Saludar
Ayer	Exportar	Sanear
Azul	Febril	Sector
Bailar	General	Señalar
Bordar	Genital	Señor
Bordear	Gritar	Sentar
Borrar	Gustar	Sentir
Bostezar	Inflar	Sexual
Boxear	Jugar	Social
Branquial	Llevar	Solar
Bronceador	Maldad	Soltar
Brutal	Maldecir	Soñar
Burbujear	Manchar	Suponer
Cabal	Mayor	Suspender
Calcar	Mental	Temblor
Cambiar	Monitor	Titular
Caminar	Mostrar	Trabajar
Cansar	Mundial	Traer
Cantar	Mural	Traidor
Cantor	Musical	Ungir
Cepillar	Nacional	Universal
Circular	Nadar	Universidad
Collar	Obsequiar	Untar
Colocar	Orinar	Vecindad
Combatir	Panel	Vender
Comprar	Particular	Veracidad
Comprimir	Partir	Verdad
Conocer	Poner	Visor
Contador	Pelear	Vivir
Contar	Percibir	Volver
Corral	Pulir	Zarandear

acción	doblón	París
acordeón	dominó	paté
además	ecuación	perdición
adicción	elegí	personalicé
adiós	encontré	Perú
adminiración	enfrentó	pipí
adminisión	enredón	portugués
alemán	esquí	puntapié
algún	estrés	puré
amó	exclamación	quizás
Andrés	explicación	raíz
anís	explicaré	rascará
arnés	francés	ratón
así	fundó	Raúl
autobús	ilustración	rebelión
aviación	información	religión
avión	informó	revés
balón	interés	rincón
baúl	irlandés	riñón
bebé	jabalí	rompió
botón	jabón	rotación
burgués	jamás	rotó
busqué	japonés	rubí
café	Jesús	salchichón
cajón	José	salmón
calzón	jugará	Salomón
camarón	Julián	saudí
camión	lección	sección
campeón	león	según
canción	limón	señó
capitán	limpió	siamés
cebú	llegó	sofá
cocinó	maíz	también
colchón	malecón	televisión
colibrí	mamá	terminación
comió	maní	tiburón
compás	marcó	timón
comprendió	marroquí	Tomás
común	medicación	tomó
confesará	menú	trabajará
confirmación	misión	traicioné
confirmó	mostraré	transición
contaré	multiplicación	traslación
cordobés	murió	trasladó
cortés	Nicolás	turrón
danés	ocasión	varón
decidí	ocasionó	veintidós
decisión	operará	veintitrés
demás	organización	vermú
descortés	país	visión
después	Panamá	vivió
dieciséis	pantalón	votación
diré	papá	voté
dividió	paquistaní	vudú

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


agudasPath = "/Users/rodrigocasale/Documents/Tec/semestre 6/iOS/conosintilde/scripts/agudas.txt"
f = open(agudasPath, "w")
f.write(array)
f.close()

#open and read the file after the appending:
f = open(agudasPath, "r")
print(f.read())