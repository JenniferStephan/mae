if (document.querySelector('#current-user-rate')) {
  const rate = document.querySelector("#current-user-rate");
  const currentUserRate = JSON.parse(rate.dataset.rate);

  const callForSimulation = document.querySelector('.call-simul');
  const paymentCalculation = document.querySelector('.reglement-cotisations');


  if (currentUserRate === 0) {
    callForSimulation.insertAdjacentHTML('beforeend', '<a class="button-simul-big" href="/simulations/new">Simuler <br/> mon taux personnalisé</a>');
  }
  else {
    let dateToday = new Date;

    let month = dateToday.getMonth();
    const cotisation = document.querySelector('.sum-to-pay');
    const sumToPay = JSON.parse(cotisation.dataset.quarter);



    if (sumToPay) {
      const firstTrimester = [1, 2, 3];
      const secondTrimester = [4, 5, 6];
      const thirdTrimester = [7, 8, 9];
      const lastTrimester = [10, 11, 12];
      const paymentDate = document.querySelector('.payment-date');

      if (month === firstTrimester[0] || month === firstTrimester[1] || month === firstTrimester[2]) {
        paymentDate.innerText = "avant le 1er mai";
      }
      else if (month === secondTrimester[0] || month === secondTrimester[1] || month === secondTrimester[2]) {
        paymentDate.innerText = "avant le 1er août";
      }
      else if (month === thirdTrimester[0] || month === thirdTrimester[1] || month === thirdTrimester[2]) {
        paymentDate.innerText = "avant le 1er octobre";
      }
      else
        paymentDate.innerText = "avant le 1er février";
      }
      paymentCalculation.insertAdjacentHTML('beforeend', `<span class="mt-1">Vous devez régler </span><div class="sum-to-pay ml-2">${sumToPay} €</div>`);
      rate.insertAdjacentHTML('beforeend', `<div> Votre taux : ${currentUserRate} </div> <div> <a href="/simulations/new"> <i class="far fa-edit"></i> </a></div>`);
    }
  }

