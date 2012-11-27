$(function(){
  $('#event_date').datepicker({
    changeMonth: true,
    changeYear: true,
    dateFormat: 'yy-mm-dd',
    minDate: 0
  });
  $('#event_soundcloud_artist_name').autocomplete({
    minLength: 3,
    focus: function() { return false; },
    source: function(request, response) {
      SC.get('/users', { q: request }, function(artists) {
        if(artists.length == 0) return;
        response( $.map( artists, function( item ) {
            return {
                label: item.full_name + ' - ' + item.city + '(' + item.country + ') - Canciones: ' + item.track_count,
                value: item.full_name,
                id: item.id
            }
        }));
      });
    },
    select: function(event, ui) {
      $('#event_soundcloud_artist_id').val(ui.item.id);
      SC.get('/users/' + ui.item.id + '/tracks', function(tracks) {
        var select = '';
        for(t in tracks) {
          select += '<option value="' + tracks[t].permalink_url + '">' + tracks[t].title + ' - ' + tracks[t].genre + '</option>';
        } 
        $('#event_soundcloud_track_id').html(select);
      });
    }
  });
});