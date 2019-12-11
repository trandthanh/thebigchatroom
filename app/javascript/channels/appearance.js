const appearanceSubscription = (event) => {

  App['appearance_channel'] = App.cable.subscriptions.create(
  {
    channel: 'AppearanceChannel'
    // online: true
  },
  {
    connected: function() {
        console.log("connected");
      },
    received: (data) => {
      // console.log(data);

      if (document.querySelector('.chat')) {
        const userContainer = document.querySelector('.availability-appearance');
        const userIdFromData = data.user_id;
        const userIdFromDOM = document.querySelector('.availability-appearance').dataset.userConnected;
        const appearanceContainer = document.querySelector(`.user-availability-${userIdFromData}`);
        if (appearanceContainer) {
          appearanceContainer.innerHTML = data.appearance_partial;
        }
      }

    }
  })
}

export { appearanceSubscription };
