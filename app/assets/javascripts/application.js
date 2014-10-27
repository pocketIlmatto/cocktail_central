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
//= require_tree .
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

function selectIngredient(id, name){
    $("#"+id).hide();

    $("#selected_ingredients").append("<li id='selected_"+id+"'>"
            +name+" <button class='btn btn-default' onclick='sayGoodbye(\"selected_"+id+
                "\",\""+name+"\")'><i class='glyphicon glyphicon-remove-circle icon-blue'></i></button></li>")

}

function removeIngredient(id, name){
    $("#"+id).hide();
    $("#popular_ingredients").append("<li id='"+id+"'>"
            +name+" <button class='btn btn-default' onclick='sayHello(\""+id+
                "\", \""+name+"\")'><i class='glyphicon glyphicon-ok-circle icon-blue'></i></button></li>")

}