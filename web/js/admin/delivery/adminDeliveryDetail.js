//채크박스
$('.order-detail .master.checkbox').checkbox({
	onChecked: function() {
		var $childCheckbox  = $('.order-detail tbody').find('.checkbox');
		$childCheckbox.checkbox('check');
	},
	onUnchecked: function() {
		var $childCheckbox  = $('.order-detail tbody').find('.checkbox');
		$childCheckbox.checkbox('uncheck');
	}
});

$('.order-detail tbody .checkbox').checkbox({
	fireOnInit : true,
	onChange   : function() {
		var $parentCheckbox = $('.order-detail .master.checkbox');
		var $checkbox = $('.order-detail tbody .checkbox');
		var allChecked = true;
		var allUnchecked = true;
		
		$checkbox.each(function() {
			if( $(this).checkbox('is checked') ) {
				allUnchecked = false;
			} else {
				allChecked = false;
			}
		});
		
		if(allChecked) {
			$parentCheckbox.checkbox('set checked');
		} else if(allUnchecked) {
			$parentCheckbox.checkbox('set unchecked');
		} else {
			$parentCheckbox.checkbox('set unchecked');
		}
	}
});