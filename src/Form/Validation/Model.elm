module Form.Validation.Model exposing (..)

type alias Model password passwordAgain =
  { color : String
  , message : String
  , password : password
  , passwordAgain : passwordAgain
  }

model : a -> a -> Model a a
model password passwordAgain =
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

