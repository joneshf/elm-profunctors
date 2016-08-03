module Form.Name.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

import Form.Name.Model exposing (..)
import Form.Name.Update exposing (..)

view : Model -> Html Msg
view model =
  input [ type' "text", placeholder "Name", onInput identity ] []
