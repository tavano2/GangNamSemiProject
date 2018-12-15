//컨텐츠 박스의 드롭다운 실행
$('.content-box .ui.dropdown').dropdown();

// 페이지 로드시 날짜를 오늘로 초기화
$(function() {
	var today = new Date();	//오늘 날짜로 Date 객체 생성
	var todayStr = today.getFullYear() + '-'
			+ ('0' + (today.getMonth() + 1)).slice(-2) + '-'
			+ ('0' + today.getDate()).slice(-2);	//Date 객체를 'yyyy-mm-dd' 스트링 객체로 변환
	$('#startDate').prop('defaultValue', todayStr);	//defaultValue에 넣으면 reset버튼을 클릭하면 defaultValue로 초기화됨
	$('#endDate').prop('defaultValue', todayStr);
});

//검색 조건 리셋
function activeReset() {
	$('#selDate .item').removeClass('active');	//기간 선택에 active 클래스 제거
	$('#selDate .item:first-child').addClass('active');	//기간 선택을 오늘로 초기화
	$('#searchBox .ui.dropdown').dropdown('restore defaults');	//드롭다운 선택 초기화
	$('#orderState .master.checkbox').checkbox('check');
}

// 기간 선택 메뉴 클릭시 active 및 날짜 변경
$('#selDate .item').on('click', function() {
	$('#selDate .item').removeClass('active');
	$(this).addClass('active');

	var today = new Date();
	var todayStr = today.getFullYear() + '-'
			+ ('0' + (today.getMonth() + 1)).slice(-2) + '-'
			+ ('0' + today.getDate()).slice(-2);
	var startDate;
	
	switch ($(this).text()) {
	case "오늘":
		startDate = today;
		break;
	case "어제":
		var startDateTime = today.getTime() - (1000 * 60 * 60 * 24);
		startDate = new Date(startDateTime);
		break;
	case "3일":
		var startDateTime = today.getTime() - (1000 * 60 * 60 * 24 * 3);
		startDate = new Date(startDateTime);
		break;
	case "7일":
		var startDateTime = today.getTime() - (1000 * 60 * 60 * 24 * 7);
		startDate = new Date(startDateTime);
		break;
	case "15일":
		var startDateTime = today.getTime() - (1000 * 60 * 60 * 24 * 15);
		startDate = new Date(startDateTime);
		break;
	case "1개월":
		var startDateTime = today.getTime() - (1000 * 60 * 60 * 24 * 30);
		startDate = new Date(startDateTime);
		break;
	case "3개월":
		var startDateTime = today.getTime() - (1000 * 60 * 60 * 24 * 91);
		startDate = new Date(startDateTime);
		break;
	case "6개월":
		var startDateTime = today.getTime() - (1000 * 60 * 60 * 24 * 183);
		startDate = new Date(startDateTime);
		break;
	}
	
	var startDateStr = startDate.getFullYear() + '-'
			+ ('0' + (startDate.getMonth() + 1)).slice(-2)
			+ '-' + ('0' + (startDate.getDate())).slice(-2);
	
	$('#startDate').val(startDateStr);
	$('#endDate').val(todayStr);
});

// 기간 임의 선택시 기간 잘 정했는지 확인하고 기간 선택 메뉴 active 풀기
$(function() {
	var prevDate;

	$('#startDate').click(function() {	//클릭시
		prevDate = new Date($(this).val());	//선택 전의 날짜 백업
	}).change(function() {					//값 변경시
		var currDate = new Date($(this).val());
		var endDate = new Date($("#endDate").val());

		if (currDate.getTime() <= endDate.getTime()) {
			$('#selDate .item').removeClass('active');	//기간 선택에서 active 제거
		} else {
			var dateStr = prevDate.getFullYear() + '-'
					+ ('0' + (prevDate.getMonth() + 1)).slice(-2) + '-'
					+ ('0' + (prevDate.getDate())).slice(-2);
			$('#startDate').val(dateStr);	//선택 전의 날짜로 변경
			
			$('#startDate').popup({	//팝업 요소 생성
				html : '<span style="color: red;">기간을 잘못 입력했습니다.</span>',
				on: 'click',	//클릭할때 보여짐
				onHidden: () => {	//팝업창 히든시 팝업 요소 제거
					$('#startDate').popup('destroy');
			    }
			}).popup('show');	//팝업 보이기
		}
	});

	$('#endDate').click(function() {
		prevDate = new Date($(this).val());
	}).change(function() {
		var currDate = new Date($(this).val());
		var startDate = new Date($("#startDate").val());

		if (currDate.getTime() >= startDate.getTime()) {
			$('#selDate .item').removeClass('active');
		} else {
			var dateStr = prevDate.getFullYear() + '-'
					+ ('0' + (prevDate.getMonth() + 1)).slice(-2) + '-'
					+ ('0' + (prevDate.getDate())).slice(-2);
			$('#endDate').val(dateStr);
			
			$('#endDate').popup({
				html : '<span style="color: red;">기간을 잘못 입력했습니다.</span>',
				on: 'click',
				onHidden: () => {
					$('#endDate').popup('destroy');
			    }
			}).popup('show');
		}
	});
});


//채크박스
$('#orderState .master.checkbox').checkbox({
	onChecked: function() {
		var $childCheckbox  = $(this).closest('tr').find('.child.checkbox');
		$childCheckbox.checkbox('check');
	},
	onUnchecked: function() {
		var $childCheckbox  = $(this).closest('tr').find('.child.checkbox');
		$childCheckbox.checkbox('uncheck');
	}
});

$('#orderState .chk-list .child.checkbox').checkbox({
	fireOnInit : true,
	onChange   : function() {
		var $listGroup = $(this).closest('.chk-list');
		var $parentCheckbox = $listGroup.siblings('.master.checkbox');
		var $checkbox = $listGroup.find('.checkbox');
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
			$parentCheckbox.checkbox('set indeterminate');
		}
	}
});





//페이징넘버 클릭시 active
$('.order-result .pagination.menu .item:not(.icon.item)').click(function(){
	$('.order-result .pagination.menu .item').removeClass('active');
	$(this).addClass('active');
});

//검색결과 리셋
$('#resultReset').click(function(){
	resultBox.reset();
	$('#resultBox .ui.dropdown').dropdown('restore defaults');
	$('#resultBox tbody').text("");
});
