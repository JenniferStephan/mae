import "bootstrap";

import {initNotificationBar} from "../components/notificationBar";
import changeColumn from '../components/changeColumn';

initNotificationBar();
changeColumn();

// Enable Bootstrap tooltips
$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})
