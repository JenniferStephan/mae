import "bootstrap";
import "../plugins/flatpickr"

import {initNotificationBar} from "../components/notificationBar";
import changeColumn from '../components/changeColumn';

initNotificationBar();

if (document.querySelector('#search_client')) {
  let clientOption =document.querySelector('#search_client');
  const form = document.querySelector('.search');
  clientOption.addEventListener('change', (event) => {
    form.submit();
  });
}

const totalHT = () => {
  const unitPrice = document.querySelector("#invoice_missions_invoices_attributes_0_price_rate").value;
  const quantity = document.querySelector("#invoice_missions_invoices_attributes_0_man_day_quantity").value;
  const vat = document.querySelector("#invoice_missions_invoices_attributes_0_vat_rate").value;
  const amountHT = quantity * unitPrice;
  const amountTTC = (amountHT * vat) + amountHT;
  if (amountHT > 0) {
    document.querySelector(".total-HT").innerHTML = amountHT;
    document.querySelector(".total-TTC").innerHTML = amountTTC;
  }
}
if (document.querySelector('.nested-fields')) {
  const linesFigures = document.querySelectorAll(".nested-fields input, .nested-fields select");
    linesFigures.forEach((linesFigure) => {
      linesFigure.addEventListener('change', (event) => {
      totalHT();
    });
  });
}

if (document.querySelector(".checklist-entry")) {
  changeColumn();
}
