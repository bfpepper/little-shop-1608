Trip.destroy_all
Category.destroy_all

hot = Category.create(title: "hot")
cold = Category.create(title: "cold")

hot.trips.create(title: "Jungle", description: "Eat bugs!", image_url: "http://www.theimaginativeconservative.org/wp-content/uploads/2016/06/the-jungle.jpg", price: 500)
cold.trips.create(title: "Antarctica", description: "Freeze your nuts off!", image_url: "http://getworldmedia.com/wp-content/uploads/2016/01/antarctica-factsAntarctica2.jpg", price: 1000)
