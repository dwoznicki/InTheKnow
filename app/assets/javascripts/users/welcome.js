$(document).ready(function(){
	// bindListeners();
});

function bindListeners() {
	$('body').on('click', '.other-tag', function(e) {
		e.preventDefault();
		var user_id = $(this).attr('href');
		var tag_id = $(this).attr('id');
		addTag(user_id, tag_id);
	});
	$('body').on('click', '.my-tag', function(e) {
		e.preventDefault();
		var user_id = $(this).attr('href');
		var tag_id = $(this).attr('id');
		removeTag(user_id, tag_id);
	})
};

function addTag(user_id, tag_id) {
	$.ajax({
		method: 'GET',
		url: 'users/' + user_id + '/add_tag' + "?tag_id=" + tag_id,
	})
	.done(function(response) {
		$('#' + response.id).remove()
		$('.my-tags').append("<span class='btn btn-default my-tag'>" + response.subject + " &times;</span>")
	});
};

function removeTag(user_id, tag_id) {
	$.ajax({
		method: 'GET',
		url: 'users/' + user_id + '/remove_tag' + "?tag_id=" + tag_id,
	})
	.done(function(response) {
		$('#' + response.id).remove()
		$('.other-tags').append("<span class='btn btn-success other-tag'>" + response.subject + " +</span>")
	});
};