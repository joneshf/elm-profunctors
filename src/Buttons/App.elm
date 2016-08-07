module Buttons.App exposing (..)

import Html.App

import Buttons.Button.App as Button
import Buttons.Button.Model as Button
import Buttons.Count.App as Count

import Html.App.Compose exposing (..)

main : Program Never
main =
  decrementButton
    |> shareMsg above Count.beginnerProgram
    |> shareMsg above incrementButton
    |> Html.App.beginnerProgram

incrementButton : BeginnerProgram (Button.Model (number -> number)) (number -> number)
incrementButton =
  Button.beginnerProgram
    |> model (Button.model "+" (\x -> x + 1))

decrementButton : BeginnerProgram (Button.Model (number -> number)) (number -> number)
decrementButton =
  Button.beginnerProgram
    |> model (Button.model "-" (\x -> x - 1))
