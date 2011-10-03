jQuery(function($){
    $('a.tarea_completa').live('ajax:success', function(xhr, data){
        $(this).parent('tr:first').replaceWith(data);
    });
});
//jQuery(function($) {
//
//+  $('a.completar_tarea').live('ajax:success', function(xhr, data) {
//
//+    $(this).parents('tr:first').replaceWith(data);
//
//+  });
//
//+});