module Count.Update exposing (..)

type alias Msg a b =
  a -> b

update : (a -> b) -> a -> b
update msg model =
  msg model
