//main page of the Application where parallaxproperties are added

import 'package:flutter/material.dart';
import 'package:se/Widgets/contents.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late VideoPlayerController cntrl1;

  @override
  void initState() {
    super.initState();
    cntrl1 = VideoPlayerController.asset('lib/assets/background.mp4')
      ..initialize().then((_) {
        setState(() {});
        cntrl1.play();
        cntrl1.setLooping(true);
        cntrl1.setVolume(0.0);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        final screenWidth = constraints.maxWidth;
        final screenHeight = constraints.maxHeight;
        return Container(
          height: screenHeight,
          width: screenWidth,
          child: Stack(
            children: [
              Center(
                child: cntrl1.value.isInitialized
                    ? Container(
                        width: screenWidth,
                        height: screenHeight,
                        child: VideoPlayer(cntrl1))
                    : Container(),
              ),
              ElevatorApp()
            ],
          ),
        );
      }),
    );
  }
}

class ElevatorApp extends StatefulWidget {
  @override
  _ElevatorAppState createState() => _ElevatorAppState();
}

class _ElevatorAppState extends State<ElevatorApp> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // Add a post-frame callback to scroll to the bottom immediately after the build is complete.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<List<String>> planetlis = [
      [
        "lib/assets/neptune.png",
        "Neptune's Mystique\n\n Dive into the deep blue atmosphere of Neptune,"
            " where fierce winds and mysterious dark spots create an enigmatic world that beckons exploration\n\n",
        "Neptune"
      ],
      [
        "lib/assets/uranus.png",
        "Uranus Uncharted\n\n Venture to the icy realms"
            " of Uranus, where the planet rotates on its side, presenting unique challenges and"
            " a serene, pale-blue beauty that hides many secrets\n\n",
        "uranus"
      ],
      [
        "lib/assets/saturn.png",
        "Saturn's Elegance\n\nVisit the ringed wonder"
            ", Saturn, and be awed by its stunningly intricate ring system, breathtaking icy moons,"
            " and the mesmerizing dance of particles that make this planet a celestial jewel\n\n",
        "Saturn"
      ],
      [
        "lib/assets/jupiter.png",
        "Jupiter's Majesty\n\n Experience the largest planet in"
            " our solar system, Jupiter, with its swirling storms and"
            " mesmerizing bands of clouds, "
            "offering a glimpse into the majestic power of gas giants\n\n",
        "Jupiter"
      ],
      [
        "lib/assets/mars.png",
        "Mars The Red Frontier\n\n Join us on an expedition to Mars,"
            " where you'll witness the rust-colored landscapes,"
            " the grandeur of Olympus Mons, and the tantalizing possibility of"
            " past or present life lurking beneath its surface\n\n",
        "Mars",
      ],
      [
        "lib/assets/moon.png",
        "Moon's Magic\n\n Our lunar odyssey reveals a world of"
            " rugged beauty, with craters, mountains, and the intriguing contrast between its bright and dark"
            " sides. Explore the Moon's phases, tidal influence, and the legacy of human exploration.\n\n",
        "moon"
      ],
      [
        "lib/assets/earth.png",
        "Discover Earth's Beauty\n\n Our space tour showcases stunning"
            " natural wonders, vibrant cityscapes, and diverse life forms, "
            "fostering a deep appreciation for our precious planet.",
        "EARTH",
      ],
      [
        "lib/assets/venus.png",
        "Venus Unveiled\n\n Explore the scorching surface of Venus,"
            " where crushing atmospheric pressure and acidic clouds shroud a landscape"
            " of towering volcanoes and rugged highlands, making it an otherworldly wonder\n\n",
        "Venus",
      ],
      [
        "lib/assets/mercury.png",
        "Mercury's Marvels\n\n Our journey to Mercury unveils a"
            " world of extreme temperature variations, vast"
            " impact craters, and a desolate beauty that captivates the imagination\n\n.",
        "Mercury",
      ],
      [
        "lib/assets/sun.png",
        "Solar Splendor\n\n Journey to the heart of our solar system, the Sun,"
            " a blazing ball of nuclear fusion that sustains life on Earth. Discover"
            " its immense size, scorching temperatures, and its cultural significance throughout history\n\n",
        "Sun"
      ]
    ];

    List<List<String>> planetDesc = [
      [
        "lib/assets/neptune.png",
        "Neptune Odyssey: Your Ultimate Ice World Adventure\n\nWelcome to the realm of the ice worlds! Get ready for an extraordinary journey to the distant and enigmatic planet Neptune. This brochure is your comprehensive guide to the adventure of a lifetime.\n\nDestination: Neptune\n\nOverview:\nNeptune, the ice giant of our solar system, is a world of captivating mysteries and celestial beauty. Now, you have the chance to explore its unique features up close. This tour offers a once-in-a-lifetime opportunity to venture into the depths of the outer solar system.\n\nTour Highlights:\n\nNeptunian Arrival: Begin your adventure with a mesmerizing approach to Neptune aboard our cutting-edge spacecraft. Witness the stunning azure hue of Neptune's atmosphere and its turbulent cloud bands.\n\nIce World Expedition: Explore the icy depths of Neptune's atmosphere, where a floating research station awaits. Experience the serene, frigid environment and conduct atmospheric experiments.\n\nTriton Encounter: Visit Triton, Neptune's largest moon, with its geysers of nitrogen gas and unique terrain. Witness the strange cryovolcanoes and learn about the moon's intriguing history.\n\nMagnetic Mystery: Investigate Neptune's powerful magnetic field, which is tilted relative to its rotational axis. Study the mysteries of its magnetosphere and its impact on the planet's environment.\n\nNeptunian Moonwalk: Land on Nereid, one of Neptune's lesser-known moons, and explore its icy surface. Discover the moon's craters, canyons, and fascinating geological features.\n\nNeptunian Delicacies: Savor gourmet meals inspired by the elements of Neptune, featuring dishes like 'Triton's Treat' and 'Nereid's Delight,' enjoyed in a specially designed dining area with panoramic views of Neptune.\n\nNeptunian Souvenirs: Explore our onboard gift shop for exclusive Neptune-themed merchandise, including celestial jewelry, space gear, and educational items to remember your adventure.\n\nTravel Information:\n\nDuration: 75-day tour\nDeparture: Earth's spaceport\nPricing: Contact our reservation team for current pricing and availability.\nBooking: Secure your place on this unique journey by contacting our reservations team at [Contact Information]. Limited spots are available, so book early to reserve your place.\n\nSafety First:\nYour safety is our highest priority. Our spacecraft and research stations are equipped with advanced safety measures to protect you from the unique conditions of Neptune. Our experienced guides and scientists ensure a secure and educational experience.\n\nPrepare for the Journey of a Lifetime:\nPack your sense of wonder, space enthusiasm, and an adventurous spirit. Our team will provide pre-travel information to prepare you for this unprecedented Neptunian expedition.\n\nJoin Us on a Journey to Neptune:\nDon't miss the opportunity to explore Neptune, the ice giant. Reserve your spot today and embark on a Neptunian adventure that will leave you with memories to cherish forever. Witness the tranquility, mystery, and beauty of Neptune with us.\n\nDisclaimer: Neptunian travel involves inherent risks. Participants must meet physical and health requirements. All activities are subject to spacecraft availability and favorable celestial conditions. Our team reserves the right to make necessary adjustments to ensure the safety and enjoyment of all Neptunian explorers."

      ],
      [
        "lib/assets/uranus.png",
        "Uranus Odyssey: Your Ultimate Ice Giant Adventure\n\nWelcome to the realm of the ice giants! Get ready for an extraordinary journey to the distant and mysterious planet Uranus. This brochure is your comprehensive guide to the adventure of a lifetime.\n\nDestination: Uranus\n\nOverview:\nUranus, the enigmatic ice giant, is a world of serene beauty and celestial intrigue. Now, you have the chance to explore its unique features up close. This tour offers a once-in-a-lifetime opportunity to venture into the depths of the outer solar system.\n\nTour Highlights:\n\nUranian Arrival: Begin your adventure with a mesmerizing approach to Uranus aboard our cutting-edge spacecraft. Witness the striking blue-green hue of Uranus' atmosphere and the faint rings that encircle this distant giant.\n\nCloud City Expedition: Descend into the upper atmosphere of Uranus, where a floating research station awaits. Experience the tranquility of this ethereal environment and conduct atmospheric experiments.\n\nMoons of Uranus: Explore the fascinating moons of Uranus, including Miranda with its unique geological features, Titania with its rugged terrain, and Umbriel with its mysterious dark plains.\n\nMagnetic Mystery: Investigate Uranus' unusual magnetic field, which is tilted at a 60-degree angle relative to its rotational axis. Study the mysteries of its magnetic environment and its implications for planetary science.\n\nIcy Wonderlands: Land on the frozen surface of Ariel, one of Uranus' intriguing moons. Discover the icy landscapes, canyons, and mysterious grooved terrains of this frigid world.\n\nUranian Delicacies: Savor gourmet meals inspired by the elements of Uranus, featuring dishes like 'Ariel's Frosty Feast' and 'Titania's Temptation,' enjoyed in a specially designed dining area with panoramic views of Uranus.\n\nUranian Souvenirs: Explore our onboard gift shop for exclusive Uranus-themed merchandise, including celestial jewelry, space gear, and educational items to remember your adventure.\n\nTravel Information:\n\nDuration: 60-day tour\nDeparture: Earth's spaceport\nPricing: Contact our reservation team for current pricing and availability.\nBooking: Secure your place on this unique journey by contacting our reservations team at [Contact Information]. Limited spots are available, so book early to reserve your place.\n\nSafety First:\nYour safety is our highest priority. Our spacecraft and research stations are equipped with advanced safety measures to protect you from the unique conditions of Uranus. Our experienced guides and scientists ensure a secure and educational experience.\n\nPrepare for the Journey of a Lifetime:\nPack your sense of wonder, space enthusiasm, and an adventurous spirit. Our team will provide pre-travel information to prepare you for this unprecedented Uranian expedition.\n\nJoin Us on a Journey to Uranus:\nDon't miss the opportunity to explore Uranus, the ice giant. Reserve your spot today and embark on a Uranian adventure that will leave you with memories to cherish forever. Witness the tranquility, mystery, and beauty of Uranus with us.\n\nDisclaimer: Uranian travel involves inherent risks. Participants must meet physical and health requirements. All activities are subject to spacecraft availability and favorable celestial conditions. Our team reserves the right to make necessary adjustments to ensure the safety and enjoyment of all Uranian explorers."
,
      ],
      [
        "lib/assets/saturn.png",
        "Saturn Odyssey: Your Ultimate Saturnian Adventure\n\nWelcome to the ringed wonder! Get ready for an extraordinary journey to the majestic planet Saturn. This brochure is your comprehensive guide to the adventure of a lifetime.\n\nDestination: Saturn\n\nOverview:\nSaturn, the jewel of our solar system, is a world of mesmerizing beauty and celestial grandeur. Now, you have the chance to explore its stunning features up close. This tour offers a unique opportunity to experience the magic of Saturn.\n\nTour Highlights:\n\nSaturnian Arrival: Begin your adventure with a breathtaking approach to Saturn aboard our state-of-the-art spacecraft. Witness the sheer beauty of Saturn's iconic rings and its mysterious moons.\n\nRinged Wonderland: Explore the enchanting world of Saturn's rings. Glide through the ring system, witnessing the sparkling ice particles and dazzling beauty that have captivated astronomers for centuries.\n\nTitan Expedition: Land on Titan, Saturn's largest moon, and experience its unique landscape. Discover lakes of liquid methane, vast sand dunes, and frigid methane rain showers on this alien moon.\n\nCassini Crater Exploration: Explore the Cassini Crater on Saturn's moon, Enceladus. Witness the icy geysers erupting from its surface and investigate the potential for subsurface oceans.\n\nSaturnian Science: Contribute to cutting-edge research by studying Saturn's magnetic field, the composition of its rings, and the mysteries of its many moons. Your journey may unlock the secrets of the Saturnian system.\n\nSaturnian Cuisine: Savor gourmet meals inspired by the elements of Saturn, featuring dishes like 'Ringed Delight' and 'Titanic Tastings,' enjoyed in a specially designed dining area with panoramic views of Saturn.\n\nSaturnian Souvenirs: Explore our onboard gift shop for exclusive Saturn-themed merchandise, including celestial jewelry, space gear, and educational items to remember your adventure.\n\nTravel Information:\n\nDuration: 45-day tour\nDeparture: Earth's spaceport\nPricing: Contact our reservation team for current pricing and availability.\nBooking: Secure your place on this unique journey by contacting our reservations team at [Contact Information]. Limited spots are available, so book early to reserve your place.\n\nSafety First:\nYour safety is our highest priority. Our spacecraft are equipped with advanced safety measures to protect you from the unique conditions of Saturn. Our experienced guides and scientists ensure a secure and educational experience.\n\nPrepare for the Journey of a Lifetime:\nPack your sense of wonder, space enthusiasm, and an adventurous spirit. Our team will provide pre-travel information to prepare you for this once-in-a-lifetime Saturnian expedition.\n\nJoin Us on a Journey to Saturn:\nDon't miss the opportunity to explore Saturn, the ringed wonder. Reserve your spot today and embark on a Saturnian adventure that will leave you with memories to cherish forever. Witness the splendor, mystery, and elegance of Saturn with us.\n\nDisclaimer: Saturnian travel involves inherent risks. Participants must meet physical and health requirements. All activities are subject to spacecraft availability and favorable celestial conditions. Our team reserves the right to make necessary adjustments to ensure the safety and enjoyment of all Saturnian explorers.",
      ],
      [
        "lib/assets/jupiter.png",
        "Jupiter Odyssey: Your Ultimate Jovian Adventure\n\nWelcome to the realm of giants! Get ready for an extraordinary journey to the largest planet in our solar system, Jupiter. This brochure is your comprehensive guide to the adventure of a lifetime.\n\nDestination: Jupiter\n\nOverview:\nJupiter, the majestic gas giant, is a world of stunning beauty and extreme contrasts. Now, you have the chance to explore its mesmerizing features up close. This tour offers a unique opportunity to delve into the mysteries of this colossal planet.\n\nTour Highlights:\n\nJovian Arrival: Begin your adventure with an exhilarating approach to Jupiter aboard our cutting-edge spacecraft. Witness the awe-inspiring sight of Jupiter's massive cloud bands and swirling storms.\n\nJovian Storm Chasing: Experience the thrill of storm chasing as you navigate Jupiter's turbulent atmosphere with our expert pilot and atmospheric scientists. Witness the iconic Great Red Spot and other mesmerizing features.\n\nMoons of Jupiter: Explore Jupiter's fascinating moon system, including the volcanic moon Io, the icy Europa, and the mysterious Ganymede. Land on select moons and uncover their unique secrets.\n\nJovian Science: Contribute to groundbreaking research by studying Jupiter's massive magnetic field, its extensive system of rings, and its diverse cloud formations. Your journey may hold clues to the planet's formation and evolution.\n\nJovian Cuisine: Savor gourmet meals inspired by the elements of Jupiter, featuring dishes like 'Stormy Skies Soufflé' and 'Ganymede Gourmet,' enjoyed in a specially designed dining area with panoramic views of Jupiter.\n\nJovian Souvenirs: Explore our onboard gift shop for exclusive Jupiter-themed merchandise, including celestial jewelry, space gear, and educational items to remember your adventure.\n\nTravel Information:\n\nDuration: 30-day tour\nDeparture: Earth's spaceport\nPricing: Contact our reservation team for current pricing and availability.\nBooking: Secure your place on this unique journey by contacting our reservations team at [Contact Information]. Limited spots are available, so book early to reserve your place.\n\nSafety First:\nYour safety is our highest priority. Our spacecraft are equipped with advanced safety measures to protect you from the extreme conditions of Jupiter. Our experienced guides and scientists ensure a secure and educational experience.\n\nPrepare for the Journey of a Lifetime:\nPack your sense of wonder, space enthusiasm, and an adventurous spirit. Our team will provide pre-travel information to prepare you for this once-in-a-lifetime Jovian expedition.\n\nJoin Us on a Journey to Jupiter:\nDon't miss the opportunity to explore Jupiter, the gas giant. Reserve your spot today and embark on a Jovian adventure that will leave you with memories to cherish forever. Witness the grandeur, mystery, and vastness of Jupiter with us.\n\nDisclaimer: Jovian travel involves inherent risks. Participants must meet physical and health requirements. All activities are subject to spacecraft availability and favorable celestial conditions. Our team reserves the right to make necessary adjustments to ensure the safety and enjoyment of all Jovian explorers."
      ],
      [
        "lib/assets/mars.png",
        "Mars Expedition: Your Ultimate Martian Adventure\n\nWelcome to the next frontier of space exploration! Get ready for an extraordinary journey to the Red Planet, Mars. This brochure is your comprehensive guide to the adventure of a lifetime.\n\nDestination: Mars\n\nOverview:\nMars, the enigmatic and mysterious Red Planet, beckons us with its promise of discovery and adventure. Now, you have the chance to explore its rugged beauty up close. This tour offers a unique opportunity to become a part of the Martian story.\n\nTour Highlights:\n\nMartian Landing: Begin your adventure with an awe-inspiring landing on the Martian surface aboard our state-of-the-art spacecraft. Feel the thrill as you set foot on Mars and gaze upon the Martian landscape.\n\nMartian Surface Exploration: Roam the Martian terrain in specially designed rovers, uncovering the secrets of this unique world. Marvel at its rusty red deserts, towering canyons, and ancient riverbeds. Collect Martian soil samples and study its geology.\n\nMartian Science: Contribute to ongoing Martian research by assisting scientists with experiments on Martian geology, climate, and potential signs of past life. Your journey may hold the key to unlocking Martian mysteries.\n\nOlympus Mons Expedition: Embark on an exhilarating expedition to explore Olympus Mons, the largest volcano in the solar system. Stand in the shadows of towering Martian mountains and learn about the planet's volcanic history.\n\nMartian Habitat Visit: Tour a simulated Martian habitat and experience life on the Red Planet firsthand. Learn about the challenges and possibilities of future human colonization of Mars.\n\nMartian Cuisine: Savor gourmet Martian-inspired meals, featuring dishes like 'Red Planet Roast' and 'Martian Melon Delight,' enjoyed in a specially designed Martian dining area with panoramic Martian views.\n\nMartian Souvenirs: Explore our onboard gift shop for exclusive Martian-themed merchandise, including Martian rock jewelry, space gear, and educational items to remember your adventure.\n\nTravel Information:\n\nDuration: 21-day tour\nDeparture: Earth's spaceport\nPricing: Contact our reservation team for current pricing and availability.\nBooking: Secure your place on this unique journey by contacting our reservations team at [Contact Information]. Limited spots are available, so book early to reserve your place.\n\nSafety First:\nYour safety is our highest priority. Our spacecraft and rovers are equipped with advanced safety measures to protect you from Martian conditions. Our experienced guides and scientists ensure a secure and educational experience.\n\nPrepare for the Journey of a Lifetime:\nPack your sense of wonder, space enthusiasm, and an adventurous spirit. Our team will provide pre-travel information to prepare you for this once-in-a-lifetime Martian expedition.\n\nJoin Us on a Journey to Mars:\nDon't miss the opportunity to explore Mars, the Red Planet. Reserve your spot today and embark on a Martian adventure that will leave you with memories to cherish forever. Witness the beauty, mystery, and potential of Mars with us.\n\nDisclaimer: Martian travel involves inherent risks. Participants must meet physical and health requirements. All activities are subject to spacecraft availability and favorable Martian conditions. Our team reserves the right to make necessary adjustments to ensure the safety and enjoyment of all Martian explorers."
      ],
      [
        "lib/assets/moon.png",
        "Moon Odyssey: Your Ultimate Lunar Adventure\n\nWelcome to the lunar frontier! Get ready for an extraordinary journey to Earth's celestial companion, the Moon. This brochure is your comprehensive guide to the adventure of a lifetime.\n\nDestination: The Moon\n\nOverview:\nThe Moon, our closest neighbor in space, is a world of lunar mysteries and breathtaking landscapes. Now, you have the chance to explore its enigmatic beauty up close. This tour offers a unique opportunity to discover the wonders of our lunar neighbor.\n\nTour Highlights:\n\nLunar Arrival: Begin your adventure with a thrilling lunar arrival aboard our cutting-edge lunar lander. Experience the awe-inspiring moment as you set foot on the Moon's surface and gaze at the Earth from the lunar vantage point.\n\nLunar Surface Exploration: Explore the Moon's remarkable landscapes, including vast lunar plains, towering craters, and ancient lunar mountains. Collect lunar soil samples and walk in the footsteps of the Apollo astronauts.\n\nLunar Science: Contribute to lunar research by conducting experiments on the Moon's geology, magnetic field, and cosmic environment. Your journey may provide valuable insights into the history of our solar system.\n\nLunar Rover Expedition: Hop aboard our lunar rovers and embark on an exciting expedition to explore the Moon's more remote areas. Traverse the lunar terrain with expert guides and scientists.\n\nLunar Base Visit: Tour a simulated lunar base and experience life on the Moon firsthand. Learn about the challenges and possibilities of human colonization of our celestial neighbor.\n\nLunar Cuisine: Savor gourmet lunar-themed meals, featuring dishes like 'Meteorite Munch' and 'Cosmic Creamery,' enjoyed in a specially designed lunar dining area with panoramic views of the lunar landscape.\n\nLunar Souvenirs: Explore our onboard gift shop for exclusive lunar-themed merchandise, including lunar rock jewelry, space gear, and educational items to remember your adventure.\n\nTravel Information:\n\nDuration: 10-day tour\nDeparture: Earth's spaceport\nPricing: Contact our reservation team for current pricing and availability.\nBooking: Secure your place on this unique journey by contacting our reservations team at [Contact Information]. Limited spots are available, so book early to reserve your place.\n\nSafety First:\nYour safety is our highest priority. Our lunar landers and rovers are equipped with advanced safety measures to protect you from lunar conditions. Our experienced guides and scientists ensure a secure and educational experience.\n\nPrepare for the Journey of a Lifetime:\nPack your sense of wonder, space enthusiasm, and an adventurous spirit. Our team will provide pre-travel information to prepare you for this once-in-a-lifetime lunar expedition.\n\nJoin Us on a Journey to the Moon:\nDon't miss the opportunity to explore the Moon, our celestial companion. Reserve your spot today and embark on a lunar adventure that will leave you with memories to cherish forever. Witness the beauty and mysteries of the Moon with us.\n\nDisclaimer: Lunar travel involves inherent risks. Participants must meet physical and health requirements. All activities are subject to spacecraft availability and favorable lunar conditions. Our team reserves the right to make necessary adjustments to ensure the safety and enjoyment of all lunar travelers."
      ],
      [
        "lib/assets/earth2.jpg",
        "Earth Explorer: Your Ultimate Adventure on Our Home Planet\n\nWelcome to the ultimate terrestrial adventure! Get ready for an extraordinary journey to explore the wonders of our own planet Earth. This brochure is your comprehensive guide to the adventure of a lifetime.\n\nDestination: Earth\n\nOverview:\nEarth, the blue jewel of our solar system, is a planet of incredible diversity. Now, you have the chance to immerse yourself in its natural beauty up close. This tour offers a unique opportunity to discover the many wonders of our home planet.\n\nTour Highlights:\n\nEarth Flyby: Begin your adventure with a breathtaking flyby of Earth aboard our state-of-the-art aircraft. Experience the majesty of our planet from the skies and witness its stunning landscapes from a unique perspective.\n\nTerrestrial Exploration: Touch down on Earth's diverse landscapes with our specially designed land vehicles. Discover its lush forests, expansive deserts, towering mountains, and pristine coastlines. Immerse yourself in the beauty of our planet and collect unique natural specimens.\n\nOceanic Expedition: Dive into the depths of Earth's oceans and explore the mesmerizing underwater world. Encounter marine life in its natural habitat, accompanied by our expert marine biologists and oceanographers.\n\nVolcano Adventure: Explore active and dormant volcanoes on Earth, some of the most fascinating geological features on our planet. Witness the power of nature and learn about the Earth's fiery past.\n\nScientific Discovery: Contribute to ongoing research by collecting data on Earth's ecosystems, geology, and climate. Your journey may provide valuable insights into the preservation of our planet.\n\nEarthly Cuisine: Savor gourmet meals inspired by Earth's unique elements, featuring dishes like 'Oceanic Delight' and 'Forest Forage Feast,' enjoyed in specially designed dining areas with stunning natural views.\n\nEarthly Souvenirs: Explore our onboard gift shop for exclusive Earth-themed merchandise, including gemstone jewelry, clothing, and educational items to remember your adventure.\n\nTravel Information:\n\nDuration: 14-day tour\nDeparture: Earth's natural wonders\nPricing: Contact our reservation team for current pricing and availability.\nBooking: Secure your place on this unique journey by contacting our reservations team at [Contact Information]. Limited spots are available, so book early to reserve your place.\n\nSafety First:\nYour safety is our highest priority. Our vehicles are equipped with advanced safety measures to protect you from Earth's varying conditions. Our experienced guides and scientists ensure a secure and educational experience.\n\nPrepare for the Journey of a Lifetime:\nPack your curiosity, sense of wonder, and an adventurous spirit. Our team will provide pre-travel information to prepare you for this once-in-a-lifetime expedition.\n\nJoin Us on a Journey to Earth:\nDon't miss the opportunity to explore Earth, our precious home. Reserve your spot today and embark on an adventure that will leave you with memories to cherish forever. Witness the beauty and diversity of Earth with us.\n\nDisclaimer: Earth travel involves inherent risks. Participants must meet physical and health requirements. All activities are subject to vehicle availability and favorable weather conditions. Our team reserves the right to make necessary adjustments to ensure the safety and enjoyment of all travelers."
      ],
      [
        "lib/assets/venus.png",
        "Journey to Venus: Your Ultimate Space Tourism Adventure\n\nWelcome to the future of space tourism! Get ready for an extraordinary voyage to the fiery world of Venus. This brochure "
            "is your comprehensive guide to the adventure of a lifetime.\n\nDestination: Venus\n\nOverview:\nVenus, often called Earth's twin, is a planet of extremes."
            " Now, you have the chance to explore its enigmatic beauty up close. This tour offers a unique opportunity to unravel the mysteries of this scorching world.\n\nTour Highlights:\n\n1"
            ". Venus Flyby: Begin your adventure with a thrilling flyby of Venus aboard our advanced spacecraft. Experience the sheer power of Venus' thick atmosphere and witness its brilliant glow from a safe distance.\n\n2. Venusian Surface Exploration: Touch down on Venus's surface with our specially designed lander. Discover its rugged terrain, vast plains, and volcanic landscapes. Immerse yourself in an alien world and collect unique geological samples.\n\n3. Atmospheric Adventure: Embark on an exhilarating journey through Venus' atmosphere. Feel the heat and pressure as you navigate this turbulent sea of clouds, accompanied by our expert pilot and atmospheric scientists.\n\n4. Volcano Expedition: Explore the towering volcanoes of Venus, some of the most massive in the solar system. Witness the remnants of ancient eruptions and learn about the planet's fiery past.\n\n5. Scientific Discovery: Contribute to ongoing research by collecting data on Venus's atmosphere, geology, and climate. Your journey may provide valuable insights into the history of our solar system.\n\n6. Venusian Cuisine: Savor gourmet meals inspired by Venus' unique elements, featuring dishes like 'Solar Flare Sizzle' and 'Sulfuric Spice Delight,' enjoyed in a specially designed dining area.\n\n7. Venusian Souvenirs: Explore our onboard gift shop for exclusive Venus-themed merchandise, including volcanic rock jewelry, clothing, and educational items to remember your adventure.\n\nTravel Information:\n\n- Duration: 14-day tour\n- Departure: Earth's spaceport\n- Pricing: Contact our reservation team for current pricing and availability.\n- Booking: Secure your place on this unique journey by contacting our reservations team at [Contact Information]. Limited spots are available, so book early to reserve your place.\n\nSafety First:\nYour safety is our highest priority. Our spacecraft are equipped with advanced safety measures to protect you from Venus' extreme conditions. Our experienced guides and scientists ensure a secure and educational experience.\n\nPrepare for the Journey of a Lifetime:\nPack your curiosity, sense of wonder, and an adventurous spirit. Our team will provide pre-travel information to prepare you for this once-in-a-lifetime expedition.\n\nJoin Us on a Journey to Venus:\nDon't miss the opportunity to explore Venus, the fiery jewel of our solar system. Reserve your spot today and embark on a space tourism adventure that will leave you with memories to cherish forever. Witness the beauty, mystery, and extremes of Venus with us.\n\nDisclaimer: Space travel involves inherent risks. Participants must meet physical and health requirements. All activities are subject to spacecraft availability and favorable celestial conditions. Our team reserves the right to make necessary adjustments to ensure the safety and enjoyment of all passengers.",
      ],
      [
        "lib/assets/mercury.png",
        "Journey to Mercury\n\n Your Extraordinary Space Tourism ExpeditionWelcome to a world of extraordinary space tourism! Prepare for an awe-inspiring adventure as we take you"
            " on a voyage to Mercury, the closest planet to the Sun. This brochure will provide you with all the details you need to embark on this incredible journey\n\nDestination: Mercury\n\n"
            "Overview:Mercury, a planet of extremes, awaits your exploration. Experience the rugged beauty and unique features of this mysterious world up close. Join us on a remarkable journey to "
            "unlock the secrets of Mercury.Tour Highlights\n\n1. Mercury Orbit Arrival\n\nYour journey begins as you enter orbit around Mercury. Marvel at the planet's stunning surface, with its craters"
            ", cliffs, and vast plains. Get ready for a one-of-a-kind adventure\n\n2. Close Encounters with Craters\n\nTouch down on the surface of Mercury and explore its dramatic landscape. Visit iconic "
            "craters like the Caloris Basin and experience the stark contrast between the scorching daylight and chilling nights\n\n3. Spacewalk on Mercury\n\nSuit up and step out onto the surface of Mercury "
            "for an unforgettable spacewalk. Feel the unique gravitational pull as you collect samples and take in the otherworldly vistas\n\n4. Geothermal Exploration\n\nExplore the geothermal wonders of Mercury"
            ", including its mysterious volcanic features. Witness the mesmerizing colors and formations created by ancient lava flows\n\n5. Planet Mercury Science Workshops\n\nEngage with our team of planetary scientists"
            " in workshops that delve into Mercury's history, geology, and its significance in understanding our solar system's evolution\n\n6. Interstellar Dining\n\nIndulge in a dining experience like no other. Savor"
            " a menu inspired by the planet's elements, featuring dishes infused with the essence of Mercury's rocky terrain\n\n7. Mercury-themed Souvenirs\n\nVisit our onboard gift shop to take home exclusive "
            "Mercury-themed mementos, including meteorite samples, unique jewelry, and educational items to commemorate your extraordinary journey\n\nTravel Information\n\nDuration: 10-day\n\n tourDeparture: Earth's spaceportPricing\n\n Contact our reservation team for current pricing and availability\n\n"
            "Booking: Secure your seat on this extraordinary journey by reaching out to our reservations team at [Contact Information]. Limited spots are available,"
            " so book your adventure today to ensure your place in history\n\nSafety First:Your safety is paramount. Our spacecraft are equipped with advanced technology to protect"
            " you from Mercury's harsh conditions, including extreme temperatures and radiation. Our experienced guides and scientists will ensure your"
            " safety throughout the expedition.Prepare for the Adventure:Pack your sense of wonder, curiosity, and a thirst for discovery. Our team will provide you with comprehensive pre-travel information to prepare for"
            " this unforgettable expedition.Join Us on a Journey to Mercury:Don't miss this unique opportunity to explore Mercury, the enigmatic planet closest to the Sun. Reserve your place today and embark on a"
            " space tourism adventure that will leave you with memories of Mercury's beauty and mysteries to cherish forever. Experience the wonder of Mercury with us.Disclaimer: Space travel involves inherent risks. Participants must"
            " meet physical and health requirements. All activities are subject to safety protocols and planetary conditions. Our team reserves the right to make necessary adjustments to ensure the safety and enjoyment of all passengers\n\n",
      ],
      [
        "lib/assets/sun.png",
        "Experience the Majesty of the Sun\n\n Your Ultimate Space Tourism Adventure\n\nWelcome to the future of space tourism! Prepare for an unforgettable journey to the heart"
            " of our solar system and experience the awe-inspiring wonder of the Sun. This brochure will provide you with all the information you need to"
            " embark on this once-in-a-lifetime adventure\n\nDestination: The Sun\n\nOverview\n\nThe Sun our closest star, has captivated humanity for"
            " centuries. Now, it's your turn to get up close and personal with the Sun's scorching beauty. This tour offers an unprecedented opportunity to"
            " explore the mysteries of this celestial giant\n\nTour Highlights\n\n1. Solar Orbiter Flyby\n\nYou'll begin your journey with a breathtaking flyby"
            " of the Solar Orbiter spacecraft, offering a unique perspective on our star. Witness mesmerizing solar flares and the ever-changing surface of the"
            " Sun from a safe distance\n\n2. Solar Observatory Visit\n\nStep into our state-of-the-art solar observatory module and observe the"
            " Sun like never before. Our cutting-edge telescopes provide stunning, real-time views of the Sun's surface and activity. Witness sunspots"
            ", solar prominences, and more with the guidance of our expert astronomers\n\n3. Solar Flare Chase\n\nExperience the thrill of chasing solar flares as"
            " our specially equipped spacecraft takes you on a journey toward the Sun's outer atmosphere. Feel the heat and see the brilliance of these natural fireworks"
            " up close\n\n4. Solar Science Workshops\n\nParticipate in engaging workshops led by our team of solar scientists. Learn about"
            " the Sun's vital role in our solar system, its fusion processes, and its influence on Earth's climate\n\n5. Sunbathing in Space\n\nFor the ultimate adventure,"
            " don a specially designed space suit and embark on a guided spacewalk. Bask in the Sun's radiant glow and capture breathtaking selfies with the Sun in the background\n\n"
            "6. Stellar Cuisine\n\nIndulge in an out-of-this-world dining experience with a selection of dishes inspired by the Sun's elements"
            ". Savor the flavors of hydrogen, helium, and cosmic energy in a zero-gravity dining area\n\n 7. Solar Souvenirs\n\nBrowse our onboard gift shop for"
            " exclusive solar-themed merchandise, including solar flare-themed clothing, jewelry, and educational items to commemorate your journey\n\nTravel Information:Duration: 7-day"
            " tour\n\nDeparture: Earth's spaceport\n\nPricing: Contact our reservation team for current pricing and availability\n\nBooking: Secure your spot on this remarkable"
            " journey by contacting our reservations team at [Contact Information]\n\n Spaces are limited\n\n so book now to avoid disappointment\n\nSafety First\n\nYour safety is our top priority. Our"
            " spacecraft are equipped with advanced shielding and cooling systems to protect you from the Sun's intense radiation and heat. Our experienced guides and scientists are dedicated to ensuring a safe and unforgettable"
            " experience\n\nPrepare for the Journey of a Lifetime:Pack your sense of wonder, curiosity, and a thirst for adventure. Our team will provide detailed pre-travel information to prepare"
            " you for this once-in-a-lifetime expedition\n\nJoin Us on a Journey to the Sun:on't miss the opportunity to explore the Sun, the heart of our solar system, like never before. Reserve your spot"
            " today and embark on a space tourism adventure that will leave you with memories to last a lifetime. Witness the beauty, power, and majesty of the Sun with us.\n\nDisclaimer: Space travel involves inherent risks. Participants must meet"
            " physical and health requirements. All activities are subject to weather conditions and solar activity. Our team reserves the right to make necessary adjustments to ensure the safety of all passengers\n\n"
      ],
    ];

    return ListView.builder(
      controller: _scrollController,
      reverse: false, // Reverse the list so it starts at the bottom.
      itemCount: planetDesc
          .length, // Replace with the number of floors in your elevator.
      itemBuilder: (BuildContext context, int index) {
        return contents(context, planetlis[index][0], planetlis[index][1],
            planetlis[index][2], planetDesc[index][0], planetDesc[index][1]);
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
