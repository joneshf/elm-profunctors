module View.Counts exposing (..)

import Html exposing (..)

type alias Model =
  List Int

type alias Msg =
  ()

view : Model -> Html Msg
view xs =
  ul
    []
    (List.map countView xs)

countView : Int -> Html Msg
countView x =
  li
    []
    [text (toString x)]
