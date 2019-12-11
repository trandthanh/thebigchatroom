import { scroll } from '../components/scroll';

const chatSubscription = () => {
  const chatroomId = document.querySelector(".chat").dataset.room;
  const currentuserId = document.querySelector(".chat").dataset.user;

  scroll();

  App[`chat_room_${chatroomId}`] = App.cable.subscriptions.create(
    {
      channel: 'ChatRoomsChannel',
      chat_room_id: chatroomId
    },
    {
      received: (data) => {
        if (data.current_user_id !== Number.parseInt(currentuserId, 10)) {
          const messagesContainer = document.querySelector('.messages');
          messagesContainer.insertAdjacentHTML('beforeend', data.message_partial);
          scroll();
        } else {
          scroll();
        }
      }
    })

  // if (App[`chat_room_${chatroomId}`]) {
  //   console.log('hi');
  // };
}

export { chatSubscription };
