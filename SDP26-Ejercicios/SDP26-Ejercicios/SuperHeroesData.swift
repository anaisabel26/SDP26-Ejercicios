// SuperHeroesData.swift
// Usa el enum `PoderesSuperheroes` para las habilidades.

import Foundation

struct SuperHero {
    let id: UUID
    let nombreReal: String
    let apodo: String
    let descripcion: String
    let edad: Int
    let poderes: [PoderesSuperheroes]
    let imagen: String

    init(id: String, nombreReal: String, apodo: String, descripcion: String, edad: Int, poderes: [PoderesSuperheroes], imagen: String) {
        guard let uuid = UUID(uuidString: id) else {
            preconditionFailure("UUID inválido para SuperHero(\(apodo)): \(id)")
        }
        self.id = uuid
        self.nombreReal = nombreReal
        self.apodo = apodo
        self.descripcion = descripcion
        self.edad = edad
        self.poderes = poderes
        self.imagen = imagen
    }
}

let SUPERHEROES: [SuperHero] = [
    SuperHero(
        id: "f0c6b58f-4d8a-4b8c-8d2a-12b4834e0a98",
        nombreReal: "Juan Martínez",
        apodo: "TeleMente",
        descripcion: "Después de un accidente en un laboratorio de neurociencia, Juan adquirió la capacidad de leer y manipular pensamientos.",
        edad: 32,
        poderes: [.telepatia],
        imagen: "telemente"
    ),
    SuperHero(
        id: "a07c5e7b-a2b3-4a0e-9e2c-29f2d7b4d078",
        nombreReal: "Laura Blanco",
        apodo: "Ala de Águila",
        descripcion: "Laura siempre soñó con volar. Un encuentro con un águila mística le otorgó el don del vuelo.",
        edad: 28,
        poderes: [.vuelo],
        imagen: "alaDeAguila"
    ),
    SuperHero(
        id: "b627f3c3-3f8a-41a1-9c81-2f4255b5f1fc",
        nombreReal: "Miguel Torres",
        apodo: "Roca",
        descripcion: "Miguel puede levantar objetos de toneladas sin esfuerzo gracias a una maldición de un dios olvidado.",
        edad: 35,
        poderes: [.superFuerza],
        imagen: "roca"
    ),
    SuperHero(
        id: "d75f3c93-2d5a-4a1e-8f1c-3e5d6c1e0b79",
        nombreReal: "Elena García",
        apodo: "Sombra",
        descripcion: "Elena descubrió su habilidad para volverse invisible después de un misterioso encuentro en un bosque encantado. Ahora, utiliza su poder para operar en secreto y proteger a los inocentes.",
        edad: 29,
        poderes: [.invisibilidad, .teletransportacion],
        imagen: "sombra"
    ),
    SuperHero(
        id: "e62d4c7b-9c5a-4d3e-8a3c-2f9d5e5d1a86",
        nombreReal: "Daniel Ortiz",
        apodo: "Cronos",
        descripcion: "Daniel puede alterar y viajar en el tiempo después de encontrar un antiguo reloj en una excavación arqueológica. Con este poder, busca corregir errores del pasado y asegurar un futuro mejor.",
        edad: 34,
        poderes: [.manipulacionDelTiempo],
        imagen: "cronos"
    ),
    SuperHero(
        id: "f23d5e7a-2b4c-4a9d-9e3d-2d5e6f7e0g89",
        nombreReal: "Isabel Ruiz",
        apodo: "Elementa",
        descripcion: "Isabel puede controlar y manipular los elementos naturales. Un ritual ancestral le otorgó el don de dominar fuego, agua, tierra y aire a su antojo.",
        edad: 27,
        poderes: [.controlElemental, .telepatia],
        imagen: "elementa"
    ),
    SuperHero(
        id: "b43g5j78-1a2d-5g6h-7i8j-9k1l2m3n4o5p",
        nombreReal: "Luis Fernández",
        apodo: "Reflejo",
        descripcion: "Luis puede crear duplicados exactos de sí mismo que actúan de forma independiente. Estos duplicados son temporales y desaparecen después de un tiempo. Utiliza este poder para estar en múltiples lugares a la vez, ayudando a quien lo necesita.",
        edad: 28,
        poderes: [.duplicacion],
        imagen: "reflejo"
    ),
    SuperHero(
        id: "c56n7o89-0p9o-8l7m-6n5b-4v3c2x1z0a9s",
        nombreReal: "Carmen Morales",
        apodo: "Eco",
        descripcion: "Carmen puede imitar y amplificar cualquier sonido que haya escuchado, utilizando estas habilidades para comunicarse, desorientar a sus enemigos o incluso como una forma de sonar.",
        edad: 26,
        poderes: [.imitacionDeSonido, .amplificacionDelSonido],
        imagen: "eco"
    ),
    SuperHero(
        id: "d67p8q90-1z2a-3x4w-5e6r-7t8y9u0i1o2p",
        nombreReal: "Miguel Álvarez",
        apodo: "Pulso",
        descripcion: "Miguel puede generar y controlar vibraciones a su antojo. Ya sea para causar terremotos, crear barreras de ondas de choque o incluso volar al vibrar a altas velocidades.",
        edad: 30,
        poderes: [.generacionDeVibraciones, .controlDeVibraciones],
        imagen: "pulso"
    ),
    SuperHero(
        id: "e78r9s01-2t3y-4u5i-6o7p-8a9s0d1f2g3h",
        nombreReal: "Beatriz Jiménez",
        apodo: "LuzEstelar",
        descripcion: "Beatriz puede manipular y emitir luz de diferentes intensidades y colores. Utiliza esta habilidad para iluminar lugares oscuros, crear ilusiones ópticas o incluso emitir destellos cegadores para defenderse de adversarios.",
        edad: 29,
        poderes: [.manipulacionDeLaLuz, .emisionDeLuz],
        imagen: "luzEstelar"
    ),
    SuperHero(
        id: "f89t0a12-3b4c-5d6e-7f8g-9h0i1j2k3l4m",
        nombreReal: "Pedro Sánchez",
        apodo: "Giro",
        descripcion: "Pedro tiene la habilidad de girar sobre sí mismo a velocidades increíbles, creando tornados o simplemente moviéndose rápidamente de un lugar a otro. A menudo se le ve como un torbellino en movimiento cuando usa su poder al máximo.",
        edad: 31,
        poderes: [.giroRapido, .creacionDeTornados],
        imagen: "giro"
    ),
    SuperHero(
        id: "g90u1b23-4c5d-6e7f-8g9h-0i1j2k3l4m5n",
        nombreReal: "Sara López",
        apodo: "Geo",
        descripcion: "Sara puede manipular la tierra y las rocas a su antojo. Desde levantar muros de piedra hasta causar pequeños terremotos, Geo es una fuerza a tener en cuenta cuando está conectada con el suelo.",
        edad: 27,
        poderes: [.manipulacionDeLaTierra, .creacionDeRocas],
        imagen: "geo"
    ),
    SuperHero(
        id: "f2d96ab3-df71-4f0e-8b44-bd7f8e7f5fca",
        nombreReal: "Lucas Ortega",
        apodo: "Vórtex",
        descripcion: "",
        edad: 29,
        poderes: [.manipulacionDelClima, .teletransportacion],
        imagen: "vortex"
    ),
    SuperHero(
        id: "c23f1b9d-97f3-4b5f-9044-e69d5a7f8c8b",
        nombreReal: "Diana Ruiz",
        apodo: "Psique",
        descripcion: "",
        edad: 32,
        poderes: [.manipulacionMental, .telepatia],
        imagen: "psique"
    ),
    SuperHero(
        id: "1a4f20b8-1f97-42e4-a0d2-b0ec1f91b68f",
        nombreReal: "Javier Molina",
        apodo: "Titán",
        descripcion: "",
        edad: 38,
        poderes: [.superFuerza, .invulnerabilidad],
        imagen: "titan"
    ),
    SuperHero(
        id: "f36b48b0-5f6a-4359-b169-a1d5c587db1c",
        nombreReal: "Carla Martínez",
        apodo: "Armadura",
        descripcion: "",
        edad: 28,
        poderes: [.pielMetalica, .superFuerza],
        imagen: "armadura"
    ),
    SuperHero(
        id: "4a83cb7a-8b8f-4235-96a5-b9d6c00854c8",
        nombreReal: "Hugo Valdez",
        apodo: "Tempestad",
        descripcion: "",
        edad: 34,
        poderes: [.manipulacionDelClima, .vuelo],
        imagen: "tempestad"
    ),
    SuperHero(
        id: "9fe2a0c7-478e-44a5-9866-fd545d3f8e8e",
        nombreReal: "Lucía Ortega",
        apodo: "Sirena",
        descripcion: "",
        edad: 26,
        poderes: [.manipulacionDelAgua, .comunicacionConVidaMarina, .transformacionEnFormaAcuatica],
        imagen: "sirena"
    ),
    SuperHero(
        id: "1faa76f6-7e1d-4f0d-9c0d-6c1c2d4c6b69",
        nombreReal: "Tomás Guerrero",
        apodo: "Eclipse",
        descripcion: "",
        edad: 31,
        poderes: [.manipulacionDeSombras, .teletransportacionATravesDeSombras],
        imagen: "eclipse"
    ),
    SuperHero(
        id: "f7cc673c-e1f0-4d2f-8f6d-ea3a1f2eefc9",
        nombreReal: "Sofía Ríos",
        apodo: "Fénix",
        descripcion: "",
        edad: 29,
        poderes: [.regeneracion, .manipulacionDelFuego, .vuelo],
        imagen: "fenix"
    ),
]
