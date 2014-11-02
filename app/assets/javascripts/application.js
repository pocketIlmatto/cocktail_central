// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require bootstrap-sprockets
//= require turbolinks
//= require showdown
//= require react
//= require react_ujs
//= require components
//= require_tree ./react_components
//= require cocoon

function addFields(){
    // Container <div> where dynamic content will be placed
    var container = document.getElementById("initRow");
    container.appendChild(document.createElement("br"));
    // Create an <input> element, set its type and name attributes
    var input = document.createElement("input");
    input.type = "text";
    input.name = "ingredient_list[]";
    container.appendChild(input);
    // Append a line break 
    //container.appendChild(document.createElement("br"));
}