module Form.Password.Model exposing (..)

type alias Model a =
  String -> a

model : (String -> a) -> Model a
model f =
  f
