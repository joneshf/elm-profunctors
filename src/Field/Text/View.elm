module Field.Text.View exposing (..)

import Html exposing (..)

import Field.Text.Model exposing (..)
import Field.Style exposing (..)

view : Model -> Html s
view content =
  div [ myStyle ] [ text content ]
