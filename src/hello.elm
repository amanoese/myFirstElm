module Main exposing (..)

import Browser
import Html exposing (..) --(h1, div, p, text)
import Html.Attributes exposing (..) -- (class..)
import Html.Events exposing (onClick)
import Bootstrap.CDN as CDN
import Bootstrap.Grid as Grid
import Bootstrap.Grid.Row as Row
import Bootstrap.Grid.Col as Col
import Bootstrap.Button as Button

type Msg = Increment | Decrement | Push
type alias Model = { count : Int , count2 : Int }

update : Msg -> Model -> Model
update msg model = 
  case msg of
    Increment -> { model | count  = model.count + 1 }
    Decrement -> { model | count  = model.count - 1 }
    Push ->      { model | count2 = model.count2 + 1 }

main =
  Browser.sandbox { init = Model 0 0, update = update, view = view }

view model =
  Grid.container []
    [ CDN.stylesheet
    , div [ class "jumbotron" ]
      [ h1 [] [ text "Hello,Elm!" ]
      , p [] [ text "Build responsive Elm applications using Bootstrap 4."]
      ]
    , Grid.container []
      [ Grid.row [ Row.attrs [ class "justify-content-center text-center align-middle p-1" ] ]
          [ Grid.col []
              [ Button.button [ Button.success, Button.attrs [ onClick Push ] ]  [ text ("Push:" ++ String.fromInt model.count2) ] ]
          ]
      , Grid.row [ Row.attrs [ class "justify-content-center text-center align-middle p-1" ] ]
          [ Grid.col [ Col.attrs [ class "col-sm-1" ] ]
              [ Button.button [ Button.primary, Button.attrs [ onClick Increment ] ] [ text "+" ] ]
          , Grid.col [ Col.attrs [ class "col-sm-1" ] ]
              [ div [] [ text (String.fromInt model.count) ] ]
          , Grid.col [ Col.attrs [ class "col-sm-1" ] ]
              [ Button.button [ Button.primary, Button.attrs [ onClick Decrement ] ] [ text "-" ] ]
          ]
      ]
    ]
