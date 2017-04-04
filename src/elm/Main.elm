import Html exposing (Html, beginnerProgram, div, h1, text, textarea)
import Html.Attributes exposing (cols, rows, style)


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
  div [style ["flex" => "1", "background" => "#eeeeee", "height" => "100%", "padding" => "16px"]] [
    h1 [] [text "EDITOR"]
  , textarea [rows 20, cols 100] []
  ]

markdownShowingView : Model -> Html Msg
markdownShowingView model =
  div [style ["flex" => "1", "background" => "#ffffff", "height" => "100%"]] [
      h1 [] [text "Foo!"]
    ]