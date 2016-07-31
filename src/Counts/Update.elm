module Counts.Update exposing (..)

import Counts.Model exposing (Model)

type alias Msg =
  ()

update : Msg -> Model -> Model
update _ model =
  model
