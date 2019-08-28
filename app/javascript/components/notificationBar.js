const initNotificationBar = () => {
  const notifButton = document.querySelector(".notif-button");
  const notifBar = document.querySelector(".notification-bar");

  notifButton.addEventListener('click', (event) => {
    notifBar.classList.toggle("open")
  })
}

export {initNotificationBar};
