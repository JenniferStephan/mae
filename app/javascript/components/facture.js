const bigForm = document.querySelector("#new_invoice");

const sumAll = (vatRateInt) => {
  const lineResultsTTC = Array.from(bigForm.querySelectorAll('.total-line-TTC'));
  const lineResultsHT = Array.from(bigForm.querySelectorAll('.total-line-HT'));
  let sumTTC = 0
  let sumHT = 0
  const totalAmountTTC = bigForm.querySelector('.total-TTC');
  const totalAmountHT = bigForm.querySelector('.total-HT');

  lineResultsTTC.forEach((lineResultTTC) => {
    if (lineResultTTC.innerText) {
      const resultNumTTC = parseFloat(lineResultTTC.innerText);
      sumTTC += resultNumTTC;
      totalAmountTTC.innerText = sumTTC;
    }
  });

  lineResultsHT.forEach((lineResultHT) => {
    if (lineResultHT.innerText) {
      const resultNumHT = parseFloat(lineResultHT.innerText);
      sumHT += resultNumHT;
      totalAmountHT.innerText = sumHT;
    }
  });
}



const calculate = (event) => {
    const line = event.target.closest('.nested-fields');
    if (line) {
     const quantity = parseInt(line.querySelector('.w-input').value, 10);
     const unitPrice = parseInt(line.querySelector('.x-input').value, 10);
     const vatRate = line.querySelector('.y-input').value;
     const vatRateInt = parseFloat(vatRate);
     const lineResultTTC = line.querySelector('.total-line-TTC');
     const lineResultHT = line.querySelector('.total-line-HT');
     if (quantity && unitPrice && vatRate) {
       const resultHT = quantity * unitPrice;
       const resultTTC = (resultHT * vatRate) + resultHT;
       lineResultTTC.innerText = resultTTC;
       lineResultHT.innerText = resultHT;

       sumAll(vatRateInt);
      }
    }
  }

const initFacture = () => {
  bigForm.addEventListener('keyup', calculate);
  bigForm.addEventListener('change', calculate);
}



export { initFacture };

