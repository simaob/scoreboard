// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Stimulus from "@hotwired/stimulus"
import "@hotwired/turbo-rails"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "controllers"

ActiveStorage.start()

import 'bootstrap'
import 'bootstrap-datepicker'
import './src/application.scss'

const feather = require('feather-icons');

jQuery.fn.datepicker.defaults.format = "dd/mm/yyyy";

document.addEventListener('turbo:load', function() {
  feather.replace()
});
