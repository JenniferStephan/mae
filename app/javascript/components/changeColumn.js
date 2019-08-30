const changeColumn = () => {
  const euroButtons = document.querySelectorAll('.mark-as-paid-button');
  const paidInvoices = document.querySelector('.invoices-paid');
  const paidInvoicesList = paidInvoices.querySelector('ul');

  const moveDiv = (event) => {
    const invoiceDiv = event.target.parentElement.previousElementSibling.querySelector('.invoice-infos');
    paidInvoicesList.insertAdjacentHTML('beforeend', `
      <li class="checklist-entry list-group-item flex-column align-items-start">
        <div class="checklist-item checklist-item-success">
          <div class="checklist-info">
            <div class="vertical-line paid"></div>
            ${invoiceDiv.outerHTML}
          </div>
        </div>
      </li>
    `);
    invoiceDiv.parentElement.parentElement.parentElement.remove();
  }

  euroButtons.forEach(button => button.addEventListener('click', moveDiv))
}

export default changeColumn;
