$(function(){
	
	$('form').submit(function(){
		$(this).find(':input').filter(function(){return !this.value; }).attr("disabled", "disabled");
		return true;
	})
	
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
	
	//검색기능
	var searchForm = $('#searchForm');
	$('#searchBtn').on('click',function(e){
		if(!searchForm.find('input[name="keyword"]').val()){
			alert('검색어를 입력하세요.');
			return false;
		}
		
		searchForm.find('input[name="pageNum"]').val('1');
		e.preventDefault();
		searchForm.submit();
	});
});