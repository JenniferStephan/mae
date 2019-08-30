import "bootstrap";

import {initNotificationBar} from "../components/notificationBar";

initNotificationBar();


if (document.querySelector('#search_client')) {
  let clientOption =document.querySelector('#search_client');

const form = document.querySelector('.search');

  clientOption.addEventListener('change', (event) => {
    form.submit();

  });
}


const bigArray = [];

const totalHT = () => {
  const unitPrice = document.querySelector("#invoice_missions_invoices_attributes_0_price_rate", '#invoice_missions_invoices_attributes_1567166956407_price_rate').value;
  const quantity = document.querySelector("#invoice_missions_invoices_attributes_0_man_day_quantity", '#invoice_missions_invoices_attributes_1567166956407_man_day_quantity').value;
  const vat = document.querySelector("#invoice_missions_invoices_attributes_0_vat_rate", '#invoice_missions_invoices_attributes_1567166956407_vat_rate').value;
  const amountHT = quantity * unitPrice;
  const amountTTC = (amountHT * vat) + amountHT;
  if (amountHT > 0) {
    document.querySelector(".total-HT").innerHTML = amountHT;
    document.querySelector(".total-TTC").innerHTML = amountTTC;
    const array = [];
    array.push(amountTTC);
    console.log(array);
    document.querySelector(".total-line-TTC").innerHTML = array[0];
  }
}




const totalAmount = () => {
  const linesFigures = document.querySelectorAll(".nested-fields input, .nested-fields select");
  console.log(linesFigures);
  linesFigures.forEach((linesFigure) => {
    linesFigure.addEventListener('change', (event) => {
      totalHT();

    });
  });
}

  totalAmount();

// const initline = () => {
//   const linesFigures = document.querySelectorAll('.nested-fields input, .nested-fields select')
//   linesFigures.forEach((linesFigure) => {
//     if (linesFigure.querySelector('').innerText != '') {
//       linesFigure.classList.add('line-active')
//     }
//   })
// }

// const button = document.querySelector('.bouton');

// button.addEventListener('click', (event) => {
//   totalAmount();
// });






