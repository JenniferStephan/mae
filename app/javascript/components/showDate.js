// if (document.querySelector('.payment-date')) {
//   let dateToday = new Date;

//   let month = dateToday.getMonth();

//   const sumToPay = parseFloat(document.querySelector('.sum-to-pay').innerHTML);

//   if (sumToPay) {
//     const firstTrimester = [1, 2, 3];
//     const secondTrimester = [4, 5, 6];
//     const thirdTrimester = [7, 8, 9];
//     const lastTrimester = [10, 11, 12];
//     const paymentDate = document.querySelector('.payment-date');

//     if (month === firstTrimester[0] || month === firstTrimester[1] || month === firstTrimester[2]) {
//       paymentDate.innerText = "avant le 1er mai";
//     }
//     else if (month === secondTrimester[0] || month === secondTrimester[1] || month === secondTrimester[2]) {
//       paymentDate.innerText = "avant le 1er août";
//     }
//     else if (month === thirdTrimester[0] || month === thirdTrimester[1] || month === thirdTrimester[2]) {
//       paymentDate.innerText = "avant le 1er octobre";
//     }
//     else
//       paymentDate.innerText = "avant le 1er février";
//     }
// }
