import "bootstrap";

import { appearanceSubscription } from '../channels/appearance';
import { chatSubscription } from '../channels/chat';
import { notificationSubscription } from '../channels/notification';

import { scroll } from '../components/scroll';

appearanceSubscription();

notificationSubscription();

if (document.querySelector(".chat")) {
  chatSubscription();
}


global.scroll = scroll;
