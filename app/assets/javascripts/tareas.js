jQuery(function($){
    $('a.tarea_completa').live('ajax:success', function(xhr, data){
        $(this).parents('tr:first').replaceWith(data);
    });
});

jQuery(function($){
    $('a.borrar').live('ajax:success', function(xhr, data){
        $(this).parents('tr:first').replaceWith(data);
    });
});