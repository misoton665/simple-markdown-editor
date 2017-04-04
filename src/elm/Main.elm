import Html exposing (Html, beginnerProgram, div, h1, text)
import Html.Attributes exposing (style)


(=>) = (,)


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
view model =
  div [style ["display" => "flex", "height" => "100%"]] [
    markdownEditingView model
  , markdownShowingView model
  ]

markdownEditingView : Model -> Html Msg
markdownEditingView model =
  div [style ["flex" => "1", "background" => "#eeeeee", "height" => "100%"]] [
    h1 [] [text "Yay!"]
  ]

markdownShowingView : Model -> Html Msg
markdownShowingView model =
  div [style ["flex" => "1", "background" => "#ffffff", "height" => "100%"]] [
      h1 [] [text "Foo!"]
    ]