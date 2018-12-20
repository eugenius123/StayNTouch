require 'bunny'

class Rabbitmq
  # This exercise is to build a method that implement Publish/Subscribe model using RabbitMQ (Messaging Service) and Bunny gem (RabbitMQ Client).
  #
  # The test case will provide a guest name to your method. The method should subscribe to a queue, publish the provided guest to the queue, and then
  # return a string with guest's name. (e.g.: "Received Name's Reservation")
  #
  # The test is pretty basic, but we are looking to see a working Pub/Sub implementation using RabbitMQ.
  #
  # Source (https://www.rabbitmq.com/getstarted.html, http://rubybunny.info/articles/getting_started.html)
  #
  
  # simple pub/sub implementation within rabbitmq that showcases a simple method that subscribes to a queue,
  # publish the guest to the queue and returns the answer
  def self.reservation_pub_sub(guest)
    conn = Bunny.new
    conn.start

    ch = conn.create_channel
    q  = ch.queue("guest_queue", :auto_delete => true)
    x  = ch.default_exchange

    x.publish(guest, :routing_key => "guest_queue")
    answer = ""
    q.subscribe do |delivery_info, metadata, payload|
      answer = "Received #{payload}'s Reservation"
    end
    
    sleep 1.0
    conn.close
    return answer

  end
end
