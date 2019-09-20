<!DOCTYPE html>
<html class="has-navbar-fixed-top" lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title>Laravel</title>
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,700|Material+Icons" rel="stylesheet">
        <link href="{{ asset('css/app.css') }}" />

    </head>
    <body>
        <div id="app">
        <index></index>
        </div>

        <script src="{{ asset('js/app.js') }}"></script>
    </body>
</html>
