import { Controller } from "@hotwired/stimulus";
import { createConsumer } from "@rails/actioncable";
// Connects to data-controller="chatroom-subscription"
export default class extends Controller {
  static targets = ["messages"];
  static values = {
    chatroomId: Number,
  };

  connect() {
    console.log(`chatroom id: ${this.chatroomIdValue}`);
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      {
        received: (data) => {
          // console.log(data);
          // insert it into the messages div
          this.messagesTarget.insertAdjacentHTML("beforeend", data);
          this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight);
        },
      }
    );
    // console.log(`Subscribe to the chatroom with the id ${this.chatroomIdValue}.`)
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom");
    this.channel.unsubscribe();
  }

  resetForm(event) {
    event.target.reset();
  }
}
