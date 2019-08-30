import "bootstrap";

import {initNotificationBar} from "../components/notificationBar";
import changeColumn from '../components/changeColumn';

initNotificationBar();

let clientOption = document.querySelector('#search_client');

const form = document.querySelector('.search');


clientOption.addEventListener('change', (event) => {
  form.submit();

});





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

const linesFigures = document.querySelectorAll(".nested-fields input, .nested-fields select");
console.log(linesFigures);
linesFigures.forEach((linesFigure) => {
  linesFigure.addEventListener('change', (event) => {
    totalHT();
  });
})

// document.addEventListener('keyup', (event) => {
//     totalHT();
//   });

//   document.addEventListener('click', (event) => {
//     totalHT();
//   });



// const totalTTC = () => {
//   const VAT = document.querySelector("#invoice_missions_invoices_attributes_0_vat_rate option").value;
//   console.log(VAT);
// }

// document.addEventListener('keyup', (event) => {
//     totalTTC();
//   });

//   document.addEventListener('click', (event) => {
//     totalTTC();
//   });

if (document.querySelector(".checklist-entry")) {
  changeColumn();
}
