module HighLevel.App exposing (..)

import Html.App

import Button.App as Button
import Button.Model as Button
import Button.View as Button
import Count.App as Count

import HighLevel.Compose exposing (..)

main : Program Never
main =
  decrementButton
    |> shareMsgAbove Count.beginnerProgram
    |> shareMsgAbove incrementButton
    |> Html.App.beginnerProgram

incrementButton : BeginnerProgram Button.Model (number -> number)
incrementButton =
  Button.beginnerProgram
    |> model (Button.model "+")
    |> view (Button.view (\x -> x + 1))

decrementButton : BeginnerProgram Button.Model (number -> number)
decrementButton =
  Button.beginnerProgram
    |> model (Button.model "-")
    |> view (Button.view (\x -> x - 1))
