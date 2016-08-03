module Form.App exposing (..)

import Html exposing (..)
import Html.App as App
import Html.App.Compose as Compose exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

import Result.Extra exposing (mapBoth)


main : Program Never
main =
  beginnerProgramName
    |> before passwords
    |> shareMsgAbove validationBeginnerProgram
    |> App.beginnerProgram

passwords : BeginnerProgram (PasswordModel, PasswordAgainModel) (Result PasswordMsg PasswordAgainMsg)
passwords =
  beginnerProgramPassword
    |> before beginnerProgramPasswordAgain

validationBeginnerProgram :
  { model : ValidationModel
  , view : ValidationModel -> Html a
  , update : Result NameMsg (Result PasswordMsg PasswordAgainMsg) -> ValidationModel -> ValidationModel
  }
validationBeginnerProgram =
  beginnerProgramValidation
    |> Compose.updateMap (mapBoth (\_ model -> model))

beginnerProgramName : BeginnerProgram NameModel NameMsg
beginnerProgramName =
  {model = modelName "", update = updateName, view = viewName}

type alias NameModel =
  String

modelName : String -> NameModel
modelName str =
  str

type alias NameMsg =
  String

updateName : NameMsg -> NameModel -> NameModel
updateName str model =
  str

viewName : NameModel -> Html NameMsg
viewName model =
  input [ type' "text", placeholder "Name", onInput identity ] []

beginnerProgramPassword : BeginnerProgram PasswordModel PasswordMsg
beginnerProgramPassword =
  {model = modelPassword "", update = updatePassword, view = viewPassword}

type alias PasswordModel =
  String

modelPassword : String -> PasswordModel
modelPassword str =
  str

type alias PasswordMsg =
  String

updatePassword : PasswordMsg -> PasswordModel -> PasswordModel
updatePassword str model =
  str

viewPassword : PasswordModel -> Html PasswordMsg
viewPassword model =
  input [ type' "password", placeholder "Password", onInput identity ] []

beginnerProgramPasswordAgain : BeginnerProgram PasswordAgainModel PasswordAgainMsg
beginnerProgramPasswordAgain =
  {model = modelPasswordAgain "", update = updatePasswordAgain, view = viewPasswordAgain}

type alias PasswordAgainModel =
  String

modelPasswordAgain : String -> PasswordAgainModel
modelPasswordAgain str =
  str

type alias PasswordAgainMsg =
  String

updatePasswordAgain : PasswordAgainMsg -> PasswordAgainModel -> PasswordAgainModel
updatePasswordAgain str model =
  str

viewPasswordAgain : PasswordAgainModel -> Html PasswordAgainMsg
viewPasswordAgain model =
  input [ type' "password", placeholder "Re-enter Password", onInput identity ] []


beginnerProgramValidation : {model : ValidationModel , update : ValidationMsg -> ValidationModel -> ValidationModel , view : ValidationModel -> Html a}
beginnerProgramValidation =
  {model = modelValidation "" "", update = updateValidation, view = viewValidation}

type alias ValidationModel =
  { color : String
  , message : String
  , password : String
  , passwordAgain : String
  }

modelValidation : String -> String -> ValidationModel
modelValidation password passwordAgain =
  if password == passwordAgain then
    { color = "green"
    , message = "OK"
    , password = password
    , passwordAgain = passwordAgain
    }
  else
    { color = "red"
    , message = "Passwords do not match!"
    , password = password
    , passwordAgain = passwordAgain
    }

type alias ValidationMsg =
  Result PasswordMsg PasswordAgainMsg

updateValidation : ValidationMsg -> ValidationModel -> ValidationModel
updateValidation msg model =
  case msg of
    Err password ->
      modelValidation password model.passwordAgain
    Ok password ->
      modelValidation model.password password

viewValidation : ValidationModel -> Html a
viewValidation {color, message} =
    div [ style [("color", color)] ] [ text message ]
