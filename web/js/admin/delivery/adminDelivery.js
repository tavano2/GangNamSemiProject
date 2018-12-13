//컨텐츠 박스의 드롭다운 실행
$('.content-box .ui.dropdown').dropdown();

// 페이지 로드시 날짜를 오늘로 초기화
$(function() {
	var today = new Date();
	var todayStr = today.getFullYear() + '-'
			+ ('0' + (today.getMonth() + 1)).slice(-2) + '-'
			+ ('0' + today.getDate()).slice(-2);
	$('#startDate').prop('defaultValue', todayStr);
	$('#endDate').prop('defaultValue', todayStr);
});

//검색 조건 리셋
function activeReset() {
	$('#selDate .item').removeClass('active');
	$('#selDate .item:first-child').addClass('active');
	$('.content-box .ui.dropdown').dropdown('restore defaults');
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

	$('#startDate').click(function() {
		prevDate = new Date($(this).val());
	}).change(function() {
		var currDate = new Date($(this).val());
		var endDate = new Date($("#endDate").val());

		if (currDate.getTime() <= endDate.getTime()) {
			$('#selDate .item').removeClass('active');
		} else {
			var dateStr = prevDate.getFullYear() + '-'
					+ ('0' + (prevDate.getMonth() + 1)).slice(-2) + '-'
					+ ('0' + (prevDate.getDate())).slice(-2);
			$('#startDate').val(dateStr);
			
			$('#startDate').popup({
				html : '<span style="color: red;">기간을 잘못 입력했습니다.</span>',
				on: 'click',
				onHidden: () => {
					$('#startDate').popup('destroy');
			    }
			}).popup('show');
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
