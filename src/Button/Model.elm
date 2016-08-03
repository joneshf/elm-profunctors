module Button.Model exposing (..)

type alias Model a =
  { label : String
  , msg : a
  }

model : String -> a -> Model a
model str msg =
  {label = str, msg = msg}
