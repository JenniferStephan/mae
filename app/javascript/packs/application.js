import "bootstrap";

import {initNotificationBar} from "../components/notificationBar";
import changeColumn from '../components/changeColumn';
import turnoverChart from '../components/analyticsCharts';

initNotificationBar();

if (document.querySelector(".checklist-entry")) {
  changeColumn();
}
