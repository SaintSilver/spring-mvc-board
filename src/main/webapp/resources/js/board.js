$(function(){
	
	var actionForm = $('#actionForm');
	
	//페이징
	$('.paginate_button a').on('click',function(e){
		e.preventDefault();
		actionForm.find('input[name="pageNum"]').val($(this).attr('href'));
		actionForm.submit();
	});
	
	//게시물 조회
	$('.move').on('click',function(e){
		e.preventDefault();
		actionForm.append('<input type="hidden" name="bno" value="' + $(this).attr('href') + '">');
		actionForm.attr('action','/board/get');
		actionForm.submit();
	});
});