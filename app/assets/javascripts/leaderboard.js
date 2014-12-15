
$(loadSports);

function loadSports() {
    $('#sports').html($('<option>',{value:0}).text('Select a sport'));
    $.getJSON('sports.json',
        function (data) {
            for( d in data ) {
                $('<option>',{ value: data[d].id }).text(data[d].name).appendTo('#sports');
            }
        });
}




$(function() {
    $('#sports').change(loadLeaders);
});

function loadLeaders() {
    var sport_id = $('#sports > option:checked').val();


}