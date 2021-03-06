import "bootstrap";
import "../plugins/flatpickr"
import { loadDynamicBannerText } from '../components/banner';
import { initNotificationBar } from "../components/notificationBar";
import { changeColumn } from '../components/changeColumn';
import { initFacture } from '../components/facture';
import {formValidation} from "../components/formValidation";
import { turnoverChart } from '../components/analyticsCharts';
import { donutChartbis } from '../components/donutChartbis';
import { permit } from '../components/permitAuthorization';
// import { showDate } from '../components/showDate';
import { callForSimulation } from '../components/callForSimulation';
permit();


if (document.querySelector('#new_invoice')) {
  initFacture();
}

if (document.querySelector('#banner-typed-text')) {
loadDynamicBannerText();
}

if (document.querySelector(".notification-bar")) {
     initNotificationBar();
}


if (document.querySelector('a.step')) {
  formValidation();
}

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

