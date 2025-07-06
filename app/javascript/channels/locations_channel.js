import consumer from "channels/consumer"

consumer.subscriptions.create("LocationsChannel", {
  received(data) {
    document.querySelector('.locationRating').innerHTML = `Nota: ${data}`
  }
})