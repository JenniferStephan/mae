import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import '@fullcalendar/core/main.css';
import '@fullcalendar/daygrid/main.css';


 const initFullCalendar = ()=>{
  console.log("init")
  var calendarEl = document.getElementById('calendar');
  var calendar = new Calendar(calendarEl, {
    plugins: [ dayGridPlugin ]
  });
  calendar.setOption('locale', 'fr');
  calendar.render();
 }

export {initFullCalendar};
