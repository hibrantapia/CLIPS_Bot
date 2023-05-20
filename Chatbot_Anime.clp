;;-----------------------------------------------------
;; Autores:
;; Alan Uriel Merlan Esquivel - A01656612
;; Hector Hibran Tapia Fernandez - A01661114
;;
;; Hecho el 02/05/2023
;;----------------------------------------------------

;; Este código es de un chatbot que ayuda a los usuarios a elegir animes según sus preferencias de género y subgénero.

;;Regla en caso de que no pueda reconocer lo dicho por el usuario
(defrule nose (declare (salience -1)) (not (termino)) => (printout t "No entiendo que quieres decir" crlf))
;;Pregunta por la utilidad del bot para el usuario
(defrule pregunta_1 (declare (salience 20)) => 
(printout t "¿Quieres ver un anime(S=si N=No)?" crlf)
(assert (p1 (read))))
;; En caso de no ser util, termina automaticamente
(defrule res_1_2 (declare (salience 19)) (p1 N)=>
(printout t "Lo lamento, no puedo ayudarte entonces" crlf) (assert (termino)))

;;En caso de serlo, continua con el siguiente set de preguntas
(defrule pregunta_2 (declare (salience 19)) (p1 S) => 
(printout t "Qué público objetivo prefieres. (Shonen,Shoujo,Seinen)?" crlf)
(assert (p2 (read))))

;;Prepara la respuesta para todos los tipos de respuesta posible: Shonen, Shoujo, Seinen. Preguntando una cosa diferente en cada opción
(defrule res_2_1 (declare (salience 18)) (p2 Shonen)=>
(printout t "El Shonen es el genero dirigido a adolecentes masculinos" crlf)
(printout t "Qué tipo de Shonen quieres:(mejor_clasificados, isekai, romance, aventura)" crlf)
(assert (p3 (read)))
)

(defrule res_2_2 (declare (salience 18)) (p2 Shoujo)=>
(printout t "El Shoujo es el genero dirigido a adolecentes femeninas" crlf)
(printout t "Qué tipo de Shoujo quieres:(mejor_clasificados, drama, heart-warming, comedia)" crlf)
(assert (p3 (read)))
)

(defrule res_2_3 (declare (salience 18)) (p2 Seinen)=>
(printout t "El Seinen es el genero dirigido a adultos" crlf)
(printout t "Qué tipo de Seinen quieres:(mejor_clasificados, fantasia, tranquilos, thriller)" crlf)
(assert (p3 (read)))
)

;;Brinda las respuestas si el usuario eligió Shonen y luego eligió mejor_clasificados, isekai, romance, aventura
(defrule pregunta_2_1_1 (declare (salience 18)) (p3 mejor_clasificados) (p2 Shonen) => 
(printout t "Los animes Shonen con mejor clasificacion son los siguientes: " crlf)
(printout t "Hunter x Hunter, Fullmetal Alchemist: Brotherhood, Yuu Yuu Hakusho, Samurai Champloo, Jojo's Bizarre Adventure, Attack on Titan y One Piece " crlf)
(assert (termino))
 )

(defrule pregunta_2_1_2 (declare (salience 18)) (p3 isekai) (p2 Shonen) =>
(printout t "Los animes Shonen, que son isekai, que te podría recomendar son: " crlf)
(printout t "Isekai Ojisan, Fantasy Bishoujo Juniku Ojisan To, Mushoku Tensei: Isekai Ittara Honki Dasu, Sonny Boy, Re:Zero, Sword Art Online y No Game No Life " crlf)
(assert (termino))
)

(defrule pregunta_2_1_3 (declare (salience 18)) (p3 romance) (p2 Shonen) =>
(printout t "Los animes Shonen con una pizca de amor son: " crlf)
(printout t "Kobayashi-san Chi no Maid Dragon, Inuyasha, Gundam SEED, Beastars, Toradora! y Your Lie in April " crlf)
(assert (termino))
)

(defrule pregunta_2_1_4 (declare (salience 18)) (p3 aventura) (p2 Shonen) =>
(printout t "Los animes Shonen de aventuras son: " crlf)
(printout t "One Piece, Naruto, Bleach, Dragon Ball, Fairy Tail, Magi y Seven Deadly Sins " crlf)
(assert (termino))
)

;;Brinda las respuestas si el usuario eligió Shoujo y luego eligió mejor_clasificados, drama, heart-warming, comedia
(defrule pregunta_2_2_1 (declare (salience 18)) (p3 mejor_clasificados) (p2 Shoujo) =>
(printout t "Los animes Shoujo con mejor clasificacion son los siguientes: " crlf)
(printout t "The Raven of the Inner Palace, Fruits Basket, Watashi ga Motete Dosunda, Ore Monogatari!!, Kamisama Kiss, Ouran High School Host Club y Nana " crlf)
(assert (termino))
)

(defrule pregunta_2_2_2 (declare (salience 18)) (p3 drama) (p2 Shoujo) =>
(printout t "Los animes Shoujo centrados en el drama son los siguientes: " crlf)
(printout t "Ouran High School Host Club, Nana, Anohana, Toradora, Clannad y Ef: A Tale of Memories" crlf)
(assert (termino))
)

(defrule pregunta_2_2_3 (declare (salience 18)) (p3 heartwarming) (p2 Shoujo) =>
(printout t "Los animes Shoujo que te dejaron con el corazón tranquilo: " crlf)
(printout t "La asesina del romance, Kaguya-sama, Plastic Memories, Kimi ni Todoke y A Silent Voice " crlf)
(assert (termino))
)

(defrule pregunta_2_2_4 (declare (salience 18)) (p3 comedia) (p2 Shoujo) =>
(printout t "Los animes Shoujo de comedia son: " crlf)
(printout t "Ouran High School Host Club, Gekkan Shoujo Nozaki-kun, Lovely Complex y Kaichou wa Maid-sama!" crlf)
(assert (termino))
)

;;Brinda las respuestas si el usuario eligió Seinen y luego eligió mejor_clasificados, fantasía, tranquilos, thriller
(defrule pregunta_2_3_1 (declare (salience 18)) (p3 mejor_clasificados) (p2 Seinen) =>
(printout t "Los animes Seinen mejor clasificados son: " crlf)
(printout t "Monster, Ghost in the Shell: Stand Alone Complex, Berserk, Steins;Gate, Cowboy Bebop y Psycho-Pass " crlf)
(assert (termino))
)

(defrule pregunta_2_3_2 (declare (salience 18)) (p3 fantasia) (p2 Seinen) =>
(printout t "Los animes Seinen de fantasía que te puedo recomendar: " crlf)
(printout t "Panty & Stocking with Garterbelt, Madoka Magica, Mononoke, Made in Abyss, Claymore y Fate/Zero" crlf)
(assert (termino))
)

(defrule pregunta_2_3_3 (declare (salience 18)) (p3 tranquilos) (p2 Seinen) =>
(printout t "Los animes Seinen tranquilos que te puedo recomendar: " crlf)
(printout t "Kuzu no Honkai, Danna ga Nani wo Itteiru ka Wakaranai Ken, Wakako-zake, Mushishi y Aria the Animation" crlf)
(assert (termino))
)

(defrule pregunta_2_3_4 (declare (salience 18)) (p3 thriller) (p2 Seinen) =>
(printout t "Los animes Seinen de thriller que te puedo recomendar: " crlf)
(printout t "Death Note, Monster, Paranoia Agent, Psycho-Pass y Terror in Resonance" crlf)
(assert (termino))
)