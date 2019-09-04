import "bootstrap";
import "../plugins/flatpickr"
import { loadDynamicBannerText } from '../components/banner';
import { initNotificationBar } from "../components/notificationBar";
import { changeColumn } from '../components/changeColumn';
import { initFacture } from '../components/facture';
import {formValidation} from "../components/formValidation";
// import {initFullCalendar} from '../plugins/fullcalendar';
import { turnoverChart } from '../components/analyticsCharts';
import { donutChartbis } from '../components/donutChartbis';
import { gaugeChart } from '../components/gaugeChart';

if (document.querySelector('#new_invoice')) {
  initFacture();
}


// loadDynamicBannerText();

if (document.querySelector(".notification-bar")) {
    initNotificationBar();

}



//formValidation();


if (document.querySelector('#search_client')) {
  let clientOption = document.querySelector('#search_client');
  const form = document.querySelector('.search');
  clientOption.addEventListener('change', (event) => {
    form.submit();
  });
}

if (document.querySelector(".checklist-entry")) {
  changeColumn();
}
