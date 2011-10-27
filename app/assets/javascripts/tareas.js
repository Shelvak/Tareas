jQuery(function($){
    $('a.tarea_completa').live('ajax:success', function(xhr, data){
        $(this).parents('tr:first').replaceWith(data);
    });


    $('a.borrar').live('ajax:success', function(xhr, data){
        $(this).parents('tr:first').replaceWith(data);
    });


    $('#tarea_auto_responsable').autocomplete({
    source: '/responsables/autocompletar.js'
    });
    
});