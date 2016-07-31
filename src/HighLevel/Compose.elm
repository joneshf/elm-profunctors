module HighLevel.Compose exposing (..)

import Html
import Html.App
import Html.Attributes as Attributes

type alias BeginnerProgram model msg =
  { model : model
  , view : model -> Html.Html msg
  , update : msg -> model -> model
  }

below : BeginnerProgram a b -> BeginnerProgram c d -> BeginnerProgram (a, c) (Result b d)
below first second =
  { model = (first.model, second.model)
  , view = \(firstModel, secondModel) ->
      Html.div []
        [ Html.App.map Err (first.view firstModel)
        , Html.App.map Ok (second.view secondModel)
        ]
  , update = \firstRightMsg (firstModel, secondModel)->
      case firstRightMsg of
        Err msg ->
          (first.update msg firstModel, secondModel)
        Ok msg ->
          (firstModel, second.update msg secondModel)
  }

above : BeginnerProgram c d -> BeginnerProgram a b -> BeginnerProgram (a, c) (Result b d)
above second first =
  below first second

after : BeginnerProgram a b -> BeginnerProgram c d -> BeginnerProgram (a, c) (Result b d)
after left right =
  let
    prog =
      below left right
  in
    { prog
    | view = \(leftModel, rightModel) ->
        Html.div [Attributes.style [("display", "flex")]]
          [ Html.App.map Err (left.view leftModel)
          , Html.App.map Ok (right.view rightModel)
          ]
    }

before : BeginnerProgram c d -> BeginnerProgram a b -> BeginnerProgram (a, c) (Result b d)
before right left =
  after left right
