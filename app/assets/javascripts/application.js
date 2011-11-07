// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

// task_ledger timer
var t;
var elapsed = 0;
// start functions when body loaded
function init()
{
  elapsed = getElapsed();
  if(elapsed > 0)
    startTimer();
  bindFunctions();
}


// get elapsed time of session
function getElapsed()
{
  var timer = document.getElementById('task_ledger_timer');

  if(timer != null)
  {
		var timer_value = timer.innerHTML;
		if(timer_value != "")
		{
			var elapsed_seconds = parseInt(timer_value);
			if(!isNaN(elapsed_seconds))
			{
				return elapsed_seconds;
			}
			else
				return 0;
		}
	}
	else
	  return -1;
}

function startTimer()
{
  
	var time = elapsed;

	var s = time % 60;
	time = parseInt(time / 60);
	var m = time % 60;
	time = parseInt(time / 60);
	var h = time % 60;


	// add a zero in front of numbers<10
	m=checkTime(m);
	s=checkTime(s);
	elapsed++;
	var timer = document.getElementById('task_ledger_timer');
	if(timer != null)
	{
		timer.innerHTML= h+":"+m+":"+s;
		t=setTimeout("startTimer()",1000);
	}

}

function checkTime(i)
{
	if (i<10)
		{
			i="0" + i;
		}
	return i;
}


function bindFunctions()
{
  // to fadeout when deleting a task ledger
  $('.delete_item').bind('ajax:complete', function(){
  $(this).closest('tr').fadeOut();
  });
}




