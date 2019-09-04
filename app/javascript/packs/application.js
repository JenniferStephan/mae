import "bootstrap";
import "../plugins/flatpickr"
import { loadDynamicBannerText } from '../components/banner';
import { initNotificationBar } from "../components/notificationBar";
import { changeColumn } from '../components/changeColumn';
import { initFacture } from '../components/facture';
// import {formValidation} from "../components/formValidation";
// import {initFullCalendar} from '../plugins/fullcalendar';
import { turnoverChart } from '../components/analyticsCharts';
import { gaugeChart } from '../components/gaugeChart';
import { donutChartbis } from '../components/donutChartbis';



if (document.querySelector('#new_invoice')) {
  initFacture();
}


// loadDynamicBannerText();

if (document.querySelector(".notification-bar")) {
     initNotificationBar();

}



const formValidation = () => {
  const steps = [...document.querySelectorAll('a.step')];
  const tabButtonsDivs = document.querySelectorAll('.tab-buttons');
  let buttons = [];
  tabButtonsDivs.forEach(div => buttons.push([...div.querySelectorAll('button')]));
  buttons = buttons.flat();
  buttons.forEach(button => button.addEventListener('click', (event) => {
    event.preventDefault();
    const activeStep = document.querySelector('a.active');
    const index = steps.findIndex(step => step === activeStep);
    const nextStep = steps[index + 1];
    const previousStep = steps[index - 1];
    const parentDiv = event.target.parentElement.parentElement;
    const formInputs = parentDiv.querySelectorAll('input');
    // console.log(formInputs);
    if (event.target.classList.contains('next-btn')) {
    // if (event.target.classList.contains('next-btn') && checkForm(formInputs)) {
      nextStep.click();
    // } else if (checkForm(formInputs)) {
    //   previousStep.click();
    } else {
      // displayErrors();
      previousStep.click();
    }
  }));
}
const checkForm = (formInputs) => {
  console.log(formInputs);
  [...formInputs].every(input => input.value);
}
const displayErrors = () => {
  console.log("Form isn't completed");
}


// // loadDynamicBannerText();

formValidation();

<<<<<<< HEAD
$(document).ready(function(){
  $(".checkbox-choice").click(function(){
    $(this).toggleClass("active");
  });
});

=======
>>>>>>> 5f03314db1bc4ad03f9d9635b2377bede84478fa

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
