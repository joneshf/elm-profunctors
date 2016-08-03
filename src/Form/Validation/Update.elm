module Form.Validation.Update exposing (..)

import Form.Validation.Model exposing (..)

type alias Msg a b =
  Result a b

update : Msg a a -> Model a a -> Model a a
update msg {password, passwordAgain} =
  case msg of
    Err newPassword ->
      model newPassword passwordAgain
    Ok newPassword ->
      model password newPassword
