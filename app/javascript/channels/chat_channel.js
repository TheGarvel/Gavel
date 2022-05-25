import consumer from "./consumer";



consumer.subscriptions.create("ChatChannel", {
  connected() {
    console.log("hello");
  },

  disconnected() {},

  received(data) {
    const datacontent = `<li>${data.username} : ${data.content}</li>`;
    console.log(data);
    document
      .querySelector("#message")
      .insertAdjacentHTML("beforeend", datacontent);
  },
});
