import "bootstrap";
import "../plugins/flatpickr"
import { loadDynamicBannerText } from '../components/banner';
import { initNotificationBar } from "../components/notificationBar";
import { changeColumn } from '../components/changeColumn';
import { initFacture } from '../components/facture';



initNotificationBar();

if (document.querySelector('#new_invoice')) {
  initFacture();
}


loadDynamicBannerText();

if (document.querySelector('#search_client')) {
  let clientOption =document.querySelector('#search_client');
  const form = document.querySelector('.search');
  clientOption.addEventListener('change', (event) => {
    form.submit();
  });
}


if (document.querySelector(".checklist-entry")) {
  changeColumn();
}
