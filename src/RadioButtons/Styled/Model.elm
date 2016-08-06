module RadioButtons.Styled.Model exposing (..)

type alias Model =
  (String, String)

model : (String, String) -> Model
model =
  identity
