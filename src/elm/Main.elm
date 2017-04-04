import Html exposing (Html, beginnerProgram, div, h1, text)

main : Program Never Model Msg
main = beginnerProgram {model = initialModel, update = update, view = view}


type alias Model =
  {
  }


initialModel : Model
initialModel = {}


type Msg
  = NoMsg


update : Msg -> Model -> Model
update _ model =
  model


view : Model -> Html Msg
view _ =
  div [] [
    h1 [] [text "Yay!"]
  , h1 [] [text "Foo!"]
  ]