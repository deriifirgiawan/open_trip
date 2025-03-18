import 'package:open_trip/models/TripDataModel.dart';

final List<TripModel> trips = [
  TripModel(
    id: 1,
    title: "Menjelajah Raja Ampat 4H3M",
    photo:
        "https://images.unsplash.com/photo-1613382237354-eaebbebe6eba?q=80&w=2160&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    photos: [
      "https://images.unsplash.com/photo-1613382237354-eaebbebe6eba?q=80&w=2160&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://images.unsplash.com/photo-1570789210967-2cac24afeb00?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://images.unsplash.com/photo-1516690561799-46d8f74f9abf?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    ],
    price: 5000000,
    rating: 4.8,
    reviews: 120,
    type: "Open Trip",
    description:
        "Jelajahi keindahan bawah laut Raja Ampat dengan snorkeling dan diving.",
    includes: [
      "Transportasi",
      "Penginapan",
      "Makan 3x sehari",
      "Pemandu wisata"
    ],
    excludes: ["Tiket pesawat", "Pengeluaran pribadi"],
    terms: "Minimal 4 orang, pembatalan max H-7 dengan refund 50%.",
    totalPax: Pax(min: 4, max: 10),
  ),
  TripModel(
    id: 2,
    title: "Berburu Sunrise di Bromo 2H1M",
    photo:
        "https://images.unsplash.com/photo-1588668214407-6ea9a6d8c272?q=80&w=2942&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    photos: [
      "https://images.unsplash.com/photo-1588668214407-6ea9a6d8c272?q=80&w=2942&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://images.unsplash.com/photo-1626515405049-535c04fae38d?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    ],
    price: 750000,
    rating: 4.5,
    reviews: 95,
    type: "Private Trip",
    description:
        "Nikmati matahari terbit di Bromo dengan jeep tour dan trekking ke kawah.",
    includes: ["Jeep Bromo", "Tiket masuk", "Sarapan"],
    excludes: ["Transportasi ke meeting point", "Pengeluaran pribadi"],
    terms: "Minimal 2 orang, tidak ada refund setelah booking.",
    totalPax: Pax(min: 2, max: 8),
  ),
  TripModel(
    id: 3,
    title: "Gass Labuan Bajo 3H2M",
    photos: [
      "https://images.unsplash.com/photo-1619880889144-d6e252999afa?q=80&w=3174&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://images.unsplash.com/photo-1602486493959-78e7be266a62?q=80&w=3024&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://images.unsplash.com/photo-1535779023901-a39d15762564?q=80&w=3174&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    ],
    photo:
        "https://images.unsplash.com/photo-1619880889144-d6e252999afa?q=80&w=3174&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    price: 3200000,
    rating: 4.7,
    reviews: 150,
    type: "Open Trip",
    description:
        "Sailing Komodo, snorkeling di Pink Beach, dan menikmati sunset di Padar.",
    includes: ["Sailing boat", "Makan", "Guide", "Tiket masuk Pulau Komodo"],
    excludes: ["Tiket pesawat", "Pengeluaran pribadi"],
    terms: "Minimal 6 orang, pembatalan max H-10 dengan refund 70%.",
    totalPax: Pax(min: 6, max: 15),
  ),
  TripModel(
    id: 4,
    title: "Kenalan dengan Pulau Derawan 3H2M",
    photo:
        "https://plus.unsplash.com/premium_photo-1668883188861-39974ed9ad99?q=80&w=2400&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    photos: [
      "https://plus.unsplash.com/premium_photo-1668883188861-39974ed9ad99?q=80&w=2400&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://images.unsplash.com/photo-1628413188069-383190077d18?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    ],
    price: 2700000,
    rating: 4.6,
    reviews: 85,
    type: "Open Trip",
    description:
        "Snorkeling di Pulau Derawan dan melihat ubur-ubur di Danau Kakaban.",
    includes: ["Transportasi laut", "Penginapan", "Makan", "Tour guide"],
    excludes: ["Tiket pesawat", "Pengeluaran pribadi"],
    terms: "Minimal 5 orang, pembatalan max H-5 dengan refund 60%.",
    totalPax: Pax(min: 5, max: 12),
  ),
  TripModel(
    id: 5,
    title: "Ekspedisi ke Dieng 2H1M",
    photo:
        "https://images.unsplash.com/photo-1571738318198-fda6afce5348?q=80&w=3164&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    photos: [
      "https://images.unsplash.com/photo-1571738318198-fda6afce5348?q=80&w=3164&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://unsplash.com/photos/aerial-view-of-lake-surrounded-by-mountains-during-daytime--hHdHfVjOC4"
    ],
    price: 950000,
    rating: 4.3,
    reviews: 70,
    type: "Private Trip",
    description:
        "Menikmati sunrise di Sikunir, Telaga Warna, dan Kawah Sikidang.",
    includes: [
      "Transportasi dari meeting point",
      "Penginapan",
      "Tiket masuk wisata"
    ],
    excludes: ["Makan di luar itinerary", "Pengeluaran pribadi"],
    terms: "Minimal 3 orang, tidak ada refund setelah booking.",
    totalPax: Pax(min: 3, max: 10),
  ),
];
