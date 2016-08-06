module RadioButtons.RadioButton.Update exposing (..)

type alias Msg a b =
  (a, b)

update : a -> b -> b
update msg model =
  model
