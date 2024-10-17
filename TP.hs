import Utiles

--1.⁠ ⁠Modelar el tipo de dato `Organizacion`. Tener en cuenta todos los campos mencionados.

data Organizacion = UnaOrganizacion {
    index:: Int,
    organizationId::String,
    name::String,
    website::String,
    country::String,
    description::String,
    founded:: Int,
    industry::String,
    employees:: Int
} deriving (Show)



-- Conversión de una TuplaDeOrganizacion a Organizacion
fromTuplaToOrganizacion :: TuplaDeOrganizacion -> Organizacion
fromTuplaToOrganizacion (index, organizationId, name, website, country, description, founded, industry, employees) = UnaOrganizacion index organizationId name website country description founded industry employees

testing::[Organizacion]
testing = [orgUno, orgDos, orgTres, orgCuatro, orgCinco, orgSeis, orgSiete, orgOcho, orgNueve, orgDiez, orgOnce]
orgUno = UnaOrganizacion 1 "FAB0d41d5b5d22c" "Ferrell LLC" "https://price.net/" "Papua New Guinea" "Horizontal empowering knowledgebase" 1990 "Plastics" 3498
orgDos = UnaOrganizacion 2 "A7EdDEA9FaDC52" "Mckinney Riley and Day" "http://www.hall-buchanan.info/" "Finland" "User-centric system-worthy leverage" 2015 "Ceramics" 4952
orgTres = UnaOrganizacion 3 "bFED1ADAE4bcC1" "Hester Ltd" "http://sullivan-reed.com/" "China" "Switchable scalable moratorium" 1971 "Public Safety" 5287
orgCuatro = UnaOrganizacion 4 "bFC1Be8a4ce42f" "Holder-Sellers" "https://becker.com/" "Turkmenistan" "De-engineered systemic artificial intelligence" 2004 "Automotive" 921
orgCinco = UnaOrganizacion 5 "eE8A6a4Eb96C24" "Mayer Group" "http://www.brewer.com/" "Mauritius" "Synchronized needs-based challenge" 1991 "Transportation" 7870
orgSeis = UnaOrganizacion 6 "C2d41b7c2d8e22b" "Garcia Inc" "https://garcia.org/" "Brazil" "Innovative 24/7 logistics" 1985 "Plastics" 4321
orgSiete = UnaOrganizacion 7 "D8F3e1c6a9b7E4F" "Anderson-Morris" "http://anderson-morris.com/" "Mexico" "Proactive impactful architecture" 2003 "Plastics" 5678
orgOcho = UnaOrganizacion 8 "F9A7E3B1C8d4E9F" "Thompson and Sons" "https://thompson-sons.net/" "United States" "Robust human-centered interface" 1995 "Retail" 7543
orgNueve = UnaOrganizacion 9 "A1C4E9B5F3d7B8C" "Parker Group" "http://parkergroup.co/" "Germany" "Cross-platform multimedia synergy" 2001 "Plastics" 6134
orgDiez = UnaOrganizacion 10 "E7C2D4B8F9E1A3C" "Walker Solutions" "https://walker-solutions.org/" "South Korea" "Scalable leading-edge model" 2010 "Technology" 3495
orgOnce = UnaOrganizacion 1 "FAB0d41d5b5d22c" "Ferrell LLC" "https://price.net/" "Papua New Guinea" "Horizontal empowering knowledgebase" 1990 "Plastics" 3498



--2.⁠ ⁠Escribir una función `organizacionMasVieja`, que dada una lista de organizaciones devuelva la organización que primero se fundó. (funciona por ghci)

organizacionMasVieja:: [Organizacion] -> Organizacion
organizacionMasVieja  =  foldl1 masVieja

masVieja::  Organizacion -> Organizacion -> Organizacion
masVieja org1 org2
    | founded org1 > founded org2 = org2
    | otherwise = org1

--3.⁠ ⁠⁠Escribir una función que dadas 2 organizaciones, devuelva la suma de los empleados de ambas. (funciona por ghci)

cantEmp::  Organizacion -> Organizacion -> Int
cantEmp org1 org2 = employees org1 + employees org2


--4.⁠ ⁠⁠Utilizar la función definida en el punto anterior para escribir una función `totalDeEmpleados`, que dada una lista de organizaciones devuelva la sumatoria de todos los empleados de las organizaciones de la lista. (funciona por ghci)

totalDeEmpleados:: [Organizacion] -> Int
totalDeEmpleados [] = 0
totalDeEmpleados [org] = employees org
totalDeEmpleados (org1:org2:orgs) = cantEmp org1 org2 + totalDeEmpleados orgs

-- 5.⁠ ⁠⁠Escribir una versión alternativa, sin utilizar la función del punto 3 y utilizando composición de funciones.(funciona por ghci)

cantEmpAlt::Organizacion -> Organizacion -> Int
cantEmpAlt org1 org2 = sum (map employees [org1, org2])

-- 6.⁠ ⁠Escribir una función que devuelva la organización del sector de plásticos ("Plastics" en el archivo) con mayor cantidad de empleados y que haya sido fundada luego de 1960. Utilizar composición de funciones.


--filtro por Plastics
soloPlastics:: Organizacion -> Bool
soloPlastics org = industry org == "Plastics"

--filtro por año
despuesDeX::Int -> Organizacion -> Bool
despuesDeX año org = founded org > año

--max cant de emp
maxEmp:: [Organizacion] -> Organizacion
maxEmp [org] = org
maxEmp (org1: org2: orgs) | employees org1 > employees org2 = maxEmp (org1:orgs) | otherwise = maxEmp (org2:orgs)

--filtro generico (funciona por ghci)
buscarOrgs :: (Organizacion-> Bool) -> [Organizacion] -> [Organizacion]
buscarOrgs  = filter

--funcion final (funciona por ghci)

maxCantPlast1960 ::[Organizacion] -> Organizacion
maxCantPlast1960 orgs = maxEmp (buscarOrgs (despuesDeX 1960)(buscarOrgs soloPlastics orgs))

-- -- 7.⁠ ⁠⁠Escribir una función llamada `ampliarOrganizacion` que dada una organización y un número, aumente la cantidad de empleados de esa organización en esa cantidad. (funciona por ghci)

ampliarOrg:: Int -> Organizacion -> Organizacion
ampliarOrg nuevosEmp org = org {employees = employees org + nuevosEmp }

-- 8.⁠ ⁠⁠Utilizando la función del punto anterior escribir una función `ampliarOrganizaciones` que dada una lista de organizaciones, aumente la cantidad de empleados de todas ellas en 10%. (funciona por ghci)

ampliarOrgs:: [Organizacion] -> [Organizacion]
ampliarOrgs  = map (\org -> ampliarOrg (round (fromIntegral (employees org) * 0.1)) org )

-- 9. Dada una lista de organizaciones, se desea averiguar si la mayoria de las organizaciones cumple con estos criterios:
--     - Organizaciones con una cantidad par de empleados.

cantParEmp:: Organizacion -> Bool
cantParEmp  = even . employees

--     - Organizaciones cuya primer palabra del nombre tenga más de una candidad dada de caracteres.

nombreLargo::Int -> Organizacion -> Bool
nombreLargo cant org = length  (head (words (name org))) > cant
--     - Organizaciones fundadas despues del 2000 y cuya primera palabra del nombre sea la que se indica.

empiezaConY::Char -> Organizacion -> Bool
empiezaConY letra org = head (name org) == letra

despuesDeXEmpiezaConY:: Int -> Char ->  Organizacion-> Bool
despuesDeXEmpiezaConY año letra org = despuesDeX año org && empiezaConY letra org

-- Definir una unica funcion que permita tomar el criterio por parametro y realice la tarea correspondiente. (funciona por ghci)

masDe50 :: (Organizacion-> Bool) -> [Organizacion] -> Bool
masDe50 criterio orgs =  length (filter criterio orgs) > 50


-- Dar diferentes ejemplos de consulta, en uno de ellos utilizando una expresiones lambda que exprese un nuevo criterio inventado. Justificar al utilidad del concepto de aplicacion parcial.


-- 10. Dada una lista de organizaciones, verificar que no hay organizaciones repetidas. (funciona por ghci)

repetido:: Organizacion -> Organizacion -> Bool
repetido org1 org2 = name org1 == name org2

orgRepetida:: [Organizacion] -> Organizacion
orgRepetida [org] = org
orgRepetida (org1: org2: orgs) | name org1 == name org2 = orgRepetida (org1:orgs) | otherwise = orgRepetida (org2:orgs)
