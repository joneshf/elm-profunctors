module RadioButtons.Styled.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (style)

import RadioButtons.Styled.Model exposing (..)

view : Model -> Html a
view model =
  span [style [model]] [text "Hello, how are you?!"]
