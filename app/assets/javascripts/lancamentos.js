$(function() {
  $( "#spinMes" ).spinner({
    spin: function( event, ui ) {
            if ( ui.value > 12 ) {
              $( this ).spinner( "value", 1 );
              return false;
            } else if ( ui.value < 1 ) {
              $( this ).spinner( "value", 12 );
              return false;
            }
          }
  });
  
  $( "#spinMes" ).on( "spinstop", function( event, ui ) {
    $('#filtroLancamentos').submit();
  });

  $('#filtroLancamentos').submit(loadLancamentos);
  var buscarLancamentos = null;

  function loadLancamentos(event) {
    event.preventDefault();

    if (buscarLancamentos) {
      buscarLancamentos.abort();
    }

    var form = $(this).serialize();
    buscarLancamentos = $.ajax('/lancamentos', {
      data: form,
      dataType: 'script',
      cache: false,
      timeout: 10000, //dez segundos
      beforeSend: function(result) { 
        $("#loadingDiv").modal('toggle');
        $('#flash').hide();
      },
      complete: function(result) { 
        $("#loadingDiv").modal('toggle');
        buscarLancamentos = null;
      },
      error: function(result) {
        if (result.statusText != "abort") {
          $('#flash').show();
        }
      }
    });
  }
});