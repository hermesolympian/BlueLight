<div class="footer">
				Copyright &copy; 2013.
			</div>
		</div>
			<SCRIPT>
		$("#menuHolder > li").click(function(){
			if(false == $('ul',this).is(':visible')) {
		//$('#menuHolder > ul').slideUp(300);	
			$('ul',this).slideUp(300);

	}
	//$(this).next().slideToggle(300);	

	$('ul',this).slideToggle(300);
});

$('#menuHolder > li > ul:eq(0)').show();
        </SCRIPT>
	</body>
</html>