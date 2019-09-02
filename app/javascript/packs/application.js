import "bootstrap";
import "../plugins/flatpickr"
import { loadDynamicBannerText } from '../components/banner';
import {initNotificationBar} from "../components/notificationBar";
import changeColumn from '../components/changeColumn';
import {initFullCalendar} from '../plugins/fullcalendar';





// loadDynamicBannerText();

if (document.querySelector(".notification-bar")) {
    initNotificationBar();
    initFullCalendar();
}




if (document.querySelector(".checklist-entry")) {
  changeColumn();
}
