--model
--functie cu monada

getFromInterval :: Int -> Int -> [Int] -> Maybe [Int]
getFromInterval x y list = do
    if x > y 
        then Nothing
        else Just (filter (\a -> a >= x && a <= y) list)

{-
newtype ReaderWriter env a = RW {getRW :: env-> (a,String)}
instance Monad (ReaderWriter env) where
    return x = RW (\_ -> (x, ""))
    (RW f) >>= k = RW(\env ->
        let (a,log1) = f env
        RW h = k a
        (b, log2) = h env
        in (b, log1 ++ log2)

        )
-}

{-
newtype ReaderM env a = ReaderM { runReaderM :: env -> Maybe a }

instance Monad (ReaderM env) where
    return x = ReaderM (\_ -> Just x)
    (ReaderM f) >>= k = ReaderM(\env ->
        case f env of
            Nothing -> Nothing
            Just a -> runReaderM (k a) env
        )
-}

{-
newtype ReaderM env a = ReaderM { runReaderM :: env -> Either String a }

instance Monad (ReaderM env) where
    return x = ReaderM (\_ -> Right x)
    (ReaderM f) >>= k = ReaderM(\env ->
        case f env of
            Left err -> Left err
            Right a -> runReaderM (k x) env
        )
-}

{-

newtype AM a = AM {getAM :: (Maybe a, String)}

instance Monad AM where
    return x = AM (Just x, "")
    (AM (Nothing , log1)) >>= _ = AM(Nothing, log1)
    (Am (Just x, log1)) >>= k =
        let AM(maybeY, log2) = k x
        in AM(maybeY, log1 ++ log2)




newtype AE a = AE {getAE :: (Either String a, String)}
instance Monad AE where
    return x = AE(Right x, "")
    (AE (Left err, log1)) >>= _ = AE(Left err, log1)
    (AE(Right x, log1)) >>= k =
        let AE(eitherY, log2) = k x
        in AE(eitherY, log1 ++ log2)
        


newtype WriterString a = Writer {runWriter :: (a, String)}
instance Monad WriterString where
    return x = Writer(x, "")
    (Writer (x,log1)) >>= k =
        let Writer(y, log2) = k x
        in Writer(y, log1 ++ log2)


data EitherWriter a = EW {getValue :: Either String (a, String)}
instance Monad EitherWriter where
    return x = EW(Right (x ,""))
    (EW (Left err)) >>= _ = EW(Left err)
    (EW (Right (x, logx))) >>= k =
        case getValue (k x) of
            Left err -> EW(Left err)
            Right(y, logy) -> EW(Right(y, logx ++ logy))

-}
