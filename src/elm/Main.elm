import Html exposing (Html, beginnerProgram, div, h1, text, textarea)
import Html.Attributes exposing (cols, rows, style)
import Html.Events exposing (onInput)
import Markdown

(=>) = (,)


main : Program Never Model Msg
main = beginnerProgram {model = initialModel, update = update, view = view}


type alias Model =
  {
    markdownText: String
  }


initialModel : Model
initialModel =
  {
    markdownText = ""
  }


type Msg
  = NoMsg
  | OnTextEdited String


update : Msg -> Model -> Model
update msg model =
  case msg of
    OnTextEdited text ->
      {model | markdownText = text}

    _ -> model


view : Model -> Html Msg
view model =
  div [style styles.top] [
    markdownEditingView model
  , markdownShowingView model
  ]


markdownEditingView : Model -> Html Msg
markdownEditingView model =
  div [style styles.editingView] [
    h1 [] [text "EDITOR"]
  , textarea [style styles.editor,rows 20, cols 100, onInput OnTextEdited] []
  ]


markdownShowingView : Model -> Html Msg
markdownShowingView model =
  div [style styles.showingView] [
    h1 [] [text "VIEWER"]
  , Markdown.toHtml [style styles.viewer] model.markdownText
  ]


type alias Style =
  List (String, String)


styles : {
  top: Style,
  editingView: Style,
  editor: Style,
  showingView: Style,
  viewer: Style
  }
styles =
  {
    top = ["display" => "flex", "height" => "100%"]
  , editingView = ["width" => "50%", "background" => "#eeeeee", "height" => "100%", "padding" => "16px", "display" => "flex", "flex-direction" => "column", "resize" => "none"]
  , editor = ["width" => "100%", "resize" => "none", "height" => "80%", "padding" => "4px"]
  , showingView = ["flex" => "1", "background" => "#ffffff", "height" => "100%", "padding" => "16px", "width" => "50%"]
  , viewer = ["width" => "100%", "overflow" => "scroll", "padding" => "4px", "height" => "80%", "border" => "1px solid #aaa"]
  }