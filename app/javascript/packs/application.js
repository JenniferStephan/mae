import "bootstrap";

import {initNotificationBar} from "../components/notificationBar";
import changeColumn from '../components/changeColumn';

initNotificationBar();

if (document.querySelector(".checklist-entry")) {
  changeColumn();
}
