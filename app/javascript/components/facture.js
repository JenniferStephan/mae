const bigForm = document.querySelector("#new_invoice");

const sumAll = () => {
  const lineResultsTTC = Array.from(bigForm.querySelectorAll('.total-line-TTC'));
  // const lineResultsHT = Array.from(bigForm.querySelectorAll('.total-line-TTC'));
  let sum = 0
  const totalAmountTTC = bigForm.querySelector('.total-TTC');
  const totalAmountHT = bigForm.querySelector('.total-HT');
  lineResultsTTC.forEach((lineResultTTC) => {
    if (lineResultTTC.innerText) {
      const resultNum = parseFloat(lineResultTTC.innerText);
      sum += resultNum;
      totalAmountTTC.innerText = sum;
    }
  });
}

const calculate = (event) => {
    const line = event.target.closest('.nested-fields');
    if (line) {
     const quantity = line.querySelector('.w-input').value;
     const unitPrice = line.querySelector('.x-input').value;
     const vatRate = line.querySelector('.y-input').value;
     const lineResult = line.querySelector('.total-line-TTC');
     if (quantity && unitPrice && vatRate) {
       const resultHT = quantity * unitPrice;
       const resultTTC = (resultHT * vatRate) + resultHT;
       lineResult.innerText = resultTTC;
       sumAll();
      }
    }
  }

const initFacture = () => {
  bigForm.addEventListener('keyup', calculate);
  bigForm.addEventListener('change', calculate);
}




export { initFacture };
