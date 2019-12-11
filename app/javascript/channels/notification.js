const notificationSubscription = () => {
  const currentuserId = document.querySelector(".notif-user").dataset.user;

  // App[`notification_user${currentuserId}_chatroom${chatroomId}_channel`]
  App[`notifications_user${currentuserId}_channel`] = App.cable.subscriptions.create(
    {
      channel: 'NotificationsChannel',
      user_id: currentuserId
      // chat_room_id: chatroomId
    },
    {
      received: (data) => {
        console.log(data);
        const chatroomIdFromCable = data.chat_room_id;
        const userMessageId = data.user_message_id;

        const notificationsContainer = document.querySelector(`.notification-${chatroomIdFromCable}`);

        if (document.querySelector(".notif-user") && document.querySelector(".notif-user").dataset.user) {
          const currentuserId = document.querySelector(".notif-user").dataset.user;
          if (notificationsContainer && (Number.parseInt(currentuserId, 10) !== userMessageId)) {
            notificationsContainer.innerHTML = data.notification_partial;
          }
        }
      }
    })
}

export { notificationSubscription };
