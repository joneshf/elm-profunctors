module Checkboxes.Checkbox.Update exposing (..)

import Checkboxes.Checkbox.Model exposing (..)

type alias Msg a =
  (a, String)

update : a -> Model -> Model
update msg model =
  not model
