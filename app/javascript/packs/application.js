import "bootstrap";

import { appearanceSubscription } from '../channels/appearance';
import { chatSubscription } from '../channels/chat';
import { scroll } from '../components/scroll';

appearanceSubscription();

if (document.querySelector(".chat")) {
  chatSubscription();
}

global.scroll = scroll;
