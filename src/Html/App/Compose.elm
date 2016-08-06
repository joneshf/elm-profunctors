module Html.App.Compose exposing (..)

import Html
import Html.App
import Html.Attributes as Attributes

import Result.Extra exposing (mapBoth)

type alias BeginnerProgram model msg =
  { model : model
  , update : msg -> model -> model
  , view : model -> Html.Html msg
  }

type alias Composition model1 msg1 model2 msg2 model msg =
  BeginnerProgram model1 msg1 -> BeginnerProgram model2 msg2 -> BeginnerProgram model msg

model : b -> {r | model : a} -> {r | model : b}
model x =
  modelMap (always x)

modelMap : (a -> b) -> {r | model : a} -> {r | model : b}
modelMap f record =
  {record | model = f record.model}

update : b -> {r | update : a} -> {r | update : b}
update x =
  updateMap (always x)

updateMap : (a -> b) -> {r | update : a} -> {r | update : b}
updateMap f record =
  {record | update = f record.update}

view : b -> {r | view : a} -> {r | view : b}
view x =
  viewMap (always x)

viewMap : (a -> b) -> {r | view : a} -> {r | view : b}
viewMap f record =
  {record | view = f record.view}

below : Composition a b c d (a, c) (Result b d)
below first second =
  { model = (first.model, second.model)
  , view = \(firstModel, secondModel) ->
      Html.div
        [ Attributes.style
            [("display", "flex"), ("flex-direction", "column")]
        ]
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

above : Composition c d a b (a, c) (Result b d)
above second first =
  below first second

after : Composition a b c d (a, c) (Result b d)
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

before : Composition c d a b (a, c) (Result b d)
before right left =
  after left right

shareMsg
  :  Composition c b a b (a, c) (Result b b)
  -> Composition c b a b (a, c) b
shareMsg composition second first =
  composition second first
    |> update (\msg (firstModel, secondModel) ->
        (first.update msg firstModel, second.update msg secondModel)
      )
    |> viewMap ((<<) (Html.App.map (mapBoth identity identity)))

shareMsg'
  :  Composition a b c b (a, c) (Result b b)
  -> Composition a b c b (a, c) b
shareMsg' composition first second =
  shareMsg (flip composition) second first

usingErr
  :  Composition a (Result b c) d (Result b c) e (Result b c)
  -> Composition a         b    d (Result b c) e (Result b c)
usingErr composition program =
  program
    |> viewMap ((<<) (Html.App.map Err))
    |> updateMap (flip mapBoth (always identity))
    |> composition

usingOk
  :  Composition a (Result b c) d (Result b c) e (Result b c)
  -> Composition a           c  d (Result b c) e (Result b c)
usingOk composition program =
  program
    |> viewMap ((<<) (Html.App.map Ok))
    |> updateMap (mapBoth (always identity))
    |> composition
