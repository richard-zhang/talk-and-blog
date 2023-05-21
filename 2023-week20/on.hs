outer f g h = fmap (\x -> fmap (f x) h) g

self f x = f x x

on :: (b -> b -> c) -> (a -> b) -> a -> a -> c
on = self . outer