const openPopupBtn = document.querySelector('[data-modal-target]');
const closePopupBtn = document.querySelector('[data-close-button]');
const overlay = document.getElementById('overlay');


console.log(closePopupBtn);

openPopupBtn.addEventListener('click', () => {
    const modalData = document.querySelector(openPopupBtn.dataset.modalTarget);
    openModal(modalData);
});
overlay.addEventListener('click', () => {
    const modals = document.querySelector('.popup-btn-rq-statistic.active');
    closeModal(modals);
});
closePopupBtn.addEventListener('click', () => {
    const modals = document.querySelector('.popup-btn-rq-statistic.active');
    closeModal(modals);
});


function openModal(modal) {
    if (modal === null)
        return;
    modal.classList.add('active');
    overlay.classList.add('active');
}

function closeModal(modal) {
    if (modal === null)
        return;
    modal.classList.remove('active');
    overlay.classList.remove('active');
}
