-- в Haskell има множество вградени библиотеки, но за да ползваме функциите им първо трябва да ги включим
import Data.Char -- за ord и chr

-- main блок - подобно на C++
-- може да е както най-отгоре, така и най-отдолу в програмата
main :: IO()
main = do
 --print 3
 --print (5 + 6)        -- 11
 --print (div 18 7)     -- 2
 --print (18 `div` 7)   -- 2
 --print (mod 18 7)     -- 4
 --print (18 `mod` 7)   -- 4
 
 --print (11 ^ 2)       -- 121
 --print (2 ** 0.5)     -- 1.4142..
 
 --print (ord 'a')      -- 97
 --print (chr 97)       -- 'а'
 --print (floor 5.23)   -- 5
 --print (ceiling 5.23) -- 6
 --print (round 5.23)   -- 5
 
 --print a -- -> 5
 --print b -- -> 6
 
 --print (f1 1)     -- -> 2
 --print (f2 1 2 3) -- -> 6
 
 {- $ e оператор, който прилага функция. Така може да си спестяваме скоби
 Например f (g x y) ще стане f $ g x y
 При един чифт скоби резултата не е особено различен, но при по-сложни функции се получават доста скоби
 Разбира се може да си пишете и със обикновени скоби, ако ви е по-удобно -}
 
 --print $ myМin 3 4  -- -> 3
 --print $ myМin' 3 4 -- -> 3
 --print $ inside 4 3 5 -- -> True
 --print $ inside 6 3 5 -- -> False
 --print $ average 3 4
 
 --print $ fib 6     --  -> 13
 --print $ fib' 6
 --print $ fibIter 6
 
 --print $ (lambda1 3) 4 
 --print $ lambda2 3 4
 
 --print $ (inside' 3 5) 4
 --print $ inside' 3 5 4 -- интерпретатора на Haskell е достатъчно умен за да се оправи и без скоби
 
 --print $ composedf 3 4 -- -> 49 (Първо прилагаме дясната функция, която връща 3 + 4 = 7. Лявата получава този резултат като аргумент и го повдига на квадрат)
 --print $ ((\ y -> y * y) . (\ y -> 3 + y)) 4 -- -> 49
 --print $ (plusOne . plusOne . plusOne) 5 -- -> 8
 --print $ xSquaredPlusOne 2 -- 5 (2^2 + 1 = 4 + 1)
 --print $ xPlusOneSquared 2 -- 9 ((2+1)^2 = 3^2)
 
 --print $ p0 1 2 3 -- -> 6
 --print $ p1 2 3
 --print $ p2 3
 --print $ p3
 
 --print $ plusOne' 5        -- -> 6
 --print $ (plusX 5) 4       -- -> 9
 --print $ lessThanFive 4    -- -> True
 --print $ lessThanFive 6    -- -> False
 --print $ greaterThanFive 4 -- -> False
 --print $ greaterThanFive 6 -- -> True
 --print $ divideByTwo 5     -- -> 2.5
 --print $ divideTwoBy 5     -- -> 0.4
 
{- в Хаскел индентацията е важна:
всичко в един блок е индентирано навътре (и то на едно и също ниво)
когато излезем от блока се връщаме към предишното ниво на индентация

блок
 текст
 текст
 
блок
 текст
 текст
 блок
  текст
  текст 

полезна опция в SciTE -> View -> Indentation Guides -}

-- дефиниция на променлива
a = 5

-- дефиниция на променлива с посочване на типа
b :: Int
b = 6
--b = 7 -- error: Multiple declarations of `b'

-- дефиниция на функция на един аргумент - приема Int и връща Int
f1 :: Int -> Int
f1 x = x + 1

-- дефиниция на функция на 3 аргумента, която връща Int
f2 :: Int -> Int -> Int -> Int
f2 x y z = x + y + z


{- вградени типове и операции в Haskell
Bool - True, False
     - операции: &&, ||, not
     
Int     - цели числа, представени в 32 бита
Integer - цели числа с неограничена точност
        - операции: +, -, *, ^, div/mod (като quotient/remainder в Racket)
        - операции за сравнения: <, <=, >, >=, ==, /= (различно, като != в C++)
        
Float  - числа с плаваща точка
Double - числа с плаваща точка с двойна точност
       - операции: +, -, *, /, ^ (повдигане на степен цяло неотрицателно число), ** (повдигане на произволна степен), sqrt
       - операции за сравнения: <, <=, >, >=, ==, /=
       - закръгляне до цяло - ceiling, floor, round
       - превръщане на цяло в реално - fromIntegral
       
Rational - рационални числа с пълна точност (представени като двойка числител и знаменател)

Char - знакове
     - връзка с ASCII кодовете им - ord :: Char -> Int, chr :: Int -> Char
     - toUpper, toLower, isUpper, isLower, isDigit
     
String - низ, всъщност е списък от Char-ове, но за това по-нататък

списъци и вектори - на следващите упражнения -}

{- в Haskell операциите са с инфиксен запис, а останалите функции са с префиксен, но може да преминаваме от единия към другия
- от инфиксен към префиксен - като оградим името на операцията в скоби
  5 + 3 => (+) 5 3
- от префиксен към инфиксен (само за функции с 2 аргумента) - като оградим името в обратни апострофи (backquotes)
  mod 5 3 => 5 `mod` 3 -}

-- Задача 1. Да се дефинира функция mymin :: Int -> Int -> Int, която връща минималния от двата си аргумента
-- ползвайки if
myМin :: Int -> Int -> Int
myМin x y = if x <= y then x else y

-- ползвайки "охраняващи изрази" (guards) 
-- подобно на cond в Racket - може да имаме произволен брой такива изрази
-- като otherwise е подобно на else - винаги се оценява до True
myМin' :: Int -> Int -> Int
myМin' x y
 | x <= y    = x
 | otherwise = y

-- Задача 2. Да се дефинира функция inside :: Int -> Int -> Int -> Bool,  която проверява дали х е в интервала [a, b]
inside :: Int -> Int -> Int -> Bool
inside x a b = a <= x && x <= b

-- Задача 3. Да се дефинира функция average :: Int -> Int -> Double, която намира средно аритметичното на две числа
average :: Int -> Int -> Double
average x y = fromIntegral (x + y) / 2 -- трябва ни fromIntegral, тъй като (/) работи с числа в плаваща точка 

-- Задача 4. Да се дефинира функция fib :: Int -> Integer, която намира n-тото число на Фибоначи
fib :: Int -> Integer
fib n
 | n == 0 = 1
 | n == 1 = 1
 | otherwise = fib (n-1) + fib (n-2)

-- със съпоставяне с образец (pattern matching)
fib' :: Int -> Integer
fib' 0 = 1
fib' 1 = 1
fib' n = fib (n-1) + fib (n-2)
{- При pattern matching аргументите последователно се съпоставят с образците (левите страни на равенствата), т.е. от горе надолу.
При успешно съпоставяне се връша дясната страна на съответното равенство.
Образецът може да бъде: 
- литерал (число, буква, булева стойност, т.н.) - аргумент се съпоставя успешно ако е равен на стойността на литерала 
- променлива - аргумент винаги се съпоставя успешно с променлива
- '_' (wildcard - специален символ за безусловно съпоставяне) - винаги се съпоставя успешно. Ползваме го когато не ни интересува стойността на даден аргумент
- вектор (p1,p2,...,pn) - аргументът се съпоставя успешно, ако е от вида (v1,v2,...vn) и всяко vi се съпоставя със съответното pi
- конструктор - ще разберем какво е това по-нататък
-}

-- итеративно решение
fibIter :: Int -> Integer
fibIter n = helper 1 1 2
 where -- дефинираме помощни функции (и променливи) в where блок, който трябва да е индентиран навътре
  helper :: Int -> Integer -> Integer -> Integer
  helper i current next
   | i >= n    = current
   | otherwise = helper (i+1) next (current+next)
   
-- Ламбда функции - аналогично на тези в Racket, но тук ползваме символа '\' вместо lambda и -> за да разделим променливите от тялото
lambda1 x = \ y -> x + y
lambda2 = \ x y -> x + y

-- Функции от по-висок ред - отново аналогични, но тъй като тук си декларираме типа на функциите ще трябва да го отбележим и там.
-- Когато имаме функция като аргумент или резултат, пишем нейната сигнатура и я обграждаме в скоби

-- Задача 6. Да се дефинира функция inside' :: Int -> Int -> (Int -> Bool), която получава само 2 аргумента - двата края на интервал.
-- inside' a b връща функция на 1 аргумент, която проверява дали той е в интервала [a,b]
inside' :: Int -> Int -> (Int -> Bool)
inside' a b = \ x -> a <= x && x <= b


-- Композиция на функции - ползваме символа '.' (точка, идеята е да символизира кръгчето, което ползваме в математиката)
-- Функциите се прилагат отдясно наляво
composedf x = (\ y -> y * y) . (\ y -> x + y)

-- Задача 7. Да се дефинира функция xSquaredPlusOne :: Int -> Int, която пресмята x^2 + 1, ползвайки композиция на функции
plusOne :: Int -> Int
plusOne x = x + 1
square :: Int -> Int
square x = x * x

xSquaredPlusOne :: Int  -> Int
xSquaredPlusOne x = (plusOne . square) x

-- Задача 8. Да се дефинира функция xPlusOneSquared :: Int -> Int, която пресмята (x+1)^2, ползвайки композиция на функции
xPlusOneSquared :: Int -> Int
xPlusOneSquared x = (square . plusOne) x


-- Частично прилагане на функции - в Haskell функция (на два или повече аргумента) 
-- може да бъде приложена само към част от аргументите си, като резултатът е функция на останалите аргументи
-- Например ако имаме f :: Int -> Int -> Int -> Int и я приложим частично към първите 2 аргумента, резултатът ще е функция f' :: Int -> Int
p0 :: Int -> Int -> Int -> Int
p1 :: Int -> Int -> Int
p2 :: Int -> Int
p3 :: Int

p0 x y z = x + y + z
p1 y z   = p0 1 y z
p2 z     = p0 1 2 z
p3       = p0 1 2 3

-- по-детайлно за прилагането - в Haskell всъщност всяка функция е на един аргумент
-- симулираме повече аргументи като връщаме функции
-- така f :: Int -> Int -> Int -> Int всъщност е f :: Int -> (Int -> (Int -> Int)), 
-- т.е. функция на 3 аргумента всъшност е функция на 1 аргумент, коятo връща функция на 1 аргумент, която от своя страна също връща функция на 1 аргумент,
-- която вече извършва сметките и връща резултат. При всяка от тези стъпки все едно фиксираме един аргумент.
-- Например в случая с p0 1 2 3 - p0 ще върне функция :: Int -> (Int -> Int), като тя ше знае че х е 1. Тя ще върне функция :: Int -> Int, която ще знае
-- че y е 2 и ще приеме един аргумент, откъдето ще разбере стойността на z. След това вече може да извърши смятането на x + y + z = 1 + 2 + 3 = 6

-- Сечения на оператори - частично прилагане при оператори
plusOne' = (+1)
plusX x = (+x)

-- редът е от значение
lessThanFive = (<5)
greaterThanFive = (>5)
-- Общото правило гласи, че сечението на оператора op "добавя" аргумента си по начин, който завършва от синтактична
-- гледна точка записа на приложението на оператора (обръщението към оператора).
-- в примерите: за да "завършим" <5 трябва да напишем нещо от лявата страна, като така получаваме израза x < 5
-- в примерите: за да "завършим" >5 трябва да напишем нещо от дясната страна, като така получаваме израза x > 5
divideByTwo = (/2)
divideTwoBy = (2/)
