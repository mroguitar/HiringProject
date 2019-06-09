$(document).ready(function() {
  
  var sendAnswer;
  var questionCount = 0;
  var correctCount = 0;
  var correctFalse = [];
  var questionId;
  var questionIdArray = [];
  var questionText;
  var firstRadioClick = 0;

  
  $('#showScorePanel').hide();

  $('#retry').hide();

  disableRadios();

  function disableRadios() {
    $("input[type='radio'").each(function() {
      $(this).prop('disabled', true);
    });
  }

  function enableRadios() {
    $("input[type='radio'").each(function() {
      $(this).prop('disabled', false);
    }); 
  }

  //getTotalCount();

  $('#next').click(function(e) {

  	e.preventDefault();

    $("input[type='radio']:checked").each(function() {
    	var idVal = $(this).attr("id");
    	var answer = $("label[for='" + idVal + "']").text();
    	$('#answer').val(answer);
    	sendAnswer = $('#answer').val();
    	
    });


    uncheckAllRadios();
    

    questionCount++;
    getQuestion();


  });

  function getQuestion() {
  	var csrfName = $('#csrf_name').val();
    var csrfValue = $('#csrf_value').val();

    sendQuestion = $('#question').text();
    questionId   = $('#questionId').val();

    if ( questionId != '' ) {
      questionIdArray.push(questionId);
    }

    
    $.ajax({
        url: 'assessment',
        type: 'POST',
        dataType: 'json',
        data: { 'questionIdArray' : questionIdArray, 'questionCount' : questionCount, 'sendQuestion': sendQuestion, 'sendAnswer' : sendAnswer, 'csrf_name' : csrfName, 'csrf_value' : csrfValue },
        success: function (data) {

        	if ( typeof data[0]['Finished'] !== 'undefined' ) {
            for (var i = 0; i < data.length; i++ ) {
              if ( data[i].totalCount ) {
                var totalCount = data[i].totalCount;
              }

              if ( data[i].Correct ) {
                  correctFalse.push(data[i].Correct);
              }
            }
        		finishAndRestartAssessment(totalCount);
          } else {
        
            if ( typeof data[1]['Beginning'] !== "undefined" ) {

              for ( var i = 0; i < data.length; i++ ) {
                if ( data[i].questionId ) {
                  questionId = data[i].questionId;
                }

                if ( data[i].questionText ) {
                  questionText = data[i].questionText;
                }
              }

              $('#questionId').val(questionId);
              $('#question').empty().append(questionText);

              questionCount = 0;

              enableRadios();

            } else {
  		        for ( var i = 0; i < data.length; i++ ) {

                if ( data[i].questionId ) {
                  questionId = data[i].questionId;
                }

                if ( data[i].questionText ) {
                  questionText = data[i].questionText;
                }

                if ( data[i].Correct ) {
                  correctFalse.push(data[i].Correct);
                }
  		        	
  		        }

              $('#questionId').val(questionId);
              $('#question').empty().append(questionText);
            }

		      }
        },
        error: function () {
            console.log('it failed!');
        }
    });
  }

  // Function for radio click to sendAnswer
  $("input[type='radio'").click(function() {
  	firstRadioClick++;
  	if ( firstRadioClick >= 1) {
  	var idVal = $(this).attr("id");
	  var answer = $("label[for='" + idVal + "']").text();
	  $('#answer').val(answer);
	  sendAnswer = $('#answer').val();
  	} else {
  	  return;
  	}
  });

  // Function to show score to user and call proper functions to record score and set up for another assessment
  function finishAndRestartAssessment(totalCount) {
    var totalQuestions = totalCount;
    
    for ( var i = 0; i < correctFalse.length; i++ ) {
      if ( correctFalse[i] == 'true' ) {
        correctCount++;
      }
    }

    var score = (correctCount / totalQuestions) * 100;

    if ( score > 90 ) {

        $('#showScore').empty().append('You did excellent! Your score is ' + Math.round(score) + '%');
        $('#showScorePanel').show();
        recordScore(score);
        setUpForAnotherAssessment();

    } else if ( score > 80 && score < 90) {
      
        $('#showScore').empty().append('You did pretty good! Your score is ' + Math.round(score) + '%');
        $('#showScorePanel').show();
        recordScore(score);
        setUpForAnotherAssessment();

    } else if ( score > 70 && score < 80) {
  
        $('#showScore').empty().append('Bet you can beat this score! Your score is ' + Math.round(score) + '%');
        $('#showScorePanel').show();
        recordScore(score);
        setUpForAnotherAssessment();

    } else {

        $('#showScore').empty().append('You should probably retry! Your score is ' + Math.round(score) + '%');
        $('#showScorePanel').show();
        recordScore(score);
        setUpForAnotherAssessment();
    }

  }

  //Function to record score
  function recordScore(score) {
    var csrfName = $('#csrf_name').val();
    var csrfValue = $('#csrf_value').val();

    var score = Math.round(score);

    $.ajax({
        url: 'assessment',
        type: 'POST',
        dataType: 'json',
        data: { 'score' : score, 'csrf_name' : csrfName, 'csrf_value' : csrfValue },
        success: function (data) {
          console.log(data);
          
        },
        error: function () {
            console.log('it failed!');
        }
    });
  }

  //Function to set up for next assessment
  function setUpForAnotherAssessment() {
    $('#next').hide();
    $('#retry').show();
    disableRadios();
  }

  //If user decides to Retry
  $('#retry').click(function() {
    resetGlobals();
    uncheckAllRadios();
    $('#next').show();
    $('#retry').hide();
    $('#showScorePanel').hide();
    $('#question').empty().append('Click Next To Begin');
    $('#answer').val('');
    $('#questionId').val('');
  });

  // Function to resetGlobals
  function resetGlobals() {
    sendAnswer;
    questionCount = 0;
    correctCount = 0;
    correctFalse = [];
    questionId;
    questionIdArray = [];
    questionText;
    firstRadioClick = 0;
  }
   
  // Function to uncheck all Radios
  function uncheckAllRadios() {
    $("input[type='radio'").each(function() {
      $(this).prop('checked', false);
    });
  }
});