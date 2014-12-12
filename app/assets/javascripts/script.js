var month_name = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
var day_name = ['Sun','Mon','Tue','Wed','Thu','Fri','Sat'];
var d;

window.onload = function(){
  d = new Date();
  var month = d.getMonth(); //0-11
  var year = d.getFullYear(); //2014
  var first_date = month_name[month] + " " + 1 + " " + year;
  //September 1 2014
  var tmp = new Date(first_date).toDateString();
  //Mon Sep 01 2014 ...
  var first_day = tmp.substring(0, 3); //Mon
  var day_no = day_name.indexOf(first_day); //1
  var days = new Date(year, month+1, 0).getDate(); //30
  //Tue Sep 30 2014 ...
  var calendar = get_calendar(day_no, days);
  document.getElementById("calendar-month-year").innerHTML = month_name[month]+" "+year;
  document.getElementById("calendar-dates").appendChild(calendar);
}

function left(){
  var new_day = new Date(d.getFullYear(),d.getMonth()-1, d.getDate());
  d = new_day;
  var new_first_date = month_name[new_day.getMonth()] + " " + 1 + " " + new_day.getFullYear();
  var new_tmp = new Date(new_first_date).toDateString();
  var new_first_day = new_tmp.substring(0, 3); //Mon
  var new_day_no = day_name.indexOf(new_first_day); //1
  var new_days = new Date(new_day.getFullYear(), new_day.getMonth()+1, 0).getDate(); //30
  var new_calendar = get_calendar(new_day_no, new_days);
  document.getElementById("calendar-dates").innerHTML = "";
  document.getElementById("calendar-month-year").innerHTML = month_name[new_day.getMonth()]+" "+new_day.getFullYear();
  document.getElementById("calendar-dates").appendChild(new_calendar);

}

function right(){
  var new_day = new Date(d.getFullYear(),d.getMonth()+1, d.getDate());
  d = new_day;
  var new_first_date = month_name[new_day.getMonth()] + " " + 1 + " " + new_day.getFullYear();
  var new_tmp = new Date(new_first_date).toDateString();
  var new_first_day = new_tmp.substring(0, 3); //Mon
  var new_day_no = day_name.indexOf(new_first_day); //1
  var new_days = new Date(new_day.getFullYear(), new_day.getMonth()+1, 0).getDate(); //30
  var new_calendar = get_calendar(new_day_no, new_days);
  document.getElementById("calendar-dates").innerHTML = "";
  document.getElementById("calendar-month-year").innerHTML = month_name[new_day.getMonth()]+" "+new_day.getFullYear();
  document.getElementById("calendar-dates").appendChild(new_calendar);

}

function get_calendar(day_no, days){
  var table = document.createElement('table');
  var tr = document.createElement('tr');
  //row for the day letters
  for(var c=0; c<=6; c++){
    var td = document.createElement('td');
    td.innerHTML = "SMTWTFS"[c];
    tr.appendChild(td);
  }
  table.appendChild(tr);
  //create 2nd row
  tr = document.createElement('tr');
  var c;
  for(c=0; c<=6; c++){
    if(c == day_no){
      break;
    }
    var td = document.createElement('td');
    td.innerHTML = "";
    tr.appendChild(td);
  }
  var count = 1;
  for(; c<=6; c++){
    var td = document.createElement('td');
    var day = new Date(d.getFullYear(),d.getMonth()+1, c);
    
    td.onclick=function(){
      var id = $(this).attr("id");

      $.ajax({
        url: "/activities/",
      });
    }

    td.innerHTML = count;
    count++;
    tr.appendChild(td);
  }
  table.appendChild(tr);
  //rest of the date rows
  for(var r=3; r<=7; r++){
    tr = document.createElement('tr');
    for(var c=0; c<=6; c++){
      if(count > days){
        table.appendChild(tr);
        return table;
      }
      var td = document.createElement('td');
      td.onclick=function(){window.alert(count)};
      td.innerHTML = count;
      count++;
      tr.appendChild(td);
    }
    table.appendChild(tr);
  }
  return table;
}

function goto(day){

}