import { Controller } from "@hotwired/stimulus";
import { createConsumer } from "@rails/actioncable";
// Connects to data-controller="chatroom-subscription"
export default class extends Controller {
  static targets = ["messages"];
  static values = {
    chatroomId: Number,
  };

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      {
        received: (data) => {
          // insert it into the messages div
          this.messagesTarget.insertAdjacentHTML("beforeend", data);
          this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight);
        },
      }
    );
  }
  // to Unsubscribed from the chatroom
  disconnect() {
    this.channel.unsubscribe();
  }

  resetForm(event) {
    event.target.reset();
  }
}
