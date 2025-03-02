import Control.Applicative.Lift (Lift)
--map :: (a->b) ->[a]->[b]


-- data Maybe a  = Nothing | Just a
-- maybeMap :: (a->b)->Maybe a -> Maybe b
-- maybeMap f(Just a) = Justa (f a)
-- maybeMap f Nothing = Nothing

{- functorii sunt o clasa care implementeaza un map generalizat

class Functor f where
    fmap : : ( a -> b ) -> f a -> f b

    sau asa
    fmap : : ( a -> b ) -> (f a -> f b)

-}

--List e un functor
--In ce sens trimite List tipuri in alte tipuri
-- List aplicat lui Int tntoarce tipul List Int


newtype Identity a = Identity a

instance Functor Identity where
    fmap :: (a -> b) -> Identity a -> Identity b
    fmap f (Identity x) =  Identity $ f x

data Pair a = Pair a a
instance Functor Pair where
    fmap :: (a -> b) -> (Pair a -> Pair b)
    fmap f (Pair x y) = Pair (f x) (f y) 

{-
 fmap id =
 fmap (f . g) = (fmap f) . (fmap g)
-}


data Constant a b = Constant b
-- Constant :: Type -> Type -> Type
--              a        b       Constant a b

instance Functor (Constant t) where
    --fmap :: (a -> b) -> Constant t a -> Constant t b
    fmap  f  (Constant x) = Constant (f x)


data Two a b = Two a b
instance Functor (Two t) where
    -- fmap ::(a -> b) -> Two t a -> Two t b
    --          x :: t
    --          y :: a
    fmap :: (a -> b) -> Two t a -> Two t b
    fmap f (Two x y) = Two x (f y)

data Three a b c = Three a b c
instance Functor (Three a b) where
    fmap :: (c -> d) -> Three a b c -> Three a b d
    fmap f (Three x y z) = Three x y (f z)

data Three' a b = Three' a b b
instance Functor (Three' a) where
    fmap :: (c -> d) -> Three' a c -> Three' a d
    fmap f (Three' x y z) = Three' x (f y) (f z) 

data Four a b c d = Four a b c d
instance Functor  (Four a b c) where
    fmap :: (d-> e) -> Four a b c d -> Four a b c e
    fmap f (Four x y z w) = Four x y z (f w)

data Four'' a b = Four'' a a a b
instance Functor (Four'' a) where
    fmap :: (b -> c) -> Four'' a b -> Four'' a c
    fmap f (Four'' x y z w) = Four'' x y z (f w)

data Quant a b = Finance | Desk a | Bloor b
instance Functor (Quant a ) where
    fmap :: (a2 -> b) -> Quant a1 a2 -> Quant a1 b
    fmap f Finance = Finance
    fmap _ (Desk x) = Desk x
    fmap f (Bloor x) = Bloor (f x)


data LiftItOut f a = LiftItOut (f a)
-- f a :: Type
--   a :: Type
-- f :: Type -> Type practic si f e un constructor de tip,nu o functie

--asa se aduaga constrangere
instance (Functor f) => Functor (LiftItOut f) where
    fmap :: (a -> b) -> LiftItOut f a -> LiftItOut f b
    --                  x:: f a
    fmap func (LiftItOut x) = LiftItOut (fmap func x)



data Parappa f g a = DaWrappa (f a) (g a)
instance (Functor f, Functor g) =>Functor (Parappa f g) where
    fmap :: (a -> b) -> Parappa f g a -> Parappa f g b
    fmap func (DaWrappa x y) = DaWrappa (fmap func x) (fmap func y)


data IgnoreOne f g a b = IgnoringSomething (f a) (g b)
instance (Functor g) => Functor (IgnoreOne f g a) where
    fmap :: (b -> c) ->IgnoreOne f g a b -> IgnoreOne f g a c
    fmap func (IgnoringSomething x y) = IgnoringSomething x (fmap func y)

data Notorious g o a t = Notorious (g o) (g a) (g t)
instance (Functor g) => Functor (Notorious g o a) where
    fmap :: (b -> c) -> Notorious g o a b -> Notorious g o a c
    fmap func (Notorious x y z) = Notorious x y (fmap func z)

data GoatLord a = NoGoat | OneGoat a | MoreGoats (GoatLord a) (GoatLord a) (GoatLord a)
instance Functor GoatLord where
    fmap :: (a -> b) -> GoatLord a -> GoatLord b
    fmap f  NoGoat = NoGoat
    fmap f (OneGoat x) = OneGoat (f x)
    fmap f (MoreGoats x y z) = MoreGoats (fmap f x) (fmap f y) (fmap f z)

data TalkToMe a = Halt | Print String a | Read (String -> a)
