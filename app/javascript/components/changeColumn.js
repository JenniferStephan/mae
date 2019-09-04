const changeColumn = () => {
  const paidButtons = document.querySelectorAll('.mark-as-paid-button');
  const paidInvoices = document.querySelector('.invoices-paid');
  const paidInvoicesList = paidInvoices.querySelector('ul');

  const moveDiv = (event) => {
    const invoiceDiv = event.currentTarget.parentElement.previousElementSibling.querySelector('.homepage-invoice-infos');
    const hiddenLink = invoiceDiv.querySelector('.hidden-link');

    paidInvoicesList.insertAdjacentHTML('beforeend', `
      <li class="checklist-entry list-group-item flex-column align-items-start">
        <div class="checklist-item checklist-item-success">
          <div class="checklist-info">
          <i class="status-colored-circle paid fas fa-circle"></i>
            ${invoiceDiv.outerHTML}
          </div>
        </div>
      </li>
    `);
    invoiceDiv.parentElement.parentElement.parentElement.remove();
    hiddenLink.click();
  }

  paidButtons.forEach(button => button.addEventListener('click', moveDiv))
}

export { changeColumn };
