Trip.destroy_all
Category.destroy_all
User.destroy_all
Order.destroy_all

adventure = Category.create(title: "adventure")
relax = Category.create(title: "relax")

jungle = adventure.trips.create(title: "Jungle Safari", description: "“Grrr, you’re a tiger baby.” At least that’s what Austin Powers said. But if you really want to be a tiger, you might have to see one in real life first. Now you can do just that on a jungle expedition with one of our knowledgeable, intrepid guides. Spend three days and nights hacking your way through dense vines, sleeping in hammocks, and slathering yourself in mud. What are you waiting for? It’s time to discover your inner beast.", image_url: "/assets/the-jungle-web.jpg", price: 500, address: "Anamã, Brazil")
arctic = relax.trips.create(title: "Arctic Ice Fishing", description: "Nothing is quite as relaxing as cutting a hole in the ice and sitting around it waiting. And waiting. And waiting. Oh, was that a nibble?!? Nope. Waiting. Come pass through all the wonders of the Arctic Circle to get to a spot where you can make your own circle (in the ice). Hot chocolate and dried seal jerky are provided.", image_url: "/assets/antarctica-web.jpg", price: 1000, address: "Alert, Ellesmere Island")
sand = adventure.trips.create(title: "Sand Dune Surfing", description: "Hang 10 on the shifting sands and spend the night watching a beautiful desert sunset. For one week, learn the ins and outs of shredding the small particles of rock that have been slowly eroded away over millions of years by the awesome raw power of nature. All of our guides are former competitors from the Sand Dune Surfing Pro Circuit.", image_url: "/assets/desert-web.jpg", price: 500, address: "Erongo, Namibia")
hobbit = adventure.trips.create(title: "Hobbit Journey", description: "Middle-Earth is depending on you. You have to climb over some mountains so you can throw a replica golden ring of power into a basin of lava. On this journey, paid actors in orc makeup and period-appropriate attire will regularly ambush your group. Don’t worry, your guide (dressed as the white wizard) will be there to help keep you safe. (Please note: Giant Eagle rides are unavailable until further notice.)", image_url: "/assets/hobbit-web.jpg", price: 500, address: "Matamata")
dolphins = relax.trips.create(title: "Swim with Dolphins", description: "Spend a week with dolphins in warm, aquamarine water. Activities on this trip include afternoon swims with these lovable aquatic mammals and dolphin chariot races just like you’re a real life King Triton. Learn all about these wonderful creatures from our guides, all of who spent at least three years studying dolphin language and behavior. Did you cry when the first-run of Flipper ended in 1967? If that’s you, then this is the trip of your dreams!", image_url: "/assets/dolphins-web.jpg", price: 500, address: "Cancún")
adventure.trips.create(title: "Air Boating", description: "YEEE-HAAAAWWWWW. That’s the noise you’ll make on one of our swamp airboat rides. Learn about the mysteries of the swamps from our gator-wrastlin’, snake-eatin’ guides. A handle of Kentucky Gentleman is provided to each guest on this day-long adventure.", image_url: "/assets/swamp-web.jpg", price: 500, retired: 1, address: "New Orleans")
adventure.trips.create(title: "Volcano Sledding", description: "Imagine yourself flying down a hill at tens-of-miles-per-hour with the wind in your face and pumice scattering behind you. Now, to get to that point you just have to carry a sled up the side of a volcano. That’s right, A VOLCANO (and an active one at that). Our guides will help you learn all about the forces that shaped this world as part of the trip. Come out and do one of winter’s greatest activities, just without any of the winter.", image_url: "/assets/volcano-web.jpg", price: 500, retired: 1, address: "Eyjafjallajökull")
relax.trips.create(title: "Whale Watching", description: "Coooooooooommmmeeeeeeee watttttttttcccccccchhhhhhh soooooooooooommmmmmeeeeeee whaaaaaaaaaaallllesssssssss. All of our guides speak whale. All trips start from 42 Wallaby Way, Sydney, Australia.", image_url: "/assets/whale-web.jpg", price: 500, address: "Anchorage")
adventure.trips.create(title: "Parachute Gliding", description: "It’s sort of like parachuting. It’s sort of like being on a glider. But it’s so much better than both of those things alone! After a mere 19 minutes of instruction, our expert paragliding instructors will have you soaring high. Nerf guns are provided to recreate the famous paragliding battles of yesteryear.", image_url: "/assets/paraglide-web.jpg", price: 500, address: "Ancona, Italy")
adventure.trips.create(title: "Rock Climbing", description: "Want to have the grip strength of Hercules? Come hang off some rocks for a while to make that happen. Our world-class climber-guides will lead you into rugged terrain, where the only thing separating you from the void will be your own resolve. (Also ropes and harnesses. Our insurance company says we have to use them.)", image_url: "/assets/climb-web.jpg", price: 500, address: "Yosemite Valley, California")

admin = User.create(name: "admin", email: "admin@admin.com", password: "password", password_confirmation: "password", role: 1)
joey = User.create(name: "joey", email: "joey@joey.com", password: "password", password_confirmation: "password")
ben = User.create(name: "ben", email: "ben@ben.com", password: "password", password_confirmation: "password")
ryan = User.create(name: "ryan", email: "ryan@ryan.com", password: "password", password_confirmation: "password")
anthony = User.create(name: "anthony", email: "anthony@anthony.com", password: "password", password_confirmation: "password")

joey_order = joey.orders.create(cost: jungle.price*2)
ben_order = ben.orders.create(cost: arctic.price*4)
ryan_order = ryan.orders.create(cost: sand.price*1)
anthony_order = anthony.orders.create(cost: hobbit.price*3 + dolphins.price*3)

OrdersTrip.create(order_id: joey_order.id, trip_id: jungle.id, quantity: 2, trip_price: jungle.price)
OrdersTrip.create(order_id: ben_order.id, trip_id: arctic.id, quantity: 4, trip_price: arctic.price)
OrdersTrip.create(order_id: ryan_order.id, trip_id: sand.id, quantity: 1, trip_price: sand.price)
OrdersTrip.create(order_id: anthony_order.id, trip_id: hobbit.id, quantity: 3, trip_price: hobbit.price)
OrdersTrip.create(order_id: anthony_order.id, trip_id: dolphins.id, quantity: 2, trip_price: dolphins.price)
