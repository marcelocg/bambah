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

  $( "#spanCarregando" ).hide();

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
        $( "#spanCarregando" ).show();
        $('#flash').hide();
      },
      complete: function(result) { 
        $( "#spanCarregando" ).hide();
        buscarLancamentos = null;
      },
      error: function(result) {
        $( "#spanCarregando" ).hide();
        if (result.statusText != "abort") {
          $('#flash').show();
        }
      }
    });
  }
});