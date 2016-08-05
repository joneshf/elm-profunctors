module Checkboxes.App exposing (..)

import Html.App exposing (beginnerProgram)

import Result.Extra exposing (mapBoth)

import Html.App.Compose as C exposing (BeginnerProgram)

import Checkboxes.Checkbox.App as Checkbox
import Checkboxes.Checkbox.Model as Checkbox
import Checkboxes.Checkbox.Update as Checkbox
import Checkboxes.Checkbox.View as Checkbox
import Checkboxes.Styled.App as Styled
import Checkboxes.Styled.Model as Styled
import Checkboxes.Styled.Update as Styled

main : Program Never
main =
  styled
    |> C.above checkboxes
    |> Html.App.beginnerProgram

checkboxes
  : BeginnerProgram
      ((Checkbox.Model, Checkbox.Model), Checkbox.Model)
      (Result
        (Result (Checkbox.Msg String) (Checkbox.Msg String))
        (Checkbox.Msg String))
checkboxes =
  (Checkbox.beginnerProgram |> C.view (Checkbox.view "color" "red"))
    |> C.above (Checkbox.beginnerProgram |> C.view (Checkbox.view "text-decoration" "underline"))
    |> C.above (Checkbox.beginnerProgram |> C.model (Checkbox.model True) |> C.view (Checkbox.view "font-weight" "bold"))

styled
  : BeginnerProgram
      Styled.Model
      (Result (Result Styled.Msg Styled.Msg) Styled.Msg)
styled =
  Styled.beginnerProgram
    |> C.update (\msg model -> Debug.log "update" (Styled.update (mapBoth (mapBoth identity identity) identity msg) model))
