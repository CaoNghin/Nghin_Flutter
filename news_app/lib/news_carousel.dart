class Carousel {
  String imageAssetUrl;
  String carouselName;

}

List<Carousel> getCarousel(){

  List<Carousel> myCarousel = List<Carousel>();
  Carousel carousel;

  carousel = new Carousel();
  carousel.carouselName = "COVID-19";
  carousel.imageAssetUrl = "https://images.unsplash.com/photo-1583324113626-70df0f4deaab?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGNvdmlkJTIwMTl8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1504&q=80";
  myCarousel.add(carousel);


  carousel = new Carousel();
  carousel.carouselName = "Movie";
  carousel.imageAssetUrl = "https://images.unsplash.com/photo-1440404653325-ab127d49abc1?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8bW92aWV8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
  myCarousel.add(carousel);


  carousel = new Carousel();
  carousel.carouselName = "Fashion";
  carousel.imageAssetUrl = "https://images.unsplash.com/photo-1567401893414-76b7b1e5a7a5?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDE1fFM0TUtMQXNCQjc0fHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60";
  myCarousel.add(carousel);


  carousel = new Carousel();
  carousel.carouselName = "Travel";
  carousel.imageAssetUrl = "https://images.unsplash.com/photo-1636815529433-d1cd851d5d50?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDIyfEZ6bzN6dU9ITjZ3fHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1595&q=80";
  myCarousel.add(carousel);


  carousel = new Carousel();
  carousel.carouselName = "Architecture";
  carousel.imageAssetUrl = "https://images.unsplash.com/photo-1635898831744-7d27ed364119?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDczfHJuU0tESHd3WVVrfHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
  myCarousel.add(carousel);


  carousel = new Carousel();
  carousel.carouselName = "History";
  carousel.imageAssetUrl = "https://images.unsplash.com/photo-1636695133317-90c6870c5b23?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDZ8ZGlqcGJ3OTlrUVF8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
  myCarousel.add(carousel);

  carousel = new Carousel();
  carousel.carouselName = "Nature";
  carousel.imageAssetUrl = "https://images.unsplash.com/photo-1636812847964-3c7e65f6ecba?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDMyfDZzTVZqVExTa2VRfHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
  myCarousel.add(carousel);

  carousel = new Carousel();
  carousel.carouselName = "Technology";
  carousel.imageAssetUrl = "https://images.unsplash.com/photo-1468495244123-6c6c332eeece?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
  myCarousel.add(carousel);


  return myCarousel;

}