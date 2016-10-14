module Main exposing (main)

import Html.App exposing (program)
import Html exposing (Html, div, text)
import Html.Attributes exposing (style)
import Utils exposing (noCmds, (=>), pc)
import Cursor


main : Program Never
main =
    program
        { init = ( init, Cmd.none )
        , subscriptions = subscriptions
        , update = update
        , view = view
        }


type alias Model =
    { cursor : Cursor.Model }


type Msg
    = CursorMsg Cursor.Msg


init : Model
init =
    Model
        Cursor.init


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        CursorMsg subMsg ->
            noCmds { model | cursor = Cursor.update subMsg model.cursor }


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.map CursorMsg Cursor.subscriptions


view : Model -> Html msg
view { cursor } =
    let
        css =
            style
                [ "width" => pc 100
                , "height" => pc 100
                , "background" => "hsl(113, 24%, 35%)"
                ]
    in
        div [ css ] [ Cursor.view cursor ]
