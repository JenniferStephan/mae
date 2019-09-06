if (document.querySelector('#current-user-rate')) {
  const rate = document.querySelector("#current-user-rate");
  const currentUserRate = JSON.parse(rate.dataset.rate);
  const callForSimulation = document.querySelector('.payment-date');

  if (currentUserRate === 0) {
    callForSimulation.insertAdjacentHTML('beforeend', '<a href="/simulations/new">Simulez votre taux</a>');
  }
}
