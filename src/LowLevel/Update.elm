module LowLevel.Update exposing (..)

import LowLevel.Model exposing (Model)

import Button.Update as Button
import Counts.Update as Counts

type alias Msg =
  Result Button.Msg (Result Counts.Msg Button.Msg)

update : Msg -> Model -> Model
update msg model =
  case msg of
    Err msg ->
      {model | firstButton = Button.update msg model.firstButton}
    Ok (Err msg) ->
      {model | counts = Counts.update msg model.counts}
    Ok (Ok msg) ->
      {model | secondButton = Button.update msg model.secondButton}
