import "bootstrap";

import { chatSubscription } from '../channels/chat';
import { scroll } from '../components/scroll';

chatSubscription();

global.scroll = scroll;
