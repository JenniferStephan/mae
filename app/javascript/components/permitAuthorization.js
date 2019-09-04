const permit = () => {
  window.addEventListener('load', function () {
    Notification.requestPermission(function (status) {
      if (Notification.permission !== status) {
        Notification.permission = status;
      }
    });
  });
}

export { permit };
