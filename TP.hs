import Utiles

--1.⁠ 

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
} deriving Show



-- Conversión de una TuplaDeOrganizacion a Organizacion
fromTuplaToOrganizacion :: TuplaDeOrganizacion -> Organizacion
fromTuplaToOrganizacion (i, oid, n, w, c, d, f, ind, emp) =
    UnaOrganizacion i oid n w c d f ind emp


--2.⁠ 

organizacionMasVieja:: [Organizacion] -> Organizacion
organizacionMasVieja orgs =  foldl1 masVieja orgs

masVieja::  Organizacion -> Organizacion -> Organizacion
masVieja org1 org2 
    | founded org1 > founded org2 = org2
    | otherwise = org1

--3.⁠ 

cantEmp::  Organizacion -> Organizacion -> Int
cantEmp org1 org2 = employees org1 + employees org2


--4.⁠ ⁠⁠Utilizar la función definida en el punto anterior para escribir una función `totalDeEmpleados`, que dada una lista de organizaciones devuelva la sumatoria de todos los empleados de las organizaciones de la lista. 

totalDeEmpleados:: [Organizacion] -> Int
totalDeEmpleados [] = 0
totalDeEmpleados [org] = employees org
totalDeEmpleados orgs = sum(map employees orgs)

-- 5.⁠ ⁠⁠Escribir una versión alternativa, sin utilizar la función del punto 3 y utilizando composición de funciones.



-- 6.⁠ ⁠Escribir una función que devuelva la organización del sector de plásticos ("Plastics" en el archivo) con mayor cantidad de empleados y que haya sido fundada luego de 1960. Utilizar composición de funciones.

--filtro por Plastics
soloPlastics:: [Organizaciones] -> [Organizaciones]
soloPlastics orgs = filter (industry == "Plastics") orgs

--filtro por año
despuesDe1960:: [Organizaciones] -> [Organizaciones]
despuesDe1960 orgs = filter (founded > 1960) orgs

maxEmp:: [Organizaciones] -> Organizaciones
maxEmp

--funcion final
MaxCantPlast1960::[Organizaciones] -> [Organizaciones]
MaxCantPlast1960 orgs = (maxEmp . despuesDe1960 . soloPlastics) orgs

-- 7.⁠ ⁠⁠Escribir una función llamada `ampliarOrganizacion` que dada una organización y un número, aumente la cantidad de empleados de esa organización en esa cantidad.

-- 8.⁠ ⁠⁠Utilizando la función del punto anterior escribir una función `ampliarOrganizaciones` que dada una lista de organizaciones, aumente la cantidad de empleados de todas ellas en 10%.

-- 9. Dada una lista de organizaciones, se desea averiguar si la mayoria de las organizaciones cumple con estos criterios:
--     - Organizaciones con una cantidad par de empleados.
--     - Organizaciones cuya primer palabra del nombre tenga más de una candidad dada de caracteres.
--     - Organizaciones fundadas despues del 2000 y cuya primera palabra del nombre sea la que se indica.
          
-- Definir una unica funcion que permita tomar el criterio por parametro y realice la tarea correspondiente.
-- Dar diferentes ejemplos de consulta, en uno de ellos utilizando una expresiones lambda que exprese un nuevo criterio inventado. Justificar al utilidad del concepto de aplicacion parcial.

-- 10. Dada una lista de organizaciones, verificar que no hay organizaciones repetidas. 

-- Importante: Evaluar las funciones definidas en los puntos anteriores usando la lista con todas las organizaciones que surja del archivo `organizaciones.csv`.