// 2. Make the User subscribe to the channel when the user is in the chatroom page

import consumer from "./consumer";
// we need to know if we are on the page with the chatroom

const initChatroomCable = () => {
  // look for something unique in the page
  const messagesContainer = document.getElementById('messages');
  // if we are on the chatroom page
  if (messagesContainer) {
    // // we will connect to the chatroom
    // const chatroomId = messagesContainer.dataset.chatroomId;
    // const chatroom = { channel: "ChatroomChannel", id: chatroomId }
    // const what_to_do = {
    //   received(data) {
    //     console.log(data); // called when data is broadcast in the cable
    //   }
    // }
    // // connecting to the chatroom
    // consumer.subscriptions.create(chatroom, what_to_do);
    const id = messagesContainer.dataset.chatroomId;

    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        console.log(data); // called when data is broadcast in the cable
      },
    });

  }
}

export { initChatroomCable };
