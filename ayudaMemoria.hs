-- -- 1. Funciones de Listas

-- head :: [a] -> a
-- -- Devuelve el primer elemento de una lista.

-- tail :: [a] -> [a]
-- -- Devuelve todos los elementos excepto el primero de la lista.

-- init :: [a] -> [a]
-- -- Devuelve todos los elementos excepto el último.

-- last :: [a] -> a
-- -- Devuelve el último elemento de la lista.

-- length :: [a] -> Int
-- -- Devuelve la longitud de la lista.

-- null :: [a] -> Bool
-- -- Comprueba si la lista está vacía.

-- reverse :: [a] -> [a]
-- -- Invierte la lista.

-- take :: Int -> [a] -> [a]
-- -- Toma los primeros "n" elementos de una lista.

-- drop :: Int -> [a] -> [a]
-- -- Elimina los primeros "n" elementos de una lista.

-- splitAt :: Int -> [a] -> ([a], [a])
-- -- Divide la lista en dos, en el índice dado.

-- takeWhile :: (a -> Bool) -> [a] -> [a]
-- -- Toma elementos mientras la condición sea verdadera.

-- dropWhile :: (a -> Bool) -> [a] -> [a]
-- -- Elimina elementos mientras la condición sea verdadera.

-- filter :: (a -> Bool) -> [a] -> [a]
-- -- Filtra la lista según una condición.

-- map :: (a -> b) -> [a] -> [b]
-- -- Aplica una función a cada elemento de una lista.

-- zip :: [a] -> [b] -> [(a, b)]
-- -- Combina dos listas en una lista de tuplas.

-- unzip :: [(a, b)] -> ([a], [b])
-- -- Convierte una lista de tuplas en dos listas separadas.

-- concat :: [[a]] -> [a]
-- -- Concatena una lista de listas en una sola lista.

-- concatMap :: (a -> [b]) -> [a] -> [b]
-- -- Aplica una función y concatena los resultados.

-- elem :: Eq a => a -> [a] -> Bool
-- -- Verifica si un elemento pertenece a la lista.

-- notElem :: Eq a => a -> [a] -> Bool
-- -- Verifica si un elemento no pertenece a la lista.

-- sum :: Num a => [a] -> a
-- -- Suma todos los elementos de la lista.

-- product :: Num a => [a] -> a
-- -- Multiplica todos los elementos de la lista.

-- maximum :: Ord a => [a] -> a
-- -- Devuelve el valor máximo de la lista.

-- minimum :: Ord a => [a] -> a
-- -- Devuelve el valor mínimo de la lista.

-- and :: [Bool] -> Bool
-- -- Devuelve True si todos los elementos de la lista son True.

-- or :: [Bool] -> Bool
-- -- Devuelve True si al menos un elemento de la lista es True.

-- -- 2. Funciones sobre Tuplas

-- fst :: (a, b) -> a
-- -- Devuelve el primer elemento de una tupla.

-- snd :: (a, b) -> b
-- -- Devuelve el segundo elemento de una tupla.

-- curry :: ((a, b) -> c) -> a -> b -> c
-- -- Convierte una función que toma una tupla en una función curried.

-- uncurry :: (a -> b -> c) -> (a, b) -> c
-- -- Convierte una función curried en una que toma una tupla.

-- -- 3. Funciones de Orden Superior

-- ($) :: (a -> b) -> a -> b
-- -- Aplicación de función (para evitar paréntesis).

-- (.) :: (b -> c) -> (a -> b) -> a -> c
-- -- Composición de funciones.

-- flip :: (a -> b -> c) -> b -> a -> c
-- -- Cambia el orden de los argumentos de una función.

-- const :: a -> b -> a
-- -- Devuelve el primer argumento, ignorando el segundo.

-- id :: a -> a
-- -- Devuelve su argumento sin cambios.

-- filter :: (a -> Bool) -> [a] -> [a]
-- -- Filtra una lista según una condición.

-- map :: (a -> b) -> [a] -> [b]
-- -- Aplica una función a todos los elementos de una lista.

-- foldl :: (b -> a -> b) -> b -> [a] -> b
-- -- Acumula de izquierda a derecha con un valor inicial.

-- foldl1 :: (a -> a -> a) -> [a] -> a
-- -- Igual que foldl, pero usa el primer elemento como inicial.

-- foldr :: (a -> b -> b) -> b -> [a] -> b
-- -- Acumula de derecha a izquierda.

-- foldr1 :: (a -> a -> a) -> [a] -> a
-- -- Igual que foldr, pero usa el último elemento como inicial.

-- scanl :: (b -> a -> b) -> b -> [a] -> [b]
-- -- Similar a foldl, pero devuelve una lista de los acumulados parciales.

-- scanr :: (a -> b -> b) -> b -> [a] -> [b]
-- -- Similar a foldr, pero devuelve una lista de los acumulados parciales.

-- -- 4. Funciones Matemáticas

-- (+) :: Num a => a -> a -> a
-- -- Suma dos valores.

-- (-) :: Num a => a -> a -> a
-- -- Resta dos valores.

-- (*) :: Num a => a -> a -> a
-- -- Multiplica dos valores.

-- (/) :: Fractional a => a -> a -> a
-- -- Divide dos valores (de tipo fraccionario).

-- div :: Integral a => a -> a -> a
-- -- División entera.

-- mod :: Integral a => a -> a -> a
-- -- Resto de la división entera.

-- quot :: Integral a => a -> a -> a
-- -- División entera truncada.

-- rem :: Integral a => a -> a -> a
-- -- Resto de la división truncada.

-- negate :: Num a => a -> a
-- -- Devuelve el valor negativo.

-- abs :: Num a => a -> a
-- -- Valor absoluto.

-- signum :: Num a => a -> a
-- -- Devuelve el signo de un número.

-- max :: Ord a => a -> a -> a
-- -- Devuelve el mayor de dos valores.

-- min :: Ord a => a -> a -> a
-- -- Devuelve el menor de dos valores.

-- sqrt :: Floating a => a -> a
-- -- Devuelve la raíz cuadrada de un número.

-- -- 5. Otras Funciones Útiles

-- undefined :: a
-- -- Una función que puede usarse como marcador para código no implementado.

-- error :: String -> a
-- -- Lanza un error con un mensaje dado.

-- seq :: a -> b -> b
-- -- Evalúa su primer argumento antes que el segundo.

-- show :: Show a => a -> String
-- -- Convierte un valor en una cadena de texto.

-- read :: Read a => String -> a
-- -- Convierte una cadena de texto en un valor, según su tipo.

-- lookup :: Eq a => a -> [(a, b)] -> Maybe b
-- -- Busca una clave en una lista de pares clave-valor.
