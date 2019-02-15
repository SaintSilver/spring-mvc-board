var replyService = (function() {

	function add(reply, callback, error) {

		$.ajax({
			type : 'POST',
			url : '/reply/new',
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, err) {
				if (error) {
					error(err);
				}
			}
		})
	}

	function getList(param, callback, error) {
		var bno = param.bno;
		var page = param.page || 1;
		$.getJSON("/reply/pages/" + bno + "/" + page, function(data) {
			if (callback) {
				callback(data);
			}
		}).fail(function(xhr, status, err) {
			if (error) {
				error(err);
			}
		})
	}

	function remove(rno, callback, error) {
		$.ajax({
			type : 'DELETE',
			url : '/reply/' + rno,
			success : function(deleteResult, status, xhr) {
				if (callback) {
					callback(deleteResult);
				}
			},
			error : function(xhr, status, err) {
				if (error) {
					error(err);
				}
			}
		})
	}

	function update(reply, callback, error) {
		$.ajax({
			type : 'PUT',
			url : '/reply/' + reply.rno,
			data : JSON.stringify(reply),
			contentType : 'application/json; charset=utf-8',
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, err) {
				if (error) {
					error(err);
				}
			}
		})
	}

	function get(rno, callback, error) {

		$.get("/reply/" + rno, function(result) {
			if (callback) {
				callback(result)
			}
		}).fail(function(xhr, status, err) {
			if (error) {
				error(err);
			}
		})
	}

	return {
		add : add,
		getList : getList,
		remove : remove,
		update : update,
		get : get
	};
})();
