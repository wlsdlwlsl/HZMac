$(function(){

 // 엘라스틱서치 basepath와 index 지정.
	  var basePath = 'http://3.34.199.196:9200';
	  var index = 'healthcarecenterlist'

	  var noresults = $('#noresults');
	  var resultdiv = $('tbody');
	  var searchbox = $('input#search');
	  var timer = 0;

	  // 1초뒤에 search() 실행.
	  searchbox.keyup(function () {
	    clearTimeout(timer); //0으로 초기화
	    timer = setTimeout(search, 1000);
	  });

	  // Elastic Search로 부터 response 가져오기
	  var getResponse = function (query) {
	    var url = basePath + '/' + index + '/' + '_search';
	    return fetch(url, {
	        method: 'POST',
	        headers: {
	            'Content-Type': 'application/json'
	        },
	        body: '{"size":237,"query":{"multi_match":{"query":"' + query + '"}}}'
	    })
	    .then(function(response) {
	      return response.text();
	    })
	    .then(function(data){
	      var data_obj = JSON.parse(data);
	      return data_obj
	    })
	  }

	  async function search() {
	    // 결과가 나오기 전 클리어.
	    noresults.hide();
	    resultdiv.empty();
	    // input값 가져오기
	    let query = searchbox.val();

			let response = await getResponse(query)
			let results = response['hits']['hits'];
			if (results.length > 0) {
				console.log(results.length)
				//가져온 값 loop으로 돌려서 테이블에 집어 넣기.
				for (var item in results) {
					let name = results[item]._source.CenterName;
					let add = results[item]._source.CenterAddress;
					let phonenumber = results[item]._source.CenterPhoneNumber;
					resultdiv.append('<tr><td>' + name + "</td><td>" + add + "</td><td>" + phonenumber +"</td></tr>");
				}
			} else {
				noresults.show();//아무것도없을시 없는부분 show().
			}

	  }

})
