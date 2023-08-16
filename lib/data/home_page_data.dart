import 'models/pet_data_model.dart';

class HomepageData {
  static List<PetDetailModel> petsList = [];
  static String searchTerm = "";
  static int lastIndex = 0;
  static bool isLoading = false;

  static final List<PetDetailModel> petDetailsDatabase = [
    PetDetailModel(
      id: 1,
      name: "Buddy",
      species: "dog",
      breed: "Golden Retriever",
      age: 3,
      location: "New York",
      originCountry: "United States",
      price: 500,
      height: "22-24 inches",
      weight: "55-75 pounds",
      imageUrl:
          "https://www.pngmart.com/files/8/Golden-Retriever-PNG-Transparent-Images.png",
    ),
    PetDetailModel(
      id: 2,
      name: "Whiskers",
      species: "cat",
      breed: "Siamese",
      age: 2,
      location: "Los Angeles",
      originCountry: "Thailand",
      price: 200,
      height: "8-10 inches",
      weight: "8-12 pounds",
      imageUrl:
          "https://cdn.pixabay.com/photo/2020/09/10/09/42/siamese-5559874_1280.png",
    ),
    PetDetailModel(
      id: 3,
      name: "Rocky",
      species: "dog",
      breed: "Labrador Retriever",
      age: 4,
      location: "Chicago",
      originCountry: "Canada",
      price: 450,
      height: "21.5-24.5 inches",
      weight: "55-80 pounds",
      imageUrl:
          "https://www.pngall.com/wp-content/uploads/4/Labrador-Retriever-PNG.png",
    ),
    PetDetailModel(
      id: 4,
      name: "Fluffy",
      species: "cat",
      breed: "Persian",
      age: 1,
      location: "Houston",
      originCountry: "Iran",
      price: 150,
      height: "9-11 inches",
      weight: "7-12 pounds",
      imageUrl:
          "https://static.vecteezy.com/system/resources/previews/024/077/588/original/persian-cat-clipart-ai-generated-free-png.png",
    ),
    PetDetailModel(
      id: 5,
      name: "Max",
      species: "dog",
      breed: "German Shepherd",
      age: 2,
      location: "Miami",
      originCountry: "Germany",
      price: 400,
      height: "22-26 inches",
      weight: "50-90 pounds",
      imageUrl:
          "https://static.vecteezy.com/system/resources/previews/012/893/835/original/german-shepherd-dog-transparent-background-free-png.png",
    ),
    PetDetailModel(
      id: 6,
      name: "Luna",
      species: "cat",
      breed: "Maine Coon",
      age: 3,
      location: "Seattle",
      originCountry: "United States",
      price: 250,
      height: "10-16 inches",
      weight: "8-18 pounds",
      imageUrl:
          "https://static.vecteezy.com/system/resources/previews/024/387/805/original/watercolor-painting-of-maine-coon-cat-isolated-transparent-background-digital-art-image-file-format-ai-generative-png.png",
    ),
    PetDetailModel(
      id: 7,
      name: "Charlie",
      species: "dog",
      breed: "Poodle",
      age: 5,
      location: "Boston",
      originCountry: "France",
      price: 300,
      height: "9-24 inches",
      weight: "6-70 pounds",
      imageUrl:
          "https://www.pngall.com/wp-content/uploads/5/White-Poodle-PNG.png",
    ),
    PetDetailModel(
      id: 8,
      name: "Mittens",
      species: "cat",
      breed: "Ragdoll",
      age: 2,
      location: "San Francisco",
      originCountry: "United States",
      price: 180,
      height: "9-11 inches",
      weight: "10-20 pounds",
      imageUrl:
          "https://www.pngall.com/wp-content/uploads/6/Ragdoll-Cat-PNG-Photo.png",
    ),
    PetDetailModel(
      id: 9,
      name: "Oliver",
      species: "dog",
      breed: "Beagle",
      age: 1,
      location: "Denver",
      originCountry: "United Kingdom",
      price: 350,
      height: "13-15 inches",
      weight: "18-30 pounds",
      imageUrl:
          "https://www.pngall.com/wp-content/uploads/4/Beagle-PNG-Image.png",
    ),
    PetDetailModel(
      id: 10,
      name: "Simba",
      species: "cat",
      breed: "Bengal",
      age: 2,
      location: "Dallas",
      originCountry: "India",
      price: 300,
      height: "9-10 inches",
      weight: "8-15 pounds",
      imageUrl: "https://www.pngmart.com/files/22/Bengal-Cats-PNG-Image.png",
    ),
    PetDetailModel(
      id: 11,
      name: "Lucky",
      species: "dog",
      breed: "Shih Tzu",
      age: 4,
      location: "Atlanta",
      originCountry: "Tibet",
      price: 280,
      height: "9-10.5 inches",
      weight: "9-16 pounds",
      imageUrl:
          "https://www.pngmart.com/files/12/Cute-Shih-Tzu-PNG-Transparent-Image.png",
    ),
    PetDetailModel(
      id: 12,
      name: "Cleo",
      species: "cat",
      breed: "Sphynx",
      age: 2,
      location: "Phoenix",
      originCountry: "Canada",
      price: 400,
      height: "8-10 inches",
      weight: "6-12 pounds",
      imageUrl:
          "https://www.pngall.com/wp-content/uploads/6/Sphynx-Cat-PNG-Image.png",
    ),
    PetDetailModel(
      id: 13,
      name: "Bailey",
      species: "dog",
      breed: "Cocker Spaniel",
      age: 3,
      location: "Philadelphia",
      originCountry: "United States",
      price: 320,
      height: "13.5-15.5 inches",
      weight: "20-30 pounds",
      imageUrl:
          "https://i.pinimg.com/originals/5e/14/d5/5e14d5e2c8a17a95fcf3477b81457008.png",
    ),
    PetDetailModel(
      id: 14,
      name: "Milo",
      species: "cat",
      breed: "Scottish Fold",
      age: 1,
      location: "Washington, D.C.",
      originCountry: "United Kingdom",
      price: 250,
      height: "8-11 inches",
      weight: "6-13 pounds",
      imageUrl:
          "https://cdn.pixabay.com/photo/2023/01/29/15/08/cat-7753428_960_720.png",
    ),
    PetDetailModel(
      id: 15,
      name: "Duke",
      species: "dog",
      breed: "Bulldog",
      age: 2,
      location: "Detroit",
      originCountry: "United Kingdom",
      price: 450,
      height: "12-16 inches",
      weight: "40-55 pounds",
      imageUrl: "https://pngimg.com/d/bulldog_PNG9.png",
    ),
    PetDetailModel(
      id: 16,
      name: "Molly",
      species: "dog",
      breed: "Poodle",
      age: 3,
      location: "Chicago",
      originCountry: "France",
      price: 380,
      height: "10-22 inches",
      weight: "10-70 pounds",
      imageUrl:
          "https://creazilla-store.fra1.digitaloceanspaces.com/cliparts/4789/poodle-clipart-md.png",
    ),
    PetDetailModel(
      id: 17,
      name: "Leo",
      species: "cat",
      breed: "Persian",
      age: 2,
      location: "Miami",
      originCountry: "Iran",
      price: 230,
      height: "9-11 inches",
      weight: "7-15 pounds",
      imageUrl:
          "https://www.pngall.com/wp-content/uploads/6/Persian-Cat-PNG-Picture.png",
    ),
    PetDetailModel(
      id: 18,
      name: "Rosie",
      species: "dog",
      breed: "Labrador Retriever",
      age: 1,
      location: "Los Angeles",
      originCountry: "Canada",
      price: 480,
      height: "21.5-24.5 inches",
      weight: "55-80 pounds",
      imageUrl: "https://pngimg.com/d/labrador_retriever_PNG66.png",
    ),
    PetDetailModel(
      id: 19,
      name: "Oscar",
      species: "cat",
      breed: "Maine Coon",
      age: 4,
      location: "New York",
      originCountry: "United States",
      price: 300,
      height: "10-16 inches",
      weight: "10-25 pounds",
      imageUrl:
          "https://www.pngall.com/wp-content/uploads/6/Maine-Coon-Cat-PNG-Picture.png",
    ),
    PetDetailModel(
      id: 20,
      name: "Ziggy",
      species: "dog",
      breed: "Beagle",
      age: 2,
      location: "Seattle",
      originCountry: "United Kingdom",
      price: 320,
      height: "13-16 inches",
      weight: "20-30 pounds",
      imageUrl:
          "https://www.pngarts.com/files/3/Beagle-PNG-Image-Background.png",
    ),
  ];
}