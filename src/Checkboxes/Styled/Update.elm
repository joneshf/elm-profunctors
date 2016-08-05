module Checkboxes.Styled.Update exposing (..)

import Dict exposing (..)

import Checkboxes.Styled.Model exposing (..)

type alias Msg =
  (String, String)

update : Msg -> Model -> Model
update msg model =
  uncurry insert msg model
